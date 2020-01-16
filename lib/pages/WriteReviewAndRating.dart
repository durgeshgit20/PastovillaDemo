import 'package:flutter/material.dart';

import 'package:foodie/Styles/themeStyles.dart';
import 'package:rating_bar/rating_bar.dart';

class WriteReviewAndRating extends StatefulWidget {
  @override
  _WriteReviewAndRatingState createState() => _WriteReviewAndRatingState();
}

class _WriteReviewAndRatingState extends State<WriteReviewAndRating> {
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff222455)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text('Reviews & Ratings', style: AppTheme.cardtitleStyle),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    _buildRatingBar(context),
                    SizedBox(height: 30),
                    Center(
                      child: Text('Rate your experience',
                          style: AppTheme.cardsubTitleStyle),
                    ),
                    SizedBox(height: 40),
                    _buildReviewTextField(context),
                  ],
                ),
              ),
            ),
            _buildBottomButton(context)
          ],
        ),
      ),
    );
  }

  Widget _buildRatingBar(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffEEF7FF),
          borderRadius: BorderRadius.circular(5),
        ),
        height: MediaQuery.of(context).size.height * 0.10,
        width: MediaQuery.of(context).size.width * 0.80,
        child: Center(
          child: RatingBar(
            maxRating: 5,
       
            filledIcon: Icons.star,
            emptyIcon: Icons.star_border,
            halfFilledIcon: Icons.star_half,
            isHalfAllowed: true,
            filledColor: Colors.amber,
            size: 40,
            onRatingChanged: (rating)=>print(rating),
          ),
        ),
      ),
    );
  }

  Widget _buildReviewTextField(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color(0xff8A98BA))),
      width: MediaQuery.of(context).size.width * 0.80,
      height: MediaQuery.of(context).size.height * 0.30,
      child: TextField(
        focusNode: _focusNode,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        style: AppTheme.cardsubTitleStyle
            .copyWith(fontSize: 20, color: Color(0xff222455)),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Write Your Experience',
          hintStyle: AppTheme.cardsubTitleStyle.copyWith(fontSize: 20),
        ),
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return (_focusNode.hasFocus)
        ? Container()
        : Positioned(
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
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                ),
              ),
            ),
          );
  }
}
