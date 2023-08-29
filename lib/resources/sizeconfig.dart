import 'package:flutter/material.dart';

class SizeConfig {
  BuildContext context;
  late double screenHeight;
  late double screenWidth;
  late EdgeInsets padding;
  late double safeAreaHeight;
  SizeConfig(this.context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    padding = MediaQuery.of(context).padding;
    safeAreaHeight = screenHeight - padding.top - padding.bottom;
  }

  double height(double value) {
    return screenHeight * value;
  }

  double width(double inputvalue) {
    return screenWidth * inputvalue;
  }

  // var heightt = MediaQuery.of(context).size.height;
}
