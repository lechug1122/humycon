import 'package:flutter/material.dart';

class ColorConstants {
  static Color color1 = hexToColor('##412a9c');
  static Color color2 = hexToColor('##1b66ff');
  static Color color3 = hexToColor('##00cef5');
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
