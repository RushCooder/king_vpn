import 'package:get/get.dart';
import 'package:king_vpn/app/modules/speed/controllers/speed_controller.dart';

class SpeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpeedController>(
      () => SpeedController(),
    );
  }
}
