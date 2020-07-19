import 'package:flutter/material.dart';

class ColorUtil {
  static Color rgb(int red, int green, int blue) {
    return Color.fromARGB(255, red, green, blue);
  }

  static LinearGradient gradient({Color startColor, Color endColor}) {
    return LinearGradient(
        colors: [
          startColor,
          endColor,
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp);
  }
}
