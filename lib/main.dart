import 'package:flutter/material.dart';

import 'package:foodie/pages/EditProfile.dart';
import 'package:foodie/pages/HomeContainer.dart';

import 'package:foodie/pages/LoginScreen.dart';
import 'package:foodie/pages/ProfileScreen.dart';
import 'package:foodie/pages/SplashScreen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      iconTheme: IconThemeData(
        color: Colors.black
      )
    ),
    routes: {
      '/loginScreen': (context) => LoginScreen(),
      '/homeContainer':(context) => HomeContainer(),
      '/editProfile' :(context) =>EditProfile(),
      '/profileScreen':(context)=>ProfileScreen(),
    },
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}


