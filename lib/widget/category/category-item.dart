
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child:Column(
        children: [
          Container(
            height: 55,
            width: double.infinity,
            child:  Image.asset("image/lake.jpg",fit: BoxFit.fitWidth),
          ),
          Expanded(
            child: Container(
              child:  Text("分类1"),
              padding: EdgeInsets.all(3),
            )
          )
        ],
      ),
    );
  }
}