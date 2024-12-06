import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData = MediaQueryData();
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double defaultSize = 0;
  static Orientation orientation = Orientation.portrait;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate width as per screen size 
double getPropScreenWidth(double size) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (size / 375.0) * screenWidth;
}

// Get the proportionate height as per screen size
double getPropScreenHeight(double size) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (size / 812.0) * screenHeight;
}

