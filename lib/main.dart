import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:king_vpn/app/helper/constants/size_config.dart';
import 'package:king_vpn/app/helper/constants/themes/theme.dart';
import 'package:king_vpn/app/helper/constants/themes/theme_controller.dart';
import 'package:king_vpn/app/routes/app_pages.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // initializing GetStorage

  runApp(VpnApp());
}

class VpnApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    bool isFirstTime = SizeConfig.storage.read("isFirstTime");
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: themeController.themeMode.value,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        title: "King vpn",
        initialRoute: isFirstTime == true ? Routes.HOME : AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    );
  }
}
