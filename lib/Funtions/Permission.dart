import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:humycon/Funtions/Bluetooth.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> connectToDevice(String bluetoothDeviceAddress) async {
  // Solicitar permiso BLUETOOTH_SCAN
  PermissionStatus permissionStatus = await Permission.bluetoothScan.request();

  // Si el permiso está concedido, intenta conectar con el dispositivo Bluetooth.
  if (permissionStatus.isGranted) {
    // Crear una conexión Bluetooth con el dispositivo.
    BluetoothConnection connection =
        await BluetoothConnection.toAddress(bluetoothDeviceAddress);

    // Si la conexión es exitosa, imprimir la dirección del dispositivo.
    if (connection != null) {
      print("Conectado al dispositivo: $bluetoothDeviceAddress");
    } else {
      print("No se pudo conectar al dispositivo: $bluetoothDeviceAddress");
    }
  } else {
    // El permiso no está concedido, maneja esto según tus necesidades.
  }
  // Conectar al dispositivo con la dirección 98:DA:60:03:A8:8C.
  BluetoothConnectionPage().connectToDevice("98:DA:60:03:A8:8C");
}
