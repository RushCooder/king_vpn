import 'package:flutter/material.dart';

class AppLightColor {
  // app color
  static Color primaryColor = Color(0xfff5f7fb);
  static Color secondaryColor = Color(0xfff2f3f7);
  // button color
  static Color buttonPrimaryColor = Color(0xff8765d2);
  static Color buttonSecondaryColor = Color(0xffb099e6);
  static var buttonColor = LinearGradient(
    colors: [buttonPrimaryColor, buttonSecondaryColor],
  );

  static Color primaryIconColor = Colors.white; 

  // text color
  static Color textPrimaryColor = Color(0xff030306);
  static Color textSecondaryColor = Color(0xff424446);
  static Color textSubtitleColor = Color(0xff909195);
  static Color textWhiteColor = Colors.white;
  static Color textButtonPrimaryColor = Color(0xffdcccfc);
  static Color textConnectedColor = Color(0xff8765d2);
  static Color textSessionColor = Color(0xff8765d2);
  // appbar transparent color
  static Color appBarTransparentColor = Colors.transparent;
}

class AppDarkColor {
  // app color
  static Color primaryColor = Color(0xff07074e);
  static Color secondaryColor = Color(0xff17185a);
  // button color
  static Color buttonPrimaryColor = Color(0xff5b23e3);
  static Color buttonSecondaryColor = Color(0xff8327f1);
  static var buttonColor = LinearGradient(
    colors: [buttonPrimaryColor, buttonSecondaryColor],
  );
  static Color primaryIconColor = Colors.white;
  // text color
  static Color textPrimaryColor = Color(0xffdfdbff);
  static Color textSecondaryColor = Color(0xff7a79b2);
  static Color textSubtitleColor = Color(0xff636094);
  static Color textButtonPrimaryColor = Color(0xffffd8ff);
  static Color textConnectedColor = Color(0xffac26e3);
  static Color textSessionColor = Color(0xffffd8ff);
  // appbar transparent color
  static Color appBarTransparentColor = Colors.transparent;
}
