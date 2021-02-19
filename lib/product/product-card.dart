

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PorductCardState();
  }
}

class _PorductCardState extends State<ProductCard>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2,horizontal: 5),
      child: Card(
        elevation: 5,
        child: ListView(
          shrinkWrap: true,
          children: [
            Image.asset("image/lake.jpg"),
            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Text("Plus mini",style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold
              ),),
            ),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
              title: Text("price",style: TextStyle(
                fontSize: 15,
                color: Colors.red,
                fontWeight: FontWeight.bold
              ),),
              subtitle: Text("368 solid",style: TextStyle(
                fontSize: 10
              ),),
              trailing: Text("...",style: TextStyle(
                fontSize: 15,
                fontWeight:FontWeight.bold
              ),),
            )
          ],
        ),
      )
    );
  }
}