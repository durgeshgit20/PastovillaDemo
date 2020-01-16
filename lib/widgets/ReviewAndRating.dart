import 'package:flutter/material.dart';
import 'package:foodie/Styles/themeStyles.dart';
import 'package:foodie/models/Hotels.dart';

class ReviewAndRating extends StatelessWidget {
  final Comments comments;

  ReviewAndRating({@required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(3),
        enabled: true,
        leading: CircleAvatar(
          radius: 20.0,
          backgroundImage: AssetImage(comments?.userProfilePic),
          backgroundColor: Colors.transparent,
        ),
        title: Text(comments?.userName,style: AppTheme.cardtitleStyle.copyWith(fontSize: 18,fontWeight: FontWeight.w500),),
        subtitle: Padding(
          padding: const EdgeInsets.fromLTRB(0,5,0,0),
          child: Text(comments?.comment,style: AppTheme.cardsubTitleStyle.copyWith(fontSize:16,fontWeight: FontWeight.w500)),
        ),
        trailing: Card(
          elevation: 0,
          child: Container(
            padding: EdgeInsets.all(4),
            width: MediaQuery.of(context).size.width * 0.12,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.amber,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  comments.rating.toString(),
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
        ));
  }
}
