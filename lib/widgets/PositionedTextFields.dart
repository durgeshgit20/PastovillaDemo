import 'package:flutter/material.dart';
import 'package:foodie/Styles/themeStyles.dart';

class PositionedTextFields extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final double yVal;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  PositionedTextFields(
      {this.icon,
      this.hintText,
      this.yVal,
      this.focusNode,
      this.nextFocusNode});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: yVal,
      left: 0,
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.1,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 35),
        child: TextFormField(
          
          textInputAction: TextInputAction.next,
          focusNode: focusNode,
          onFieldSubmitted: (val)=> FocusScope.of(context).requestFocus(nextFocusNode),
          cursorColor: Colors.white,
          style: AppTheme.buttonTextStyle1.copyWith(fontSize: 20),
          // keyboardType:
          //     (hintText.contains("@") ? TextInputType.emailAddress : TextInputType.text),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(18),
              fillColor: Colors.white.withOpacity(0.4),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              prefixIcon: Icon(
                icon,
                color: Colors.white,
              ),
              hintText: hintText,
              hintStyle: AppTheme.buttonTextStyle1.copyWith(fontSize: 18)),
        ),
      ),
    );
  }
}
