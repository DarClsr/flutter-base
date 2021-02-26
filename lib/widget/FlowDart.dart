

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_layout/common/TopBar.dart';

class FlowCourse extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
     // TODO: implement build
     return Scaffold(
       appBar: TopBar(title: "Flow 组件"),
       body: ListView(
         children: [
           ListTile(
             title: Text("Flow 组件"),
           ),
           Container(
             height: 300,
             child: FlowPopMenu(),
           ),
           Container(
             height: 300,
             child: FlowCircleMenu(),
           )
         ],
       ),
     );
   }
}

class SimpleFlowDelegate extends FlowDelegate {
  SimpleFlowDelegate({this.animation}) : super(repaint: animation);
  Animation<double> animation;
  @override
  void paintChildren(FlowPaintingContext context) {
    double x=50.0;
    double y=50.0;
    for (int i = 0; i < context.childCount; ++i) {
      x=context.getChildSize(i).width*i*animation.value;
      print("$x $y");
      context.paintChild(i,transform: Matrix4.translationValues(x, y, 0));
    }
  }
  @override
  bool shouldRepaint(SimpleFlowDelegate oldDelegate) {
    return animation==oldDelegate.animation;
  }
}


class FlowPopMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FlowPopMenuState();
  }
}

class _FlowPopMenuState extends  State<FlowPopMenu> with SingleTickerProviderStateMixin{
  AnimationController animateController;
  IconData active=Icons.home;
  final List<IconData> menus = [
    Icons.verified_user,
    Icons.share,
    Icons.collections,
    Icons.menu
  ];

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() => active = icon);
    } else {
      animateController.status == AnimationStatus.completed
          ? animateController.reverse() //展开和收拢的效果
          : animateController.forward();
    }
  }
  getFlowItem(IconData icon){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child:RawMaterialButton(
        fillColor: active==icon?Colors.amber[700]:Colors.red,
        child: Icon(icon,color: Colors.white,size: 30.0),
        splashColor: Colors.amber[100],
        shape: CircleBorder(),
        onPressed:(){
          _updateMenu(icon);
        },
      ) ,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    animateController=AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Flow(
        delegate: SimpleFlowDelegate(animation: animateController),
        children: menus.map<Widget>((IconData v){
          return getFlowItem(v);
        }).toList(),
      ),
    );
  }


}


class FlowCircleMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FlowCricleMenuState();
  }
}

class _FlowCricleMenuState extends  State<FlowCircleMenu> with SingleTickerProviderStateMixin{
  AnimationController animateController;
  IconData active=Icons.home;
  final List<IconData> menus = [
    Icons.verified_user,
    Icons.share,
    Icons.collections,
    Icons.menu
  ];

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() => active = icon);
    } else {
      animateController.status == AnimationStatus.completed
          ? animateController.reverse() //展开和收拢的效果
          : animateController.forward();
    }
  }
  getFlowItem(IconData icon){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child:RawMaterialButton(
        fillColor: active==icon?Colors.amber[700]:Colors.red,
        child: Icon(icon,color: Colors.white,size: 30.0),
        splashColor: Colors.amber[100],
        shape: CircleBorder(),
        onPressed:(){
          _updateMenu(icon);
        },
      ) ,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    animateController=AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Flow(
        delegate: SimpleFlowDelegate(animation: animateController),
        children: menus.map<Widget>((IconData v){
          return getFlowItem(v);
        }).toList(),
      ),
    );
  }


}
class circelDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    double x=50.0;
    double y=50.0;
    for (int i = 0; i < context.childCount; ++i) {
      x=context.getChildSize(i).width*i*10;
      print("$x $y");
      context.paintChild(i,transform: Matrix4.translationValues(x, y, 0));
    }
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}