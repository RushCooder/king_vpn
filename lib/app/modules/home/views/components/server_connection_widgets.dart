import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:king_vpn/app/helper/constants/size_config.dart';
import 'package:king_vpn/app/modules/server/controllers/server_controller.dart';

class ServerConnectionWidgets extends GetView<ServerController> {
  final Function onPress;
  ServerConnectionWidgets({
    this.onPress,
  });
  // final ServerController serverController = Get.put(ServerController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Obx(
          () {
            if (controller.isLoading.isTrue) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                width: SizeConfig.screenWidth / 1.5,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: getProportionateScreenWidth(35),
                      height: getProportionateScreenWidth(35),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/' +
                                  controller
                                          .servers[controller.serverIndex.value]
                                      ['flag'],
                            ),
                            // ...
                          ),
                          // ...
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      controller.servers[controller.serverIndex.value]
                          ['country'],
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
