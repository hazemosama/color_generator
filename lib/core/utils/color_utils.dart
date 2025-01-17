import 'dart:math';

import 'package:flutter/material.dart';

/// This Function generates a random color
Color generateRandomColor() {
  final redValue = Random().nextInt(256);
  final greenValue = Random().nextInt(256);
  final blueValue = Random().nextInt(256);

  return Color.fromRGBO(redValue, greenValue, blueValue, 1);
}

/// luminance value that is used to determine the text color
const luminance = 0.3;

/// This Function returns the text color based on the background color
Color generateForegroundColor(Color backgroundColor) {
  return backgroundColor.computeLuminance() < luminance
      ? Colors.white
      : Colors.black;
}
