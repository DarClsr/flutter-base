

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class OpacityCard extends StatefulWidget {
   @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OpacityCardState();
  }
}

class OpacityCardState extends State<OpacityCard>{
  bool show=false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Column(
        children: [
            ListTile(
              title: Text("动画widget 透明度"),
              leading: IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: (){
                  setState(() {
                    this.show=!this.show;
                  });
                },
              ),
            ),
            Container(
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 1200),
                opacity: show?1:0.2,
                child:Container(
                  height: 100,
                  width: 100,
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