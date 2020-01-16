import 'package:flutter/material.dart';

class PositionedText extends StatelessWidget {
  final double topVal;
  final double leftVal;
  final String textData;
  final TextStyle textStyle;
  final Function onTap;

  PositionedText({@required this.topVal, this.leftVal,@required this.textData,@required this.textStyle,this.onTap} );
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topVal,
      left: leftVal,
      child: InkWell(
        onTap:onTap ,
        child: Text(textData, style: textStyle)),
    );
  }
}
