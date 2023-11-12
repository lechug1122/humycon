import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:humycon/Funtions/Bluetooth.dart';
import 'package:humycon/Funtions/boton1.dart';
import 'package:humycon/HumedadAire.dart';
import 'package:humycon/HumedadSuelo.dart';

void main() {
  runApp(const MyApp());
  void main() {
    runApp(MyApp());
    BluetoothConnectionPage();
    FlutterBluetoothSerial.instance
        .requestEnable(); // Solicitar habilitación de Bluetooth
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Pagina Principal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();

  @override
  void initState() {}
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ShinyButton(
                color: Colors.blue,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HumedadSuelo()));
                },
                child: Text(
                  "Humedad en la tierra",
                ),
              ),
              SizedBox(height: 20),
              ShinyButton(
                color: Colors.deepPurple,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HumedadAire()));
                },
                child: Text("Humedad en el aire"),
              ),
              SizedBox(
                height: 20,
              ),
              ShinyButton(
                  color: Colors.red,
                  onTap: () async {
                    await BluetoothConnectionPage()
                        .connectToDevice('98:DA:60:03:A8:8C');
                  },
                  child: Text("Conectar")),
            ],
          ),
        ),
      ),
    );
  }
}
