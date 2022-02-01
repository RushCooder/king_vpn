import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:king_vpn/app/helper/constants/colors/colors.dart';
import 'package:king_vpn/app/helper/constants/font_size.dart';
import 'package:king_vpn/app/helper/constants/size_config.dart';
import 'package:king_vpn/app/helper/strings/strings.dart';
import 'package:king_vpn/app/modules/home/controllers/home_controller.dart';
import 'package:king_vpn/app/modules/home/views/components/info.dart';
import 'package:king_vpn/app/routes/app_pages.dart';

class ConnectionView extends GetView<HomeController> {
  final String ipAddress;
  final String currentStatus;
  final String pingServer;
  final Widget sessionTime;
  final Function onPress;
  final Function onPressServers;
  // final Widget upDown;
  final String uploadSpeed;
  final String downloadSpeed;
  final String countryFlag;
  final String countryName;
  final String premiumStatus;

  const ConnectionView({
    this.ipAddress,
    this.currentStatus,
    this.pingServer,
    this.sessionTime,
    this.onPress,
    this.onPressServers,
    this.uploadSpeed,
    this.downloadSpeed,
    this.countryFlag,
    this.countryName,
    this.premiumStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    child: AvatarGlow(
                      startDelay: Duration(milliseconds: 1000),
                      glowColor: Theme.of(context).colorScheme.onSecondary,
                      endRadius: 100.0,
                      duration: Duration(milliseconds: 2000),
                      repeat: true,
                      showTwoGlows: true,
                      repeatPauseDuration: Duration(milliseconds: 100),
                      child: Material(
                        elevation: 8.0,
                        shape: CircleBorder(),
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: onPress,
                          borderRadius: BorderRadius.circular(100),
                          child: CircleAvatar(
                            radius: 60.0,
                            backgroundColor: Colors.white,
                            child: Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 10.0,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                                  borderRadius: BorderRadius.circular(60.0),
                                ),
                                child: Center(
                                  child: Obx(
                                    () => Icon(
                                      Icons.power_settings_new,
                                      size: SizeConfig.screenWidth / 9,
                                      color: controller.isConnected.value
                                          ? Colors.red
                                          : Theme.of(context)
                                              .colorScheme
                                              .onSecondary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      shape: BoxShape.circle,
                      animate: true,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppFontSize.connectedStateHorizontalPadding,
                        vertical: AppFontSize.connectedStateVerticalPadding,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Text(
                        currentStatus,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: sessionTime,
                ),
              ],
            ),
          ),
          // info part
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.only(
                        top: AppFontSize.buttonVerticalPadding,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: InfoWidget(
                                          imagePath: countryFlag,
                                          title: countryName,
                                          subTitle: premiumStatus,
                                          isCountryStatus: true,
                                        ),
                                      ),
                                      Expanded(
                                        child: InfoWidget(
                                          icon: Icon(
                                            Icons.arrow_downward,
                                            color:
                                                AppLightColor.primaryIconColor,
                                          ),
                                          title: downloadSpeed,
                                          subTitle: AppString.downloadText,
                                          unit: AppString.unit,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: InfoWidget(
                                          icon: Icon(
                                            Icons.star_rate,
                                            color:
                                                AppLightColor.primaryIconColor,
                                          ),
                                          title: pingServer,
                                          subTitle: AppString.pingText,
                                          unit: AppString.pingUnitText,
                                        ),
                                      ),
                                      Expanded(
                                        child: InfoWidget(
                                          icon: Icon(
                                            Icons.arrow_upward,
                                            color:
                                                AppLightColor.primaryIconColor,
                                          ),
                                          title: uploadSpeed,
                                          subTitle: AppString.uploadText,
                                          unit: AppString.unit,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 8.0,
                      ),
                      padding: EdgeInsets.all(
                          AppFontSize.connectedStateVerticalPadding),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: ListTile(
                        onTap: () {
                          Get.toNamed(Routes.SERVER);
                        },
                        leading: Container(
                          width: getProportionateScreenWidth(35),
                          height: getProportionateScreenWidth(35),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(countryFlag),
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          countryName,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        subtitle: Text(
                          premiumStatus,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        trailing: InkWell(
                          onTap: onPressServers,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                            padding: EdgeInsets.all(AppFontSize.leadingPadding),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: AppFontSize.leadingIconsize,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
