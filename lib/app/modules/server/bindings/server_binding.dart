import 'package:get/get.dart';
import 'package:king_vpn/app/modules/server/controllers/server_controller.dart';

class ServerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServerController>(() => ServerController());
  }
}
