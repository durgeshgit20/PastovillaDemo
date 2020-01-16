import 'package:flutter/material.dart';
import 'package:foodie/Styles/themeStyles.dart';

class TitleBar extends StatelessWidget {
  final String titleText, titleCount;
  final Function onPressed;

  TitleBar({@required this.titleText, this.titleCount, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            titleText,
            style: AppTheme.titleStyle,
          ),
          InkWell(
            
            onTap: onPressed,
            child: titleCount.contains('null')?Container():Text(
              'See All($titleCount)',
              style: AppTheme.titleCountStyle,
            ),
          ),
        ],
      ),
    );
  }
}
