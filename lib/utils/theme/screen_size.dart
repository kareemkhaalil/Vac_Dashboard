import 'package:flutter/material.dart';

class ScreenSize {
  final double height;
  final double width;
  late final double oneHeightUnit;
  late final double oneWidthUnit;

  ScreenSize({
    required this.height,
    required this.width,
  }) {
    oneHeightUnit = 1 / height;
    oneWidthUnit = 1 / width;
  }
}

ScreenSize getScreenSize(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;
  return ScreenSize(height: screenSize.height, width: screenSize.width);
}
