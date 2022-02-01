import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:king_vpn/app/helper/constants/colors/colors.dart';
import 'package:king_vpn/app/helper/constants/size_config.dart';
import 'package:king_vpn/app/modules/home/views/components/server_connection_widgets.dart';

class ConnectingScreen extends StatelessWidget {
  final Function onPress;
  ConnectingScreen({
    this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Animator(
                duration: Duration(seconds: 2),
                repeats: 0,
                builder: (anim) => FadeTransition(
                  opacity: anim,
                  child: Text(
                    "CONNECTING",
                    textAlign: TextAlign.center,
                    // style: kHeadLine2,
                  ),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(35),
              ),
              SpinKitRipple(
                color: AppLightColor.buttonPrimaryColor,
                size: SizeConfig.screenWidth / 2,
              ),
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              ServerConnectionWidgets(
                onPress: onPress,
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Text(
                "CONNECTING VPN SERVER",
                textAlign: TextAlign.center,
                // style: kDescriptionText,
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
