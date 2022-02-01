import 'package:flutter/material.dart';
import 'package:king_vpn/app/helper/constants/colors/colors.dart';
import 'package:king_vpn/app/helper/constants/palette.dart';

class ButtonInk extends StatelessWidget {
  final String buttonName;
  ButtonInk({@required this.buttonName});
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        gradient: buttonGradient,
        borderRadius: BorderRadius.all(Radius.circular(80.0)),
      ),
      child: Container(
        // padding: EdgeInsets.all(10.0),
        constraints: BoxConstraints(
            minWidth: 188.0, minHeight: 46.0), // min sizes for Material buttons
        alignment: Alignment.center,
        child: Text(
          buttonName,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3.copyWith(
                color: AppLightColor.textWhiteColor,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

// Ink btnInk = Ink(
//   decoration: BoxDecoration(
//     gradient: buttonGradient,
//     borderRadius: BorderRadius.all(Radius.circular(80.0)),
//   ),
//   child: Container(
//     constraints: const BoxConstraints(
//         minWidth: 188.0, minHeight: 46.0), // min sizes for Material buttons
//     alignment: Alignment.center,
//     child: const Text(
//       'Start Test',
//       textAlign: TextAlign.center,
//       style: TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.bold,
//       ),
//     ),
//   ),
// );
