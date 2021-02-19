

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_layout/model/bottom-nav.model.dart';

class BottomNavWidget extends StatefulWidget {
  int index;
  final callback;
  BottomNavWidget(this.index,{this.callback});
  @override
  State<StatefulWidget> createState() => _BottomNavWidgetState(this.index);
}


class _BottomNavWidgetState extends State<BottomNavWidget> with SingleTickerProviderStateMixin{
  int index;
  _BottomNavWidgetState(this.index);
  List navs=BottomNavs;
  int current=0;
  AnimationController _animationController;
  Animation<double> _moveAnimation;
  getButtons (){
    List<Widget> buttons=new List();
     for(int i=0;i<navs.length;i++){
        final BottomNavModel item=navs[i];
        var currentWidget=i==this.current?
        activeButton(item.icon):
        IconButton(icon: item.icon,
            onPressed:(){
          setCuurent(i,item.path);
        });
        buttons.add(
           currentWidget
        );
     }
     return buttons.toList();
  }
  setCuurent(int i,String path){
    _animationController.reset();
    this.setState(() {
       this.current=i;
       widget.callback(i);
       // Navigator.pushNamed(context, path);
    });
    _animationController.forward();
  }
  activeButton(Icon icon){
    return Container(
      child: ScaleTransition(
        scale:_moveAnimation,
        child:Container(
          child:  CircleAvatar(
            backgroundColor: Colors.blue,
            child: icon
          ),
        )
      )
    );

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomAppBar(
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: getButtons()
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    _animationController=AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200)
    );
    final CurvedAnimation curve= CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn
    );
    _moveAnimation=Tween(begin: 0.8,end: 1.2).animate(curve);
    current=index;
    super.initState();
  }
}

