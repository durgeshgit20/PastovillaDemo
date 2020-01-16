import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodie/Styles/themeStyles.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File imageFile;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = image;
    });
  }

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
          'Edit Profile',
          style: AppTheme.cardtitleStyle,
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            _buildCircularImage(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            _buildTextFields(Icons.person_outline, 'John Williams'),
            _buildTextFields(Icons.mail_outline, 'John.williams@gmail.com'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            _buildButton('Update', context),
          ],
        ),
      ),
    );
  }

  Widget _buildCircularImage() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 70,
            backgroundImage: (imageFile != null)
                ? FileImage(imageFile)
                : AssetImage("assets/images/FoodImage.png"),
          ),
          Positioned(right: -3, bottom: -2, child: _buildIcon())
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
        border: Border.all(width: 3.0, color: Colors.white),
      ),
      child: IconButton(
        onPressed: getImage,
        icon: Icon(
          Icons.edit,
          size: 18,
        ),
      ),
    );
  }

  Widget _buildTextFields(IconData icon, String hintText) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
      child: TextField(
        // keyboardType:
        //     (hintText.contains("@") ? TextInputType.emailAddress : TextInputType.text),
        decoration: InputDecoration(
            
            border: OutlineInputBorder(),
           
            prefixIcon: Icon(
              icon,
              color: Color(0xff222455),
            ),
            hintText: hintText,
            hintStyle: AppTheme.cardtitleStyle.copyWith(fontSize: 18)),
      ),
    );
  }

  Widget _buildButton(String buttonText, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: MaterialButton(
        color: Color(0xff5663FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minWidth: double.infinity,
        height: MediaQuery.of(context).size.height * 0.08,
        onPressed: () {
          if (imageFile != null) {
            Navigator.pop(context, imageFile);
          } else {
           // showInSnackBar('Please Select a Profile Pic..');
          }
        },
        child: Text(
          buttonText,
          style: AppTheme.buttonTextStyle1.copyWith(fontSize: 22),
        ),
      ),
    );
  }

  // void showInSnackBar(String value) {
  //   widget._scaffoldKey.currentState
       
  //       .showSnackBar(new SnackBar(content: new Text(value)));
  // }
}
