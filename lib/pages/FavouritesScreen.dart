import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodie/Styles/themeStyles.dart';
import 'package:foodie/models/Hotels.dart';
import 'package:foodie/models/Hotels1.dart';
import 'package:foodie/widgets/SearchBar.dart';
import 'package:foodie/widgets/TrendingFoodList.dart';

class FavouriteScreen extends StatefulWidget {


  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  static final reponse = jsonDecode(jsonFavourite);
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

    static List<Hotels> hotelList =
      (reponse as List).map((i) => new Hotels.fromJson(i)).toList();
  List<Hotels> hotelListForDisplay = hotelList;
  

  bool isSearching = false;
  TextEditingController textEditingController;

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

  void _refreshWidgetState() {
    setState(() {
      isSearching = false;
      hotelListForDisplay = hotelList;
    });
  }

  @override
  void initState() {
    textEditingController = TextEditingController();
   // print(hotelList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          //   SizedBox(height: 20),
          isSearching
              ? Card(
                  elevation: 2,
                  child: SearchBar(
                      _onChanged, textEditingController, _refreshWidgetState),
                )
              : AppBar(
                  backgroundColor: Colors.white,
                  title: Center(
                    child: Text(
                      'My Favourite',
                      style: AppTheme.titleStyle,
                    ),
                  ),
                  actions: <Widget>[
                    IconButton(
                      onPressed: () => setState(() {
                        isSearching = true;
                      }),
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
          SizedBox(height: 15),
          _buildTrendingFoodList(context),
          SizedBox(height: 15),
        ],
      ),
    );
  }

  Widget _buildTrendingFoodList(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        height: MediaQuery.of(context).size.height * 0.75,
        width: MediaQuery.of(context).size.width,
        child: AnimatedList(
          key: _listKey,
          initialItemCount: hotelList.length,
          scrollDirection: Axis.vertical,
          itemBuilder:
              (BuildContext context, int index, Animation<double> animation) {
               
            // for (final hotel in hotelList)
            return Container(
              
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TrendingFoodList(
                  hotels: hotelList[index],
                  isFavouritePage: true,
                  onPressed: deleteHotel),
            );
          },
        ));
  }

  void deleteHotel(int index) {
    print(index);
      
  
    var hotel = hotelList.removeAt(index - index);
    _listKey.currentState.removeItem(
      index - index,
      (BuildContext context, Animation<double> animation) {
        return FadeTransition(
          opacity:
              CurvedAnimation(parent: animation, curve: Interval(0.5, 1.0)),
          child: SizeTransition(
            sizeFactor:
                CurvedAnimation(parent: animation, curve: Interval(0.0, 1.0)),
            axisAlignment: 0.0,
            child: TrendingFoodList(
              hotels: hotel,
              isFavouritePage: false,
            ),
          ),
        );
      },
      duration: Duration(milliseconds: 600),
    );
  }
}
