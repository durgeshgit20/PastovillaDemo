import 'package:flutter/material.dart';
import 'package:foodie/Styles/themeStyles.dart';
import 'package:foodie/models/Category.dart';

class CategoryList extends StatelessWidget {
  final Category category;
  CategoryList({@required this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      height: MediaQuery.of(context).size.height * 0.20,
      width: MediaQuery.of(context).size.width * 0.30,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(category.imgUrl)),
            ),
            height: MediaQuery.of(context).size.height * 0.20,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Color.fromRGBO(255, 86, 115, 0.3),
                    Color.fromRGBO(255, 40, 72, 0.4),
                  ],
                )),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              category?.categoryName,
              style: AppTheme.categoryTitleStyle,
            ),
          )
        ],
      ),
    );
  }
}
