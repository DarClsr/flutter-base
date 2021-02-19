


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserItem extends StatefulWidget {
   @override
  State<StatefulWidget> createState()=>_UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(5),
      width: 150,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 250,
            child: Image.asset("image/lake.jpg",fit: BoxFit.fitHeight,),
          ),
          Positioned(
            child:  RaisedButton(
              child: Text("name",style: TextStyle(color:Colors.white)),
              color: Colors.redAccent,
              onPressed: (){},
            ),
            bottom: -5,
          )
        ],
      ),
    );
  }
}