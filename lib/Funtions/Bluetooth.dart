import 'dart:typed_data';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothConnectionPage {
  Future<void> connectToDevice(String address) async {
    try {
      BluetoothConnection connection =
          await BluetoothConnection.toAddress(address);
      print('Connected to the device');

      connection.input?.listen((Uint8List data) {
        String receivedData = String.fromCharCodes(data);
        onDataReceived(receivedData);
        print('Data incoming: ${String.fromCharCodes(data)}');
        connection.output.add(data); // Sending data

        if (String.fromCharCodes(data).contains('!')) {
          connection.finish(); // Closing connection
          print('Disconnecting by local host');
        }
      }).onDone(() {
        print('Disconnected by remote request');
      });
    } catch (exception) {
      print('Cannot connect, exception occurred: $exception');
    }
  }

  void onDataReceived(String data) {
    final values =
        data.split(","); // Divide los valores utilizando la coma como separador

    if (values.length == 4) {
      final humidityAir = values[0];
      final temperatureAir = values[1];
      final temperatureSuelo = values[2];
      final humedadSuelo = values[3];
    }
  }
}
