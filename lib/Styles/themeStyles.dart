import 'package:flutter/material.dart';

class AppTheme {
  static const Color buttonColor = Color(0xff5663FF);
  static const Color textColor = Color(0xff222455); 

  static List gradientColors = [
    {
      "begin": Color.fromRGBO(255, 86, 115, 0.3),
      "end": Color.fromRGBO(255, 40, 72, 0.4),
    },
    {
      "begin": Color.fromRGBO(255, 70, 101, 0.3),
      "end": Color.fromRGBO(131, 43, 246, 0.4),
    },
    {
      "begin": Color.fromRGBO(59, 64, 254, 0.3),
      "end": Color.fromRGBO(45, 206, 248, 0.4),
    },
    {
      "begin": Color.fromRGBO(33, 229, 144, 0.3),
      "end": Color.fromRGBO(0, 157, 197, 0.4),
    },
    {
      "begin": Color.fromRGBO(255, 135, 14, 0.3),
      "end": Color.fromRGBO(210, 54, 201, 0.4),
    }
  ];

  static const TextStyle titleStyle = TextStyle(
      fontSize: 28,
      fontFamily: 'JosefinSans',
      fontWeight: FontWeight.w400,
      color: Color(0xff222455));

  static const TextStyle titleCountStyle = TextStyle(
      fontSize: 16,
      fontFamily: 'JosefinSans',
      fontWeight: FontWeight.w100,
      color: Colors.grey);

  static const TextStyle hintTextStyle = TextStyle(
      fontSize: 20,
      fontFamily: 'JosefinSans',
      fontWeight: FontWeight.w200,
      color: Colors.grey);

  static const TextStyle cardtitleStyle = TextStyle(
      fontSize: 22,
      fontFamily: 'JosefinSans',
      fontWeight: FontWeight.w400,
      color: Color(0xff222455));

  static const TextStyle cardsubTitleStyle = TextStyle(
      fontSize: 16,
      fontFamily: 'JosefinSans',
      fontWeight: FontWeight.w200,
      color: Colors.grey);

  static const TextStyle categoryTitleStyle = TextStyle(
      fontSize: 24,
      fontFamily: 'JosefinSans',
      fontWeight: FontWeight.w400,
      color: Colors.white);

  static const TextStyle buttonTextStyle1 = TextStyle(
      fontSize: 26,
      fontFamily: 'JosefinSans',
      fontWeight: FontWeight.w400,
      color: Colors.white);
}
