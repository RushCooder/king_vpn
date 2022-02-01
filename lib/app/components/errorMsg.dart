import 'package:fluttertoast/fluttertoast.dart';
import 'package:king_vpn/app/helper/constants/palette.dart';

void showError(String eMsg) {
  Fluttertoast.showToast(
      msg: eMsg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      // timeInSecForIosWeb: 1,
      backgroundColor: errorBg,
      textColor: errorTxt,
      fontSize: 16.0);
}
