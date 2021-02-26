

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_layout/model/bottom-nav.model.dart';

class BottomNavWidget extends StatefulWidget {
  int index;
  final callback;
  int currentPage;
  BottomNavWidget({Key key,this.index,this.callback,this.currentPage}):super(key: key);
  @override
  State<StatefulWidget> createState() => _BottomNavWidgetState();
}


class _BottomNavWidgetState extends State<BottomNavWidget> with SingleTickerProviderStateMixin{

  List navs=BottomNavs;
  AnimationController _animationController;
  Animation<double> _moveAnimation;

  getButtons (){
    if(widget.currentPage==widget.index){
      _animationController.reset();
      _animationController.forward();
    }
    List<Widget> buttons=new List();
    for(int i=0;i<navs.length;i++){
       final BottomNavModel item=navs[i];

       var currentWidget=i==widget.currentPage?
        activeButton(item.icon,i):
        IconButton(icon: Icon(item.icon) , onPressed:(){
          setCurrent(i);
        });
        buttons.add(
           currentWidget
        );
     }
     return buttons.toList();

  }
  setCurrent(int i){
    widget.callback(i);
  }

  activeButton(IconData icon,int i){
    return Container(
      child: ScaleTransition(
        scale:_moveAnimation,
        child: Container(
          color: Colors.transparent,
          child:  CircleAvatar(
              backgroundColor: Color(0xff57cb5e),
              child: Icon(icon,color: Colors.white)
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
        children:navs.asMap().keys.map((value){
           return Container(
             width: 50,
             child:Stack(
                 children:[
                   Positioned(
                       child:getButtons()[value]
                   )
                 ]
             ),
           );
        }).toList()
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
    super.initState();
  }
}

