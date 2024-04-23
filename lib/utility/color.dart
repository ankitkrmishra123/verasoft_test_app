import 'dart:ui';

class ColorSelect {
  static const appColor = Color(0x00000000);
  static const white = Color(0xFFFFFFFF);
  static const unknownColor = Color(0xFF90CAF9);
  static final profileColor = HexColor.fromHex('#FFFFFF');
  //OR
  // final profileColor = Color(int.parse('0xFFFFFF', radix: 16));

  static final profileColorLocation = HexColor.fromHex('#000000');
  static final girdColor = HexColor.fromHex('#2291D6');
}


extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('FF');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}