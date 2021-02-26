

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_layout/common/TopBar.dart';

class GestureCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: TopBar(title: "手势识别"),
      body: ListView(
        children: [
            GestureDetector(
              child: Container(
                color: Colors.blue,
                width: 200,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(20),
                child: Text("点击事件"),
              ),
              onTap: (){
                print("tap it");
              },
              onTapDown:(TapDownDetails tapDownDetails){
                print("按下的时候触发");
              },
              onTapUp:(TapUpDetails tapUpDetails){
                print("抬起的时候触发");
              },
              onPanCancel: (){
                print("点击取消事件触发");
              },
              onLongPress: (){
                print("长按事件触发");
              },
              onVerticalDragDown: (DragDownDetails dragDowDetails){
                print("垂直拖动");
              },
            ),

            SizedBox(height: 10),

           InkWell(
             onTap: (){},
             borderRadius: BorderRadius.all(Radius.circular(10)),
             child:Container(
               height: 40,
               alignment: Alignment.center,
               decoration: BoxDecoration(
                 border: Border.all(color:Colors.blue),

               ),
               child:  Text("这是点击InkWell出现的效果  水波纹超出"),
             ),
             highlightColor: Colors.red,
             splashColor: Colors.blue,
           ),

          Ink(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: InkWell(
              borderRadius:  BorderRadius.all(Radius.circular(10)),
              onTap: (){},
              child:Container(
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color:Colors.blue),
                ),
                child:  Text("这是点击InkWell出现的效果  水波纹超出"),
              ),
              highlightColor: Colors.red,
              splashColor: Colors.blue,
            ),
          ),

          ListTile(
              title:Text("案例1 实现登录")
          ),

          SizedBox(height: 30),
          Loading(),
          SizedBox(height: 15),
          ListTile(
              title:Text("案例2 画板登录")
          ),
          DawerBox(),
        ],
      ),
    );
  }
}

class Loading extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoadingState();
  }
}

class _LoadingState extends State<Loading> {
  String status="login";
  @override
  Widget build(BuildContext context) {
      Widget item;
      switch(this.status){
        case "login":
          item=Text("login");
          break;
        case "padding":
          item=CircularProgressIndicator(
            backgroundColor: Colors.white,
            strokeWidth: 2,
          );
          break;
        case "end":
          item=Icon(
            Icons.check,
            color: Colors.white,
          );
      }
    // TODO: implement build
    return  RaisedButton(
      child: item,
      color: Colors.blue,
      onPressed: (){
        setState(() {
          this.status="padding";
        });
        Future.delayed(Duration(seconds: 2),(){
          setState(() {
            status="end";
          });
        });
      },
    );
  }
}



class DawerBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DawerBoxState();
  }
}

class DawerBoxState extends State<DawerBox>{
  List<List<Offset>> _path = [];
   String test="test";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Listener(
      onPointerDown: (PointerDownEvent pointerDownEvent) {
        setState(() {
           _path.add([pointerDownEvent.localPosition]);
        });
      },
      onPointerMove: (PointerMoveEvent pointerMoveEvent) {
        setState(() {
          _path[_path.length-1].add(pointerMoveEvent.localPosition);
        });
      },
      onPointerUp: (PointerUpEvent pointerUpEvent) {
        setState(() {
          _path[_path.length-1].add(pointerUpEvent.localPosition);
        });
      },
      child: Card(
        margin: EdgeInsets.all(20.0),
        child: Container(
          height: 400,
          child: Container(
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter:DrawingBoardPainter(_path),
              )
          ),
        ),
        elevation: 12,
      ),
    );
  }
}

class DrawingBoardPainter extends CustomPainter {
  final List<List<Offset>> path;
  DrawingBoardPainter(this.path);
  Paint _paint =Paint()
    ..color=Colors.red
   ..style=PaintingStyle.stroke
  ..strokeWidth=3;
  @override
  void paint(Canvas canvas,Size size){
     path.forEach((list) {
       Path _path=Path();
       for(int i=0;i<list.length;i++){
         if(i==0){
            _path.moveTo(list[i].dx, list[i].dy);
         }else{
           _path.lineTo(list[i].dx, list[i].dy);
         }
         canvas.drawPath(_path,_paint);
       }

     });
  }


  @override
  shouldRepaint(DrawingBoardPainter oldDelegate){
    return true;
  }





}