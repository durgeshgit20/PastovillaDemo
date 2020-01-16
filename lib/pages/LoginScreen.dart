import 'package:flutter/material.dart';
import 'package:foodie/Styles/themeStyles.dart';
import 'package:foodie/pages/HomeContainer.dart';
import 'package:foodie/pages/RegisterScreen.dart';
import 'package:foodie/widgets/PositionedText.dart';
import 'package:foodie/widgets/PositionedTextFields.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode _focusNode1, _focusNode2;

  bool isShowing;

  @override
  void initState() {
    super.initState();

    _focusNode1 = new FocusNode();
    _focusNode2 = new FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height * 0.57);

    return Scaffold(
        body: SingleChildScrollView(
      child: _buildBody(context),
    ));
  }

  Widget _buildBody(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            "assets/images/loginbackground.png",
            fit: BoxFit.cover,
            color: Colors.black12,
            colorBlendMode: BlendMode.darken,
          ),
        ),
        PositionedText(
          topVal: MediaQuery.of(context).size.height * 0.2,
          leftVal: MediaQuery.of(context).size.width * 0.25,
          textData: "PASTOVILLA",
          textStyle: AppTheme.buttonTextStyle1
              .copyWith(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        PositionedTextFields(
            icon: Icons.mail_outline,
            hintText: 'Email',
            yVal: MediaQuery.of(context).size.height * 0.43,
            focusNode: _focusNode1,
            nextFocusNode: _focusNode2),
        PositionedTextFields(
            icon: Icons.lock_outline,
            hintText: 'Password',
            yVal: MediaQuery.of(context).size.height * 0.55,
            focusNode: _focusNode2,
            nextFocusNode: null),
        PositionedText(
          topVal: MediaQuery.of(context).size.height * 0.67,
          leftVal: MediaQuery.of(context).size.width * 0.58,
          textData: "Forgot Password ?",
          textStyle: AppTheme.buttonTextStyle1
              .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        _buildButton('Login'),
        PositionedText(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return RegisterScreen();
              }));
            },
            topVal: MediaQuery.of(context).size.height * 0.91,
            leftVal: MediaQuery.of(context).size.width * 0.35,
            textStyle: AppTheme.buttonTextStyle1.copyWith(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w300,
                fontSize: 18),
            textData: 'Create New Account'),
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
              return HomeContainer();
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
}
