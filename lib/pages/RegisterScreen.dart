import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodie/Styles/themeStyles.dart';
import 'package:foodie/pages/LoginScreen.dart';
import 'package:foodie/widgets/PositionedText.dart';
import 'package:foodie/widgets/PositionedTextFields.dart';
import 'package:image_picker/image_picker.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  Text text = Text(
    'Login',
    style: TextStyle(color: AppTheme.buttonColor),
  );
  File imageFile;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = image;
    });
  }

  FocusNode _focusNode1, _focusNode2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/images/registerBackground.png",
            fit: BoxFit.fitHeight,
            color: Colors.black12,
            colorBlendMode: BlendMode.darken,
          ),
        ),
        _buildCircularImage(
          topVal: MediaQuery.of(context).size.height * 0.10,
          leftVal: MediaQuery.of(context).size.width * 0.30,
        ),
        PositionedTextFields(
          hintText: 'Name',
          icon: Icons.person_outline,
          yVal: MediaQuery.of(context).size.height * 0.35,
        ),
        PositionedTextFields(
          hintText: 'Email',
          icon: Icons.mail_outline,
          yVal: MediaQuery.of(context).size.height * 0.45,
        ),
        PositionedTextFields(
          hintText: 'Password',
          icon: Icons.lock_outline,
          yVal: MediaQuery.of(context).size.height * 0.55,
        ),
        PositionedTextFields(
          hintText: 'Confirm Password',
          icon: Icons.lock_outline,
          yVal: MediaQuery.of(context).size.height * 0.65,
        ),
        _buildButton('Register'),
        PositionedText(
          textData: 'Already have an Account? Login',
          textStyle: AppTheme.buttonTextStyle1
              .copyWith(fontWeight: FontWeight.w300, fontSize: 18),
          topVal: MediaQuery.of(context).size.height * 0.90,
          leftVal: MediaQuery.of(context).size.width * 0.25,
        )
      ],
    );
  }

  Widget _buildButton(String buttonText) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.80,
      left: MediaQuery.of(context).size.height * 0.05,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.08,
        child: MaterialButton(
          color: Color(0xff5663FF),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          minWidth: double.infinity,
          height: MediaQuery.of(context).size.height * 0.08,
          onPressed: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return LoginScreen();
            }));
          },
          child: Text(
            buttonText,
            style: AppTheme.buttonTextStyle1.copyWith(fontSize: 22),
          ),
        ),
      ),
    );
  }

  Widget _buildCircularImage({double topVal, double leftVal}) {
    return Positioned(
      top: topVal,
      left: leftVal,
      child: Stack(
        children: <Widget>[
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.5),
            ),
            child: (imageFile != null)
                ? CircleAvatar(
                    radius: 150,
                    backgroundImage: FileImage(imageFile),
                  )
                : Icon(Icons.person_outline),
          ),
          Positioned(right: 0, bottom: 0, child: _buildIcon())
        ],
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff5663FF),
        border: Border.all(width: 1.0, color: Colors.white),
      ),
      child: Center(
        child: IconButton(
          onPressed: getImage,
          icon: Icon(
            Icons.arrow_upward,
            size: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
