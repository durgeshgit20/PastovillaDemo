import 'package:flutter/material.dart';
import 'package:foodie/Styles/themeStyles.dart';
import 'package:foodie/pages/EditProfile.dart';

import 'package:foodie/pages/SettingsScreen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var result;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('My Profile', style: AppTheme.cardtitleStyle),
      ),
      body: _buildBody(context),
    );

  }

  Widget _buildBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.60,
      child: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Center(
            child: CircleAvatar(
              radius: 70,
              backgroundImage: (result != null)
                  ? FileImage(result)
                  : AssetImage("assets/images/FoodImage.png"),
            ),
          ),
          SizedBox(height: 25),
          Text('John Williams', style: AppTheme.titleStyle),
          SizedBox(height: 15),
          Text('john.williams@gmail.com', style: AppTheme.cardsubTitleStyle),
          SizedBox(height: 20),
          _buildFollowersAndFollowing(context),
          SizedBox(height: 15),
          _buildButtonsBody(context),
          SizedBox(height: 15),
          Divider(
            height: 4,
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _buildFollowersAndFollowing(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildColumnData("250", "Reviews"),
          _buildColumnData("100k", "Followers"),
          _buildColumnData("30", "Following"),
        ],
      ),
    );
  }

  Widget _buildColumnData(String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(
          title,
          style: AppTheme.titleStyle.copyWith(fontSize: 20),
        ),
        Text(
          subtitle,
          style: AppTheme.cardsubTitleStyle,
        )
      ],
    );
  }

  Widget _buildButtonsBody(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        OutlineButton(
          highlightColor: Color(0xff222455),
          padding: EdgeInsets.all(10),
          onPressed: () {
           _navigateAndDisplaySelection(context);
          },
          child: Text("Edit Profile", style: AppTheme.cardsubTitleStyle),
        ),
        SizedBox(
          width: 15,
        ),
        OutlineButton(
          highlightColor: Color(0xff222455),
          padding: EdgeInsets.all(10),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return SettingsScreen();
            }));
          },
          child: Text("Settings", style: AppTheme.cardsubTitleStyle),
        ),
      ],
    );
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
   result = await Navigator.push(
      context,
      // Create the SelectionScreen in the next step.
      MaterialPageRoute(builder: (context) =>  EditProfile()),
    );

  }
}
