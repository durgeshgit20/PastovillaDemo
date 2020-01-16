import 'dart:convert';
import 'package:rating_bar/rating_bar.dart';

import 'package:flutter/material.dart';
import 'package:foodie/Styles/themeStyles.dart';
import 'package:foodie/models/Category.dart';
import 'package:foodie/models/Hotels1.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  static final categoryListResponse = jsonDecode(jsonCategory);
  final List<Category> categoryList = (categoryListResponse as List)
      .map((i) => new Category.fromJson(i))
      .toList();
  bool isSelected = false;
  double _initialRating ;
  Map<String, bool> selectedCategory = Map<String, bool>(); 
  @override
  void initState() {
   _initialRating=0.0;
    super.initState();
  }

  void _resetFilter() {
    setState(() {
      selectedCategory.clear();
    
       _buildRatingBar(context, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: IconThemeData(
          color: AppTheme.textColor,
        ),
        centerTitle: true,
        title: Text(
          'Filter',
          style: AppTheme.titleStyle,
          textAlign: TextAlign.center,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            onPressed: null,
          )
        ],
      ),
      body: SizedBox.expand(
        child: Stack(children: [
          _buildBody(context),
          _buildBottomButton(context),
        ]),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Container(
        padding: EdgeInsets.fromLTRB(2, 5, 5, 0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Center(
              child: Text(
                'Select Category',
                style: AppTheme.cardtitleStyle,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _buildChips(),
            SizedBox(
              height: 80,
            ),
            Text('Ratings', style: AppTheme.cardtitleStyle),
            SizedBox(
              height: 20,
            ),
            _buildRatingBar(context,_initialRating),
          ],
        ),
      ),
    );
  }

  Widget _buildChips() {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      spacing: 30,
      runSpacing: 5,
      children: <Widget>[
        for (final category in categoryList)
          FilterChip(
            backgroundColor:
                selectedCategory.containsKey("${category.categoryName}")
                    ? AppTheme.buttonColor
                    : Colors.white60,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Colors.grey)),
            onSelected: (bool) {
              setState(() {
                selectedCategory.containsKey("${category.categoryName}")
                    ? selectedCategory.remove("${category.categoryName}")
                    : selectedCategory.putIfAbsent(
                        "${category.categoryName}", () => true);
                print(selectedCategory);
              });
            },
            labelPadding: EdgeInsets.symmetric(horizontal: 10),
            label: Text(
              category.categoryName,
              style: selectedCategory.containsKey("${category.categoryName}")
                  ? AppTheme.buttonTextStyle1.copyWith(
                      fontSize: 20,
                    )
                  : AppTheme.cardsubTitleStyle.copyWith(fontSize: 20),
            ),
          )
      ],
    );
  }

  Widget _buildRatingBar(BuildContext context,double _initialRating) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black87.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5),
        ),
        height: MediaQuery.of(context).size.height * 0.10,
        width: MediaQuery.of(context).size.width * 0.80,
        child: Center(
          child: RatingBar(
            maxRating: 5,
            initialRating: _initialRating,
            filledIcon: Icons.star,
            emptyIcon: Icons.star_border,
            halfFilledIcon: Icons.star_half,
            isHalfAllowed: true,
            filledColor: Colors.amber,
            size: 40,
            onRatingChanged: (rating) {
              
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Positioned(
        bottom: 0,
        right: 0,
        left: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              child: Container(
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: _resetFilter,
                  child: Text(
                    'Reset',
                    style: AppTheme.buttonTextStyle1,
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  color: Color(0xff5663FF),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                  ),
                ),
              ),
            ),
            VerticalDivider(width: 0.5, color: Colors.white),
            Flexible(
              child: Container(
               
                child: MaterialButton(
                  minWidth: double.infinity,
                  onPressed: null,
                  child: Text(
                    'Apply',
                    style: AppTheme.buttonTextStyle1,
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  color: Color(0xff5663FF),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
