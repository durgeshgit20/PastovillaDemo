import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:foodie/Styles/themeStyles.dart';
import 'package:foodie/pages/LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  SequenceAnimation sequenceAnimation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this);
    sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
          from: Duration(milliseconds: 0),
          to: Duration(milliseconds: 1300),
          animatable: Tween<double>(begin: 0.0, end: 1.0),
          tag: 'rotation',
        )
        .addAnimatable(
          animatable: Tween<double>(begin: 1.3, end: 1.8),
          from: Duration(milliseconds: 0),
          to: Duration(milliseconds: 1300),
          tag: 'scale',
        )
        .addAnimatable(
          from: Duration(milliseconds: 1500),
          to: Duration(milliseconds: 2000),
          animatable: Tween(begin: 0.0, end: 1.0),
          tag: 'opacity',
        )
        .animate(animationController);

     Timer(Duration(seconds: 3), () => onDoneLoading());
    animationController.forward();
    super.initState();
  }

  onDoneLoading() async {
    var pageRoute = PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 500),
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) => LoginScreen(),

      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );

    Navigator.of(context).pushReplacement(pageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox.expand(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (BuildContext context, Widget _widget) {
            return Transform.rotate(
              angle: sequenceAnimation["rotation"].value * 15 / 360 * 2 * pi,
              child: Transform.scale(
                  scale: sequenceAnimation["scale"].value,
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/splashScreen.png',
                        fit: BoxFit.fill,
                      ),
                      _buildText()
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }

  Widget _buildText() {
    return Positioned(
        top: MediaQuery.of(context).size.height*0.44,
        left:  MediaQuery.of(context).size.width*0.31,
        child: Opacity(
          opacity: sequenceAnimation["opacity"].value,
          child: Center(
            child: Transform.rotate( 
              angle: sequenceAnimation["rotation"].value * -15 / 360 * 2 * pi,
              child: Text(
                'PASTOVILLA',
                style: AppTheme.cardtitleStyle
                    .copyWith(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ));
  }
}
