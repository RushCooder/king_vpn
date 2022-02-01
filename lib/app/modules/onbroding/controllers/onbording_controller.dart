import 'package:get/get.dart';
import 'package:king_vpn/app/helper/constants/size_config.dart';

class OnBordingController extends GetxController{
  void setValue(){
    SizeConfig.storage.write("isFirstTime", true);
  }
}