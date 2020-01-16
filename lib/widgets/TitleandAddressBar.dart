import 'package:flutter/material.dart';
import 'package:foodie/Styles/themeStyles.dart';

class TitleandAddressBar extends StatelessWidget {
  final String titleText, categoryType, address;

  final String price;
  TitleandAddressBar(
      {@required this.titleText,
      @required this.categoryType,
      @required this.price,
      @required this.address});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Row(
            children: <Widget>[
              Text(
                
                titleText,
                textAlign: TextAlign.start,
                style: AppTheme.cardtitleStyle.copyWith(fontSize: 18),
              ),
              SizedBox(
                width: 2,
              ),
              Card(
                shape: StadiumBorder(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(255, 86, 115, 0.4),
                            Color.fromRGBO(255, 140, 72, 0.7)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                  child:
                      Text(categoryType, style: TextStyle(color: Colors.white)),
                ),
              ),
              Card(
                shape: StadiumBorder(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff848DFF)),
                  child: Text(
                   price,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          child: Text(
            address,
            style: AppTheme.cardsubTitleStyle,
          ),
        ),
      ],
    );
  }
}
