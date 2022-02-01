import 'package:flutter/material.dart';

class OptionTile extends StatelessWidget {
  final IconData icon;
  final String buttonName;
  final Function onTap;

  OptionTile(
      {@required this.icon, @required this.buttonName, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon),
        title: Text(
          buttonName,
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
