import 'package:flutter/material.dart';
import 'package:foodie/Styles/themeStyles.dart';
import 'package:foodie/models/Hotels.dart';

import 'package:foodie/widgets/TrendingFoodList.dart';

class AllTrendingFoodList extends StatelessWidget {
  final List<Hotels> hotelList;
  AllTrendingFoodList({@required this.hotelList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed:()=> Navigator.of(context).pop(),
          icon:Icon(Icons.arrow_back_ios),
          color:AppTheme.textColor
          ,
        ),
        title: Text(
          'Trending Food',
          style: AppTheme.titleStyle,
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: _buildTrendingFoodList(context),
        )
      ),
    );
  }

  Widget _buildTrendingFoodList(BuildContext context) {
    return Column(
      children: <Widget>[
      //  SearchBar(),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                for (final hotel in hotelList)
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: TrendingFoodList(hotels: hotel, isFavouritePage: false),
                  )
              ],
            )),
      ],
    );
  }
}
