import 'package:get/get.dart';
import 'package:king_vpn/app/modules/onbroding/controllers/onbording_controller.dart';

class OnBordingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBordingController>(
      () => OnBordingController(),
    );
  }
}
