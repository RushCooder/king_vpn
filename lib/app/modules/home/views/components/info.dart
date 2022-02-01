import 'package:flutter/material.dart';
import 'package:king_vpn/app/helper/constants/font_size.dart';
import 'package:king_vpn/app/helper/constants/size_config.dart';

class InfoWidget extends StatelessWidget {
  final Icon icon;
  final String title;
  final String unit;
  final String subTitle;
  final bool isCountryStatus;
  final String imagePath;

  InfoWidget({
    @required this.title,
    @required this.subTitle,
    this.icon,
    this.imagePath,
    this.isCountryStatus = false,
    this.unit = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: isCountryStatus
                ? Container(
                    width: getProportionateScreenWidth(35),
                    height: getProportionateScreenWidth(35),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(imagePath),
                          // ...
                        ),
                        // ...
                      ),
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.onSecondary,
                    child: icon,
                  ),
          ),
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(
                    width: AppFontSize.midiumSizedBoxWidth,
                  ),
                  Text(
                    unit,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 1,
            child: Text(
              subTitle,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ],
      ),
    );
  }
}
