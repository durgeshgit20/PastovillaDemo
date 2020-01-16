import 'package:flutter/material.dart';
import 'package:foodie/Styles/themeStyles.dart';
import 'package:foodie/models/Hotels.dart';
import 'package:foodie/pages/DetailsScreen.dart';

import 'package:foodie/widgets/TitleandAddressBar.dart';

class TrendingFoodList extends StatefulWidget {
  final bool isFavouritePage;
  final Hotels hotels;
  // bool iconPress;
  final ValueChanged<int> onPressed;

  TrendingFoodList(
      {@required this.hotels, @required this.isFavouritePage, this.onPressed});

  @override
  _TrendingFoodListState createState() => _TrendingFoodListState();
}

class _TrendingFoodListState extends State<TrendingFoodList> {
  @override
  void initState() {
    print(widget.hotels.rating.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.grey,
      onTap: () {
        print(widget.hotels.id);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return DetailsScreen(hotels: widget.hotels);

        }));
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.33,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  _buildUpperBody(context),
                  TitleandAddressBar(
                    titleText: widget.hotels.hotelName,
                    price: widget.hotels.price,
                    categoryType: widget.hotels.hotelCategory,
                    address: widget.hotels.address,
                  ),
                ],
              ),
              (widget.isFavouritePage)
                  ? _buildFloatingBookMark(context, widget.hotels)
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFloatingBookMark(BuildContext context, Hotels hotels) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.08,
      right: MediaQuery.of(context).size.width * 0.03,
      child: FloatingActionButton(
        heroTag: hotels.id,
        mini: true,
        backgroundColor: Colors.white,
        onPressed: ()=>widget.onPressed(int.parse(hotels.id)),
        //{
        //   setState(() {
        //     widget.iconPress = !widget.iconPress;

        //   });
        // },
        child: Icon(
          Icons.bookmark,
          color: AppTheme.buttonColor,
        ),
      ),
    );
  }

  Widget _buildUpperBody(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
        height: MediaQuery.of(context).size.height * 0.20,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          child: Image.network(
            widget.hotels.imgUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Card(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: (widget.hotels.isOpen)
                    ? Text(
                        'OPEN',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      )
                    : Text(
                        'CLOSE',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
            child: Card(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 5),
                    Text(widget.hotels.rating.toString()  ,
                        style: TextStyle(
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ]);
  }
}
