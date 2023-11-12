import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:humycon/Funtions/Bluetooth.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HumedadSuelo extends StatefulWidget {
  const HumedadSuelo({Key? key}) : super(key: key);

  @override
  _HumedadSueloState createState() => _HumedadSueloState();
}

class _HumedadSueloState extends State<HumedadSuelo> {
  BluetoothConnection? connection;
  String? variableValue;
  StreamSubscription? _subscription;
  @override
  void initState() {
    super.initState();
    BluetoothConnectionPage().connectToDevice('98:DA:60:03:A8:8C');
    connectToDevice();
  }

  @override
  void dispose() {
    _subscription?.cancel();

    super.dispose();
  }

  Future<void> connectToDevice() async {
    // Get the address of the Bluetooth device.
    String address = "98:DA:60:03:A8:8C";

    // Create a BluetoothConnection object.
    connection = await BluetoothConnection.toAddress(address);

    if (connection != null) {
      // Start listening for data from the device.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Humedad del suelo"),
        backgroundColor: Colors.blue, // Cambia el color aquí
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            new CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 13.0,
              animation: true,
              percent: 0.7,
              center: new Text(
                variableValue ?? "Esperando datos...",
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              footer: new Text(
                "Humedad en la tierra",
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
            ),
          ],
        ),
      ),
      // Resto de la interfaz de usuario
    );
  }
}
