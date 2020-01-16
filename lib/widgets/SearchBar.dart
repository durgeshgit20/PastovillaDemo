import 'package:flutter/material.dart';
import 'package:foodie/Styles/themeStyles.dart';
import 'package:foodie/pages/FilterScreen.dart';

class SearchBar extends StatefulWidget {
  final Function onChanged;
  final Function notifyParent;
  final TextEditingController textController;

  SearchBar(this.onChanged, this.textController, this.notifyParent);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: TextField(
                controller: widget.textController,
                onChanged: widget.onChanged,
                style: AppTheme.cardtitleStyle.copyWith(fontSize: 20),
                decoration: InputDecoration(
                    prefixIcon: new Icon(Icons.search, color: Colors.black38),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                    hintText: "Search...",
                    hintStyle: AppTheme.hintTextStyle),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              setState(() {
                widget.textController.clear();
                widget.notifyParent();
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return FilterScreen();
              }));
            },
          ),
        ],
      ),
    );
  }
}
