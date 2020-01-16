import 'package:flutter/material.dart';
import 'package:foodie/Styles/themeStyles.dart';
import 'package:foodie/pages/EditProfile.dart';
import 'package:foodie/pages/FavouritesScreen.dart';
import 'package:foodie/pages/ProfileScreen.dart';
import 'package:foodie/pages/homeScreen.dart';
import 'package:foodie/widgets/FABBottomappBar.dart';
import 'dart:math';

class HomeContainer extends StatefulWidget {
  final Color btmItemColor = Color(0xff6E7FAA);
  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer>
    with SingleTickerProviderStateMixin {
  AnimationController _angleController;
  var _angle = 0.0;

  static int _index = 0;
  int _lastSelected = _index;
  bool isOpened = false;

  @override
  void initState() {
    _angleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _angleController.addListener(() {
      setState(() {
        _angle = _angleController.value * 135 / 360 * 2 * pi;
      });
    });
    super.initState();
  }

  @override
  dispose() {
    _angleController.dispose();
    super.dispose();
  }

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = _index;
      _index = index;
      if (!isOpened && _angleController.status == AnimationStatus.dismissed) {
        _angleController.reverse();
      } else if (isOpened &&
          _angleController.status == AnimationStatus.completed) {
        isOpened = !isOpened;
        _angleController.reverse();
        _selectedTab(index);
      }
    });
  }

  animate() {
    if (!isOpened && _angleController.status == AnimationStatus.dismissed) {
      _angleController.forward();

      _selectedTab(4);
    } else if (isOpened &&
        _angleController.status == AnimationStatus.completed) {
      _angleController.reverse();
      _selectedTab(_lastSelected);
    }
    isOpened = !isOpened;
    print(isOpened.toString());
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    switch (_index) {
      case 0:
        child = HomeScreen();
        break;
      case 1:
        child = FavouriteScreen();
        break;
      case 2:
        child = FlutterLogo(colors: Colors.red);
        break;
      case 3:
        child = ProfileScreen();
        break;
      case 4:
        child = EditProfile();
        break;
    }

    return Scaffold(
      body: SizedBox.expand(child: child),
      floatingActionButton: Transform.rotate(
        angle: _angle,
        child: FloatingActionButton(
          elevation: 3,
          splashColor: Colors.white54,
          backgroundColor: AppTheme.buttonColor,
          onPressed: animate,
          tooltip: 'Toggle',
          child: Icon(
            Icons.add,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.black54,
        selectedColor: AppTheme.buttonColor,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(
            iconData: Icons.home,
          ),
          FABBottomAppBarItem(
            iconData: Icons.bookmark_border,
          ),
          FABBottomAppBarItem(
            iconData: Icons.notifications,
          ),
          FABBottomAppBarItem(
            iconData: Icons.person_outline,
          ),
        ],
      ),
    );
  }
}
