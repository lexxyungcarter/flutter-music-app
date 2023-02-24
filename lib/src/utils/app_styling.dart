import 'package:flutter/material.dart';

class AppStyling {
  static const pagePadding = EdgeInsets.only(top: 20, left: 15, right: 15);
  static const pageSidePadding = EdgeInsets.symmetric(horizontal: 20);
  static const pageTopPadding = EdgeInsets.only(top: 10);
  static const cardPadding = EdgeInsets.symmetric(horizontal: 15, vertical: 12);
  static const pageTopSpacer = SizedBox(height: 10);
  static const spacer = SizedBox(height: 20);
  static const spacerBottom = SizedBox(height: 100);
  static const spacerForms = SizedBox(height: 16);
  static const primaryColor = Color(0xff1e69c2);
  static const primaryColorLighter = Color.fromARGB(255, 90, 156, 238);
  static const darkBgGradient = <Color>[
    Color(0xFF606263),
    Color.fromARGB(255, 37, 39, 41),
    Color.fromARGB(255, 20, 21, 22),
  ];

  static final bgGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.deepPurple.shade800,
      Colors.deepPurple.shade300,
    ],
  );

  static final bgGradientSong = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.deepPurple.shade300,
      Colors.deepPurple.shade800,
    ],
  );

  static Widget spacerh({double height = 20}) => SizedBox(height: height);
}
