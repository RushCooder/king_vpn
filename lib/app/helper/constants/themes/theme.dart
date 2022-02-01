import 'package:flutter/material.dart';
import 'package:king_vpn/app/helper/constants/colors/colors.dart';
import 'package:king_vpn/app/helper/constants/font_size.dart';

class AppTheme {
  // ================== theme ===================
  static ThemeData lightTheme = ThemeData(
    // background
    scaffoldBackgroundColor: AppLightColor.primaryColor,
    // color
    primaryColor: AppLightColor.primaryColor,
    colorScheme: ColorScheme.light().copyWith(
      secondary: AppLightColor.secondaryColor,
      onSecondary: AppLightColor.buttonPrimaryColor,
    ),
    secondaryHeaderColor: AppLightColor.secondaryColor,
    hintColor: AppLightColor.secondaryColor,

    // app bar theme
    appBarTheme: _appBarLightTheme,
    // elevated button theme
    elevatedButtonTheme: _elevatedButtonLightThemeData,

    // textTheme: _textTheme,
    textTheme: _textLightTheme,

    // icon theme
    // iconTheme: _iconThemeData,
  );

  static ThemeData darkTheme = ThemeData(
    // background
    scaffoldBackgroundColor: AppDarkColor.primaryColor,
    // color
    primaryColor: AppDarkColor.primaryColor,
    accentColor: AppDarkColor.secondaryColor,
    colorScheme: ColorScheme.dark().copyWith(
      secondary: AppDarkColor.secondaryColor,
      onSecondary: AppDarkColor.buttonSecondaryColor,
    ),
    secondaryHeaderColor: AppDarkColor.secondaryColor,
    hintColor: AppDarkColor.secondaryColor,
    // app bar theme
    appBarTheme: _appBarDarkTheme,
    // elevated button theme
    elevatedButtonTheme: _elevatedButtonDarkThemeData,
    // text theme
    textTheme: _textDarkTheme,

    // icon theme
    // iconTheme: _iconThemeData,
  );

  // // ========================= Icon theme ==================

  // static final IconThemeData _iconThemeData = IconThemeData(
  //   color: AppDarkColor.primaryIconColor,
  //   size: 30,
  // );

  // =========================== appbar theme =====================
  static final AppBarTheme _appBarLightTheme = AppBarTheme(
    centerTitle: true,
    color: AppDarkColor.appBarTransparentColor,
    elevation: 0.0,
  );
  // appbar dark theme
  static final AppBarTheme _appBarDarkTheme = AppBarTheme(
    centerTitle: true,
    color: AppLightColor.appBarTransparentColor,
    elevation: 0.0,
  );

  // ======================= elevated button light theme ===================
  static final ElevatedButtonThemeData _elevatedButtonLightThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      // backgroundColor: MaterialStateProperty.all(
      //   AppLightColor.buttonPrimaryColor,
      // ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(
          fontSize: AppFontSize.largeFontSize,
          color: AppLightColor.textButtonPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.all(0.0),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0),
        ),
      ),
    ),
  );

  // elevated button dart theme
  static final ElevatedButtonThemeData _elevatedButtonDarkThemeData =
      ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(
          fontSize: AppFontSize.largeFontSize,
          color: AppDarkColor.textButtonPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.all(0.0),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80.0),
        ),
      ),
    ),
  );

  // =============================== text theme for light theme ======================
  static final TextTheme _textLightTheme = TextTheme(
    // for connected status and session time
    headline2: TextStyle(
      color: AppLightColor.textConnectedColor,
      fontSize: AppFontSize.largeFontSize,
    ),
    // for info title
    headline3: TextStyle(
      color: AppLightColor.textPrimaryColor,
      fontSize: AppFontSize.extraLargeFontSize,
    ),
    // for info sub title
    subtitle2: TextStyle(
      color: AppLightColor.textPrimaryColor,
      fontSize: AppFontSize.smallFontSize,
    ),
    // for info unit
    subtitle1: TextStyle(
      color: AppLightColor.textPrimaryColor,
      fontSize: AppFontSize.extraSmallFontSize,
    ),

    // for button title
    headline5: TextStyle(
      color: AppLightColor.textPrimaryColor,
      fontSize: AppFontSize.largeFontSize,
    ),

    // for drawer header text
    // for info title
    headline6: TextStyle(
      color: AppLightColor.textButtonPrimaryColor,
      fontSize: AppFontSize.extraLargeFontSize,
    ),
    // for info sub title
    headline4: TextStyle(
      color: AppLightColor.textButtonPrimaryColor,
      fontSize: AppFontSize.smallFontSize,
    ),

    // drawer body option
    bodyText1: TextStyle(
      color: AppLightColor.textPrimaryColor,
      fontSize: AppFontSize.midiumFontSize,
    ),
  );

  // text theme for dart theme
  static final TextTheme _textDarkTheme = TextTheme(
    // for connected status and session time
    headline2: TextStyle(
      color: AppDarkColor.textSessionColor,
      fontSize: AppFontSize.largeFontSize,
    ),
    // for info title
    headline3: TextStyle(
      color: AppDarkColor.textPrimaryColor,
      fontSize: AppFontSize.extraLargeFontSize,
    ),
    // for info sub title
    subtitle2: TextStyle(
      color: AppDarkColor.textPrimaryColor,
      fontSize: AppFontSize.smallFontSize,
    ),
    // for info unit
    subtitle1: TextStyle(
      color: AppDarkColor.textPrimaryColor,
      fontSize: AppFontSize.extraSmallFontSize,
    ),

    // for button title
    headline5: TextStyle(
      color: AppDarkColor.textPrimaryColor,
      fontSize: AppFontSize.largeFontSize,
    ),

    // for drawer header text
    // for info title
    headline6: TextStyle(
      color: AppDarkColor.textButtonPrimaryColor,
      fontSize: AppFontSize.extraLargeFontSize,
    ),
    // for info sub title
    headline4: TextStyle(
      color: AppDarkColor.textButtonPrimaryColor,
      fontSize: AppFontSize.smallFontSize,
    ),

    // drawer body option
    bodyText1: TextStyle(
      color: AppDarkColor.textPrimaryColor,
      fontSize: AppFontSize.midiumFontSize,
    ),
  );
}
