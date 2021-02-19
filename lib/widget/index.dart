

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_layout/common/BottomNavWidget.dart';
import 'package:fluuter_layout/routes/route.dart';
import 'package:fluuter_layout/widget/home/home.dart';

class IndexPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage> {
    int  current;
   _IndexPageState({this.current=0});
    List pageList= tabPage;
    
    setCurrent(int value){
      setState(() {
        this.current=value;
      });
    }
    @override
   Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: pageList[current],
      bottomNavigationBar: BottomNavWidget(
          current,
          callback:(value)=>setCurrent(value)
      ),
    );

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}