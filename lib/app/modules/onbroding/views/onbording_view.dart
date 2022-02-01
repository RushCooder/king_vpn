import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:king_vpn/app/helper/constants/colors/colors.dart';
import 'package:king_vpn/app/helper/constants/font_size.dart';
import 'package:king_vpn/app/helper/strings/strings.dart';
import 'package:king_vpn/app/modules/onbroding/controllers/onbording_controller.dart';
import 'package:king_vpn/app/routes/app_pages.dart';
import 'package:lottie/lottie.dart';

class OnBordingView extends GetView<OnBordingController> {
  final Brightness brightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;
  @override
  Widget build(BuildContext context) {
    PageDecoration onBordPageDecoration = PageDecoration(
      titleTextStyle: Theme.of(context).textTheme.headline3.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: AppFontSize.extraLargeFontSize,
          ),
      bodyTextStyle: Theme.of(context).textTheme.headline3.copyWith(
            fontSize: AppFontSize.midiumFontSize,
            fontWeight: FontWeight.bold,
          ),
      imageFlex: 2,
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.offAllNamed(Routes.HOME);
                      },
                      child: Text(
                        AppString.skipButton,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: IntroductionScreen(
                  pages: [
                    PageViewModel(
                      image: Lottie.asset(
                        brightness == Brightness.light
                            ? "assets/images/lottie/light/internetglobe.json"
                            : "assets/images/lottie/dark/internetglobdark.json",
                      ),
                      title: AppString.firstTitle,
                      body: AppString.firstDescription,
                      decoration: onBordPageDecoration,
                    ),
                    PageViewModel(
                      image: Lottie.asset(
                        brightness == Brightness.light
                            ? "assets/images/lottie/light/2ndpage.json"
                            : "assets/images/lottie/dark/2nddark.json",
                      ),
                      title: AppString.secondTitle,
                      body: AppString.secondDescription,
                      decoration: onBordPageDecoration,
                    ),
                    PageViewModel(
                      image: Lottie.asset(
                        brightness == Brightness.light
                            ? "assets/images/lottie/light/3rd.json"
                            : "assets/images/lottie/dark/3rddark.json",
                      ),
                      title: AppString.thirdTitle,
                      body: AppString.thirdDescription,
                      decoration: onBordPageDecoration,
                    ),
                  ],
                  showDoneButton: false,
                  showNextButton: false,
                  color: Theme.of(context).primaryColor,
                  dotsDecorator: DotsDecorator(
                    activeSize: Size(22, 10),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    activeColor: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.setValue();
                        Get.offAllNamed(Routes.HOME);
                      },
                      child: Text(
                        AppString.getStartedButton,
                        style: Theme.of(context).textTheme.headline3.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppLightColor.textWhiteColor,
                            ),
                      ),
                      style:
                          Theme.of(context).elevatedButtonTheme.style.copyWith(
                                padding: MaterialStateProperty.all(
                                  EdgeInsets.all(13),
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
    );
  }
}
