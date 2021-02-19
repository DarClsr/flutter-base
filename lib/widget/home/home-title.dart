

import 'package:flutter/cupertino.dart';
import 'package:fluuter_layout/styles/custom-text-style.dart';

class HomeTilte extends StatelessWidget{
  String title;
  String subTitle;
  bool showMore=true;
  HomeTilte({this.title,this.subTitle,this.showMore=true});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Text(title,style: TopTitleStyle),
           subTitle==null?Text(""):Text(subTitle,style: SecondTitleStyle)
         ],
      ),
    );
  }
}