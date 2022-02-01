import 'package:get/get_navigation/get_navigation.dart';
import 'package:king_vpn/app/modules/home/bindings/home_binding.dart';
import 'package:king_vpn/app/modules/home/views/home_view.dart';
import 'package:king_vpn/app/modules/onbroding/bindings/onbording_binding.dart';
import 'package:king_vpn/app/modules/onbroding/views/onbording_view.dart';
import 'package:king_vpn/app/modules/server/bindings/server_binding.dart';
import 'package:king_vpn/app/modules/server/views/server_view.dart';
import 'package:king_vpn/app/modules/speed/bindings/speed_binding.dart';
import 'package:king_vpn/app/modules/speed/views/speed_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBORDING;

  static final routes = [
    GetPage(
      name: _Paths.ONBORDING,
      page: () => OnBordingView(),
      binding: OnBordingBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      bindings: [HomeBinding(), ServerBinding()],
    ),
    GetPage(
      name: _Paths.SERVER,
      page: () => ServerView(),
      binding: ServerBinding(),
    ),
    GetPage(
      name: _Paths.SPEED,
      page: () => SpeedView(),
      binding: SpeedBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
