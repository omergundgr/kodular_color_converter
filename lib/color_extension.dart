import 'package:flutter/material.dart';

extension ColorExtension on String {
  toColor() {
    var hexCode = isNotEmpty ? this : "000000";
    hexCode = "0XFF$hexCode".replaceAll("#", "");
    return Color(int.parse(hexCode));
  }

  convertInt() {
    var hexCode = isNotEmpty ? this : "000000";
    final buffer = StringBuffer();
    buffer.write(hexCode);
    return ((int.parse(buffer.toString(), radix: 16) * -1 + 16777216) * -1)
        .toString();
  }
}
