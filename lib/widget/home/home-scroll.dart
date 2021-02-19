

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScroll extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScrollState();
  }
}

class _HomeScrollState extends State<HomeScroll> {
  double progress=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return NotificationListener(
      onNotification: (ScrollNotification notification){
        double progress=notification.metrics.pixels/notification.metrics.maxScrollExtent;
        print(progress);
        setState(() {
          this.progress=progress;
        });
      },
      child: Column(
        children: [
          Expanded(
            child:ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: 150,
                  height: 150,
                  color: Colors.red,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 150,
                  height: 150,
                  color: Colors.red,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  width: 150,
                  height: 150,
                  color: Colors.red,
                )
              ],
            ),
          ),
          Container(
            width: 200,
            height: 10,
            color: Colors.orange,
            child: LinearProgressIndicator(
              value: progress,
              valueColor: AlwaysStoppedAnimation(
                Colors.red
              ),
            )
          )
        ],
      )
    );
  }
}