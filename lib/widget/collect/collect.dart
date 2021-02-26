

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_layout/api/http.dart';

class CollectPage extends StatelessWidget {
  fetchData () async {
    String url="http://127.0.0.1:3000/page/pageList";
    var data=await httpGet(url);
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
         padding: EdgeInsets.all(20),
         child: ListView(
           children: [
             RaisedButton(
               child: Text('go animation'),
               color: Colors.red,
               textColor: Colors.white,
               onPressed: (){
                  Navigator.of(context).pushNamed("/animation");
               },
             ),
             SizedBox(height: 10),
             RaisedButton(
               child: Text('fetch data'),
               color: Colors.red,
               textColor: Colors.white,
               onPressed: (){
                  fetchData();
               },
             ),

             RaisedButton(
               child: Text('文本框组件'),
               color: Colors.red,
               textColor: Colors.white,
               onPressed: (){
                 Navigator.of(context).pushNamed("/input");
               },
             ),
             RaisedButton(
               child: Text('Flow 组件'),
               color: Colors.red,
               textColor: Colors.white,
               onPressed: (){
                 Navigator.of(context).pushNamed("/flow");
               },
             ),

             RaisedButton(
               child: Text("相对父组件尺寸"),
               color: Colors.red,
               textColor: Colors.white,
               onPressed: (){
                 Navigator.of(context).pushNamed("/factor");
               },
             ),


             RaisedButton(
               child: Text("手势识别组件"),
               color: Colors.red,
               textColor: Colors.white,
               onPressed: (){
                 Navigator.of(context).pushNamed("/gesture");
               },
             ),

             RaisedButton(
               child: Text("计算器"),
               color: Colors.red,
               textColor: Colors.white,
               onPressed: (){
                 Navigator.of(context).pushNamed("/computed");
               },
             ),
           ],
         )
       ),
    );
  }
}

