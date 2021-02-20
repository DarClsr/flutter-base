

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_layout/common/BottomNavWidget.dart';
import 'package:fluuter_layout/routes/route.dart';
import 'package:fluuter_layout/widget/collect/collect.dart';
import 'package:fluuter_layout/widget/home/home.dart';
import 'package:fluuter_layout/widget/me/account.dart';

class IndexPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage> {
    int  current=2;
    PageController pageController=PageController(initialPage: 0);
    int pageCount=0;
    bool drag=true;
   _IndexPageState({this.current=0});
    List<Widget> pageList= tabPage.map<Widget>((value){
      return value;
    }).toList();
    
    setCurrent(int value){
          setState(() {
            current=value;
          });
    }
    @override
   Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:PageView(
        controller: pageController,
        children: pageList,
        onPageChanged: (value){
              setCurrent(value);
              if(drag){
                pageCount=pageController.page.round();
              }
        },
      ),
      bottomNavigationBar: new BottomNavWidget(
          index: current,
          currentPage:pageCount,
          callback:(value){
            setState(() {
              this.drag=false;
            });
            pageController.animateToPage(value, duration: Duration(milliseconds: 300), curve: Curves.fastOutSlowIn).then((value){
               setState(() {
                 pageCount=pageController.page.round();
                 this.drag=true;
               });
            });
          }
      ),
    );

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}