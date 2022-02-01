import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  RxBool isDarkThemeEnabled = false.obs;
  final Brightness brightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            brightness == Brightness.light ? Brightness.dark : Brightness.light,
      ),
    );
  }

  void changeTheme() {
    if (isDarkThemeEnabled.value) {
      themeMode.value = ThemeMode.light;
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
      );

      isDarkThemeEnabled.value = false;
    } else {
      themeMode.value = ThemeMode.dark;
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
      );
      isDarkThemeEnabled.value = true;
    }
  }
}
