


import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AlignCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AlignCardState();
  }
}

class AlignCardState extends State<AlignCard>{
  var  _alignment=Alignment.center;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text("动画widget 平移"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: Text("左上"),
                onPressed: (){
                    setState(() {
                      _alignment=Alignment.topLeft;
                    });
                },
              ),
              RaisedButton(
                child: Text("随机数值 x，y"),
                onPressed: (){
                  setState(() {
                     var rng=new Random();
                     double x=rng.nextDouble();
                     double y=rng.nextDouble();
                    _alignment=Alignment(x,y);
                  });
                },
              ),
              RaisedButton(
                child: Text("中间"),
                onPressed: (){
                  setState(() {
                    _alignment=Alignment.center;
                  });
                },
              ),

            ],
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.blue,
            child: AnimatedAlign(
              duration: Duration(milliseconds: 1200),
              alignment: _alignment,
              child:Container(
                height: 10,
                width: 10,
                color: Colors.red,
              ) ,
            ),
            margin: EdgeInsets.all(20),
          )
        ],
      ),
      margin: EdgeInsets.all(20),
    );
  }
}