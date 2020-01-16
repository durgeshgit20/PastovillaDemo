import 'package:flutter/material.dart';
import 'package:foodie/Styles/themeStyles.dart';

import 'package:foodie/pages/LoginScreen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
          color: Color(0xff222455),
        ),
        centerTitle: true,
        title: Text(
          'Settings',
          style: AppTheme.cardtitleStyle,
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        _buildHeader('Account', context),
        _buildListTiles('Change Password', context),
        Divider(height: 3),
        _buildListTiles('Change Language', context),
        Divider(height: 3),
        _buildHeader('Others', context),
        _buildListTiles('Privacy Policy', context),
        Divider(height: 3),
        _buildListTiles('Terms & Conditions', context),
        Divider(height: 3),
        ListTile(
            onTap: () => _showDialog(context),
            title: Text('Logout',
                style: AppTheme.cardtitleStyle
                    .copyWith(fontSize: 18, color: Color(0xff5663FF)))),
      ],
    );
  }

  Widget _buildHeader(String title, BuildContext context) {
    return Container(
        width: double.infinity,
        color: Color(0xffEAEBEF),
        height: MediaQuery.of(context).size.height * 0.08,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(title, style: AppTheme.cardsubTitleStyle),
            ),
          ],
        ));
  }

  Widget _buildListTiles(String title, BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.08,
      child: ListTile(
        title:
            Text(title, style: AppTheme.cardtitleStyle.copyWith(fontSize: 18)),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Are you sure you want to logout?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Row(
              children: <Widget>[
                new FlatButton(
                  child: new Text("No"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                     child: new Text("Yes"),
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return LoginScreen();
                    }),ModalRoute.withName('/login'));
                  },
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
