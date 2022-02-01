import 'package:flutter/material.dart';
import 'package:flutter_openvpn/flutter_openvpn.dart';
import 'package:get/get.dart';
import 'package:king_vpn/app/helper/constants/font_size.dart';
import 'package:king_vpn/app/helper/constants/size_config.dart';
import 'package:king_vpn/app/helper/constants/themes/theme_controller.dart';
import 'package:king_vpn/app/helper/strings/strings.dart';
import 'package:king_vpn/app/modules/home/controllers/home_controller.dart';
import 'package:king_vpn/app/modules/home/views/components/connecting_screen.dart';
import 'package:king_vpn/app/modules/home/views/components/connection_view.dart';
import 'package:king_vpn/app/modules/home/views/components/drawer/app_drawer.dart';
import 'package:king_vpn/app/modules/server/controllers/server_controller.dart';
import 'package:king_vpn/app/routes/app_pages.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class HomeView extends GetView<HomeController> {
  final ServerController serverController = Get.find<ServerController>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          if (controller.state.value == 'NOPROCESS' ||
              controller.state.value == 'WAIT' ||
              controller.state.value == 'AUTH' ||
              controller.state.value == 'GET_CONFIG') {
            FlutterOpenvpn.stopVPN();
          }
          return false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppString.appTitile),
            actions: [
              IconButton(
                onPressed: () {
                  Get.find<ThemeController>().changeTheme();
                },
                icon: Icon(
                  Icons.light_mode_outlined,
                ),
              ),
            ],
          ),
          drawer: AppDrawer(),
          body: controller.state.value == AppString.connectedStatusText
              ? ConnectionView(
                  // connected state

                  pingServer: controller.pingValue.value,
                  ipAddress: controller.ipAddress.value,
                  currentStatus: controller.state.value,
                  sessionTime: StreamBuilder<int>(
                    stream: controller.stopWatchTimer.rawTime,
                    initialData: controller.stopWatchTimer.rawTime.value,
                    builder: (context, snap) {
                      final value = snap.data;
                      final displayTime = StopWatchTimer.getDisplayTime(
                        value,
                        hours: true,
                        milliSecond: false,
                      );
                      return Container(
                        child: Text(
                          displayTime.toString(),
                          style: Theme.of(context).textTheme.headline2.copyWith(
                                fontSize: AppFontSize.extraLargeFontSize,
                              ),
                        ),
                      );
                    },
                  ),
                  onPress: () {
                    FlutterOpenvpn.stopVPN();
                    Get.snackbar(
                      AppString.disconnectedStatusText,
                      '',
                      colorText: Colors.black,
                    );
                  },
                  countryFlag: 'assets/images/' +
                      serverController
                          .servers[serverController.serverIndex.value]['flag'],
                  countryName: serverController
                      .servers[serverController.serverIndex.value]['country'],
                  premiumStatus: "Premium: " +
                      serverController
                              .servers[serverController.serverIndex.value]
                          ['premium'],
                  uploadSpeed: controller.upSpeed.value,
                  downloadSpeed: controller.inSpeed.value,
                  onPressServers: () {
                    Get.toNamed(Routes.SERVER);
                  },
                  // uploadSpeedUnit: controller.uploadUnitText.value,
                  // downloadSpeedUnit: controller.downLoadUnitText.value,
                )
              : controller.state.value == AppString.waitingStatusText ||
                      controller.state.value == AppString.noProcessStatusText
                  ? ConnectingScreen(
                      // waiting state
                      onPress: () {},
                    )
                  : ConnectionView(
                      // disconnection state
                      pingServer: "0.0",
                      ipAddress: controller.ipAddress.value,
                      currentStatus: controller.state.value,
                      sessionTime: Text(
                        AppString.sessionTimeText,
                        style: Theme.of(context).textTheme.headline2.copyWith(
                              fontSize: AppFontSize.extraLargeFontSize,
                            ),
                      ),
                      onPress: () {
                        controller.getVpnConnected();
                      },
                      countryFlag: 'assets/images/' +
                          serverController
                                  .servers[serverController.serverIndex.value]
                              ['flag'],
                      countryName: serverController
                              .servers[serverController.serverIndex.value]
                          ['country'],
                      premiumStatus: "Premium: " +
                          serverController
                                  .servers[serverController.serverIndex.value]
                              ['premium'],
                      uploadSpeed: "0.0",
                      downloadSpeed: "0.0",
                      onPressServers: () {
                        Get.toNamed(Routes.SERVER);
                      },
                    ),
        ),
      ),
    );
  }
}
