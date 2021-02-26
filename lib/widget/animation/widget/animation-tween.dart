

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweenCard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TweenCardState();
  }
}

class _TweenCardState extends State<TweenCard> with SingleTickerProviderStateMixin{
  AnimationController _animationController;

  Animation offsetAnimation;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build


     return Card(
       elevation: 10,
       margin: EdgeInsets.all(10),
       child: Column(
         children: [
           ListTile(
             title: Text("动画补间 放大缩小"),
             leading: IconButton(
               icon: Text("放大"),
               onPressed: (){
                 setState(() {
                   offsetAnimation=Tween(begin: 1.0,end: 2.0).animate(_animationController);
                 });
                 _animationController.reset();
                 _animationController.forward();
               },
             ),
             trailing:IconButton(
               icon: Text("放大"),
               onPressed: (){
                 setState(() {
                   offsetAnimation=Tween(begin: -0.5,end: -0.5).animate(_animationController);
                 });
                 _animationController.reset();
                 _animationController.forward();
               },
             ),
           ),
           SizedBox(height: 10),
           ScaleTransition(
             scale: offsetAnimation,
             child: Container(
               height: 30,
               width: 30,
               color: Colors.orange,
               margin: EdgeInsets.all(20),
             ),

           )
         ],
       ),
     );

  }

  @override
  void initState() {
    // TODO: implement initState
    _animationController=AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    offsetAnimation=Tween(begin: 1.0,end: 2.0).animate(_animationController);
    super.initState();
  }
}