import 'package:flutter/material.dart';
import 'package:king_vpn/app/helper/constants/palette.dart';

class ShowLabel extends StatelessWidget {
  final String label;
  final double speed;
  final String unit;

  ShowLabel({@required this.label, @required this.speed, @required this.unit});

  @override
  Widget build(BuildContext context) {
    String displaySpeed = speed.toStringAsFixed(2);
    return Text(
      '$label Speed: $displaySpeed $unit',
      style: Theme.of(context).textTheme.headline5,
    );
  }
}

Text showLabel(String label, double speed, String unit) {
  String displaySpeed = speed.toStringAsFixed(2);
  return Text(
    '$label Speed: $displaySpeed $unit',
    style: TextStyle(
      color: txtCol,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  );
}
