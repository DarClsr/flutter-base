


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_layout/common/TopBar.dart';

class Factor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: TopBar(title: "相对父组件设置宽度"),
      body: ListView(
         children: [
           Container(
             width: 200,
             height: 200,
             color: Colors.blueAccent,
             child: FractionallySizedBox(
               alignment: Alignment.center,
               widthFactor: .8,
               heightFactor: .3,
               child: Container(
                 child: Text("child"),
                 color: Colors.white,
               ),
             ),
           ),

           ListTile(
             title:Text("案例1 用户描述"),
           ),
           Container(
             height: 100,
             margin: EdgeInsets.all(10),
             decoration: BoxDecoration(
                 color: Colors.white,
                 boxShadow: [
                 BoxShadow(
                   color: Colors.black12,
                   blurRadius: 15.0
                 ),
               ]
             ),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Container(
                      height: 80,
                      width: 80,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape:BoxShape.circle,
                          image: DecorationImage(
                           image: AssetImage("image/avatar.jpg"),
                           fit: BoxFit.cover
                         )
                      ),
                   ),
                  SizedBox(width: 10,),
                  Expanded(
                    child:  Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("iwan",style: TextStyle(
                            fontSize: 30,
                          ),),
                          Text("初级小白",style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey
                          ),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                     padding: EdgeInsets.all(10),
                    child: Icon(Icons.keyboard_arrow_right,size: 30),
                  )
                ],
             ),
           ),

           ListTile(
             title:Text("案例2 柱状图"),
             trailing: FlatButton(
               child: Text("change"),
               color: Colors.blueGrey,
               textColor: Colors.white,
               onPressed: (){
                    lineKey.currentState.changeList();
               },
             ),
           ),


           Container(
             margin: EdgeInsets.all(15),
             height: 200,
             decoration: BoxDecoration(
               border: Border(
                 left: BorderSide(color: Colors.red,width: 2),
                 bottom: BorderSide(color: Colors.red,width: 2)
               )
             ),
             child: Line(
               key:lineKey
             )
           )
         ],
      ),
    );
  }
}


//柱状图

GlobalKey<_LineState> lineKey=GlobalKey();

class Line extends StatefulWidget {
  Line({Key key}):super(key: key);
    @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LineState();
  }
}

class _LineState extends State<Line> {
  List<double> heightList=[60.0,80.0,100.0,140.0];

  changeList(){
    setState(() {
       heightList=heightList.reversed.toList();
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Row(
       mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(heightList.length, (index){
        return AnimatedContainer(
          duration: Duration(seconds: 1),
          height: heightList[index],
          width: 20,
          color: Colors.primaries[index % Colors.primaries.length],
        );
      })
    );
  }
}