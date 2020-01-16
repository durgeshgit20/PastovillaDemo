import 'package:flutter/material.dart';
import 'package:foodie/Styles/themeStyles.dart';
import 'package:foodie/models/Hotels.dart';
import 'package:foodie/pages/WriteReviewAndRating.dart';
import 'package:foodie/widgets/ReviewAndRating.dart';
import 'package:foodie/widgets/TitleBar.dart';
import 'package:foodie/widgets/TitleandAddressBar.dart';

class DetailsScreen extends StatelessWidget {
  final Hotels hotels;

  DetailsScreen({this.hotels});
  @override
  Widget build(BuildContext context) {
    final List commentsList = hotels.comments;

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(
                  0, 0, 0, MediaQuery.of(context).size.height * 0.07),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,  
                    snap: false,
                    floating: false,
                    expandedHeight: MediaQuery.of(context).size.height * 0.33,
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(hotels.hotelName),
                      background: Image.network(
                        hotels.imgUrl,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    actions: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.share),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.bookmark_border),
                      )
                    ],
                  ),
                  SliverFillRemaining(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          _buildTitleAnAddressWithTime(),
                          SizedBox(height: 10),
                          TitleBar(
                              titleText: 'Menu & Photos',
                              titleCount:
                                  hotels.menuAndPhotos?.length.toString(),
                                  onPressed: null,),
                          _buildMenuAndPhotosList(context),
                           SizedBox(height: 10),
                          TitleBar(
                              titleText: 'Reviwes & Ratings ',
                              titleCount: hotels.comments?.length.toString(),
                              onPressed: null,),
                          _buildReviewsAndRatingsList(
                              context, commentsList, hotels),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _buildBottomButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleAnAddressWithTime() {
    return Column(
      children: <Widget>[
        TitleandAddressBar(
          address: hotels.address,
          price: hotels.price,
          categoryType: hotels.hotelCategory,
          titleText: hotels.hotelName,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: <Widget>[
                (hotels.isOpen)
                    ? Text('Open Now',
                        style: AppTheme.cardsubTitleStyle
                            .copyWith(color: Colors.green, fontSize: 18))
                    : Text('Closed',
                        style: AppTheme.cardsubTitleStyle
                            .copyWith(color: Colors.red, fontSize: 18)),
                SizedBox(
                  width: 5,
                ),
                Text('daily', style: AppTheme.cardsubTitleStyle),
                SizedBox(
                  width: 5,
                ),
                Text(hotels.timing,
                    style: AppTheme.cardsubTitleStyle
                        .copyWith(color: Colors.red, fontSize: 18)),
              ],
            ))
      ],
    );
  }

  Widget _buildMenuAndPhotosList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hotels.menuAndPhotos.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.25,
            child: Image.asset(
              hotels.menuAndPhotos[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  Widget _buildReviewsAndRatingsList(
      BuildContext context, List<Comments> commentsList, Hotels hotels) {
    return (commentsList != null)
        ? Expanded(
            child: 
              MediaQuery.removePadding(
                removeTop: true,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    for (final comment in commentsList)
                      ReviewAndRating(
                        comments: comment,
                      )
                  ],
                ),
                context: context,
              )
            ,
          )
        :Wrap(
          children: <Widget>[
            Padding(
            child: Center(
              child: Text(
                'Not Reviewed Yet, Be the first one to review hotel ${hotels.hotelName}',
                style:
                    AppTheme.cardsubTitleStyle.copyWith(color: Colors.black54),
              ),
            ),
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          )
          ],
        ); 
  }

  Widget _buildBottomButton(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return WriteReviewAndRating();
        })),
        child: Container(
          padding: EdgeInsets.all(5),
          child: Center(
              child: Text(
            'Rate Your Experience',
            style: AppTheme.buttonTextStyle1,
          )),
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            color: Color(0xff5663FF),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          ),
        ),
      ),
    );
  }
}
