import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodie/Styles/themeStyles.dart';
import 'package:foodie/models/Category.dart';
import 'package:foodie/models/Hotels.dart';
import 'package:foodie/models/Hotels1.dart';
import 'package:foodie/pages/AllCategoryList.dart';
import 'package:foodie/pages/AllTrendingFoodList.dart';

import 'package:foodie/widgets/CategoryList.dart';
import 'package:foodie/widgets/SearchBar.dart';
import 'package:foodie/widgets/TrendingFoodList.dart';
import 'package:foodie/widgets/TitleBar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearching = false;
 FocusNode _focusNode;
  static final hotelListResponse = jsonDecode(jsonString);
  static final categoryListResponse = jsonDecode(jsonCategory);
  TextEditingController textEditingController;

  List<Category> categoryList = (categoryListResponse as List)
      .map((i) => new Category.fromJson(i))
      .toList();

  static List<Hotels> hotelList =
      (hotelListResponse as List).map((i) => new Hotels.fromJson(i)).toList();
  List<Hotels> hotelListForDisplay = hotelList;



  @override
  void initState() {
    super.initState();
    _focusNode=new FocusNode();
    textEditingController = TextEditingController();
    print(hotelListForDisplay.length);
  }

  void _refreshWidgetState() {
    setState(() {
      hotelListForDisplay = hotelList;
      isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: _buildBody(context),
    );
  }

  void _onChanged(String text) {
    text = textEditingController.text.toLowerCase().trim();
    setState(() {
      isSearching = true;
      hotelListForDisplay = hotelList.where((hotel) {
        var hotelTitle = hotel.hotelName.toLowerCase();
        return hotelTitle.contains(text);
      }).toList();
    });
    print(text);
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      
      child: (isSearching)
          ? 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(10),
                  child: SearchBar(
                      _onChanged, textEditingController, _refreshWidgetState),
                ),
                SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Searh results...',
                      style: AppTheme.titleStyle.copyWith(fontSize: 18)),
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: _buildTrendingFoodList(context, Axis.vertical,
                      MediaQuery.of(context).size.height),
                ),
              ],
            )
          : Column(
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.all(10),
                  child: SearchBar(
                      _onChanged, textEditingController, _refreshWidgetState),
                ),
                SizedBox(height: 8),
                TitleBar(
                  titleText: 'Trending Food',
                  titleCount: hotelList.length.toString(),
                  onPressed: _goToTrendingScreen,
                ),
                SizedBox(height: 10),
                _buildTrendingFoodList(context, Axis.horizontal,
                    MediaQuery.of(context).size.height * 0.35),
                SizedBox(height: 10),
                TitleBar(
                    titleText: 'Category', titleCount: '9', onPressed: null),
                SizedBox(height: 10),
                _buildCategoryList(context),
              ],
            ),
    );
  }

  void _goToTrendingScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AllTrendingFoodList(
        hotelList: hotelList,
      );
    }));
  }

  void _goToCategoryScreen() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AllCategoryList(
        category: categoryList,
      );
    }));
  }

  Widget _buildTrendingFoodList(
      BuildContext context, Axis axisDirection, double height) {
    return Container(
        height: height,
        width: MediaQuery.of(context).size.width * 0.95,
        child: MediaQuery.removePadding(
          removeTop: true,
          child: ListView(
            scrollDirection: axisDirection,
            children: <Widget>[
              for (var hotel in hotelListForDisplay.toList())
                TrendingFoodList(hotels: hotel, isFavouritePage: false)
            ],
          ),
          context: context,
        ));
  }

  Widget _buildCategoryList(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width * 0.95,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            for (final category in categoryList.take(5).toList())
              CategoryList(
                category: category,
              )
          ],
        ));
  }
}
