import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:king_vpn/app/helper/constants/colors/colors.dart';
import 'package:king_vpn/app/helper/constants/font_size.dart';
import 'package:king_vpn/app/helper/constants/size_config.dart';
import 'package:king_vpn/app/helper/strings/strings.dart';
import 'package:king_vpn/app/modules/server/controllers/server_controller.dart';

class ServerView extends GetView<ServerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: Text(AppString.serverTitile),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: controller.servers.length,
        itemBuilder: (context2, int index) {
          return Container(
            padding: EdgeInsets.only(
              left: 1.0,
              right: 1.0,
              top: 5.0,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: InkWell(
              onTap: () {
                controller.changeServer(index);
              },
              child: Obx(
                () => Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppFontSize.connectedStateHorizontalPadding,
                    vertical: 8.0,
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: 1.0,
                  ),
                  decoration: BoxDecoration(
                    color: controller.serverIndex.value == index
                        ? Theme.of(context).colorScheme.onSecondary
                        : Theme.of(context).colorScheme.secondary,
                  ),
                  child: ListTile(
                    leading: Container(
                      width: getProportionateScreenWidth(35),
                      height: getProportionateScreenWidth(35),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/' +
                                controller.servers[index]['flag'],
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      controller.servers[index]['country'],
                      style: controller.serverIndex.value == index
                          ? Theme.of(context).textTheme.headline5.copyWith(
                                color: AppLightColor.textWhiteColor,
                              )
                          : Theme.of(context).textTheme.headline5,
                    ),
                    trailing: controller.serverIndex.value == index
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 25,
                          )
                        : Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                color: Colors.grey.withOpacity(0.3),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
