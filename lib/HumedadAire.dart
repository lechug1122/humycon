import 'package:flutter/material.dart';

class HumedadAire extends StatefulWidget {
  const HumedadAire({Key? key}) : super(key: key);

  @override
  _HumedadAireState createState() => _HumedadAireState();
}

class _HumedadAireState extends State<HumedadAire> {
  @override
  void initState() {
    super.initState();
    // Inicia la escucha de datos cuando se abre esta pantalla
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
      // Resto de la interfaz de usuario
    );
  }
}
