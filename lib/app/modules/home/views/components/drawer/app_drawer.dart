import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:king_vpn/app/helper/constants/font_size.dart';
import 'package:king_vpn/app/helper/constants/size_config.dart';
import 'package:king_vpn/app/helper/strings/strings.dart';
import 'package:king_vpn/app/modules/home/views/components/drawer/option_tile.dart';
import 'package:king_vpn/app/modules/server/controllers/server_controller.dart';
import 'package:king_vpn/app/routes/app_pages.dart';

class AppDrawer extends StatelessWidget {
  final ServerController serverController = Get.find<ServerController>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: DrawerHeader(
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onSecondary,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      onTap: () {
                        // Get.toNamed(Routes.SERVER);
                      },
                      leading: Container(
                        width: getProportionateScreenWidth(40),
                        height: getProportionateScreenWidth(40),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/' +
                                    serverController.servers[serverController
                                        .serverIndex.value]['flag'],
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        serverController
                                .servers[serverController.serverIndex.value]
                            ['country'],
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        "Premium: " +
                            serverController
                                    .servers[serverController.serverIndex.value]
                                ['premium'],
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      // trailing: IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.arrow_right_outlined),
                      // ),
                      trailing: InkWell(
                        onTap: () {},
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
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.only(
                  left: AppFontSize.connectedStateHorizontalPadding,
                ),
                child: Column(
                  children: [
                    Container(
                      width: SizeConfig.screenWidth,
                      padding: EdgeInsets.only(
                        bottom: AppFontSize.connectedStateHorizontalPadding,
                      ),
                      child: Text(
                        AppString.mainMenuText,
                        style: Theme.of(context).textTheme.headline3,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    OptionTile(
                      icon: Icons.network_check_outlined,
                      buttonName: AppString.speedTextButtonName,
                      onTap: () {
                        Get.back();
                        Get.toNamed(Routes.SPEED);
                      },
                    ),
                    OptionTile(
                      icon: Icons.cloud_outlined,
                      buttonName: AppString.serverListButtonName,
                      onTap: () {
                        Get.back();
                        Get.toNamed(Routes.SERVER);
                      },
                    ),
                    OptionTile(
                      icon: Icons.info_outline,
                      buttonName: AppString.aboutButtonName,
                      onTap: () {
                        Get.defaultDialog(
                          backgroundColor: Theme.of(context).primaryColor,
                          title: AppString.aboutButtonName,
                          titleStyle: Theme.of(context).textTheme.headline3,
                          content: Text(
                            AppString.versionText,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          confirm: TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text("OK"),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
