import 'dart:io';

// import 'package:dart_mc_ping/dart_mc_ping.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_openvpn/flutter_openvpn.dart';
import 'package:get/get.dart';
import 'package:get_ip_address/get_ip_address.dart';
import 'package:king_vpn/app/helper/constants/size_config.dart';
import 'package:king_vpn/app/modules/server/controllers/server_controller.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class HomeController extends GetxController {
  var currentPage = 0.obs;
  var value = 0.0.obs;

// for home page
  final ServerController serverController = Get.find<ServerController>();
  final StopWatchTimer stopWatchTimer = StopWatchTimer();
  final isHours = true;
  var ipAddress = '00.0.000.000'.obs;
  RxString uploadUnitText = 'kbps'.obs;
  RxString downLoadUnitText = 'kbps'.obs;

  RxString inSpeed = '0.0'.obs;
  RxString upSpeed = '0.0'.obs;
  RxString state = 'DISCONNECTED'.obs;
  RxString pingValue = "0".obs;
  RxBool isConnected = false.obs;
  var stream;

  @override
  void onInit() {
    super.onInit();
    try {
      // getAddress();
      FlutterOpenvpn.init();
      // getPingValue();
    } on IpAddressException catch (e) {
      print("Exception at: $e");
    } on SocketException catch (e) {
      print("SocketException: $e");
    }

    print("isFirstTime: " + SizeConfig.storage.read("isFirstTime").toString());
  }

  String removeText(String text) {
    RegExp exp = RegExp(r"-\s\d+|(?:\.\d+)?\s\w+\/s",
        multiLine: true, caseSensitive: true);

    return text.replaceAll(exp, '');
  }

  void getVpnConnected() async {
    var vpnPath = await rootBundle.loadString(
        'assets/vpns/${serverController.servers[serverController.serverIndex.value]['file']}');
    await FlutterOpenvpn.lunchVpn(
      vpnPath,
      (isProfileLoaded) {
        print('isProfileLoaded : $isProfileLoaded');
      },
      (vpnActivated) {
        print('vpnActivated : $vpnActivated');
        if (vpnActivated == 'NOPROCESS' || vpnActivated == 'WAIT') {
          state.value = vpnActivated;
        } else if (vpnActivated == 'CONNECTED') {
          state.value = vpnActivated;
          isConnected.value = true;
          startTimer();
          Get.snackbar(
            'CONNECTED',
            '',
            colorText: Colors.black,
          );
        } else if (vpnActivated == 'DISCONNECTED') {
          state.value = vpnActivated;
          isConnected.value = false;
          inSpeed.value = "0.0";
          upSpeed.value = "0.0";
          stopTimer();
          Get.snackbar(
            'DISCONNECTED',
            '',
            colorText: Colors.black,
          );
        }
      },
      user: serverController.servers[serverController.serverIndex.value]
          ['username'],
      pass: serverController.servers[serverController.serverIndex.value]
          ['password'],
      onConnectionStatusChanged:
          (duration, lastPacketRecieve, byteIn, byteOut) {
        var downloadSpeed = byteIn;
        inSpeed.value = downloadSpeed.split('-').first.split(' ')[0];
        downLoadUnitText.value = downloadSpeed.split('-').first.split(' ').last;

        var uploadSpeed = byteOut;
        upSpeed.value = uploadSpeed.split('-').first.split(' ').first;
        uploadUnitText.value = uploadSpeed.split('-').first.split(' ').last;
      },
      expireAt: DateTime.now().add(
        Duration(
          hours: 5,
        ),
      ),
    );
  }

  void startTimer() {
    stopWatchTimer.onExecute.add(StopWatchExecute.start);
    getAddress();
  }

  void stopTimer() {
    stopWatchTimer.onExecute.add(StopWatchExecute.reset);
    getAddress();
  }

  void getAddress() async {
    var ipAddressTemp = IpAddress(type: RequestType.text);
    var temp = await ipAddressTemp.getIpAddress();
    ipAddress.value = temp;
    print(ipAddress);
  }

  // void getPingValue() async {
  //   final statusResponse = await ping('https://www.google.com');
  //   print('Ping is: ${statusResponse.ms} ms'); // 28ms
  //   print(
  //     "Description: " + statusResponse.description.toColoredString(),
  //   ); // MOTD with ANSI colors and format
  // }
}
