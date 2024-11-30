import 'package:flutter/material.dart';

class SizeConfig {
  static late Size _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double pixelRatio;
  static double? defaultSize;
  static bool get isMobile => screenWidth <= 428;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.sizeOf(context);
    screenWidth = _mediaQueryData.width;
    screenHeight = _mediaQueryData.height;
    pixelRatio = MediaQuery.of(context).devicePixelRatio;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  final double screenHeight = SizeConfig.screenHeight;
  // 800 is the layout height that designer use
  return (inputHeight / 800.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  final double screenWidth = SizeConfig.screenWidth;
  // 360 is the layout width that designer use
  return (inputWidth / 360.0) * screenWidth;
}
