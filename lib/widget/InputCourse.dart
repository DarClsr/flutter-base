

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_layout/common/TopBar.dart';

class InputCourse extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _InputCourseState();
  }
}


class _InputCourseState extends State<InputCourse> {
  String value;

  @override
  Widget build(BuildContext context) {
    RenderBox box=context.findRenderObject();
    final Shader linearGradient=LinearGradient(
        colors:<Color> [
          Colors.blue,
          Colors.redAccent
        ]
    ).createShader(
        Rect.fromLTWH(0, 0, box?.size?.width, box?.size?.height)
    );
    // TODO: implement build
    return Scaffold(
      appBar: TopBar(title: "文本组件"),
      body: ListView(
        children: [
           ListTile(
             title: Text("文本输入组件"),
           ),
           Center(
             child: Container(
               padding: EdgeInsets.all(20),
               child: TextField(
                 decoration: InputDecoration(
                   icon: Icon(Icons.person),
                   labelText: "username",
                   helperText: "username length 8-10",
                   counterText: "",
                   helperMaxLines: 1,
                   errorMaxLines: 5,
                   errorText: "用化名输入错误",
                   hintText: "username",
                   prefixIcon: Icon(Icons.home),
                   suffixIcon: Icon(Icons.supervised_user_circle),
                 ),
                 onChanged: (value){
                  setState(() {
                    this.value=value;
                  });
                 },
               ),
             ),
           ),
          ListTile(
            title: Text("文本组件案例"),
          ),
          Center(
            child: Text("渐变文字",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader=linearGradient
            ),),
          ),
          SizedBox(height: 15,),
          Center(
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  WidgetSpan(
                    child: Container(
                      child: Text("heihei"),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 15),
                      color: Colors.red,
                    )
                  ),
                  TextSpan(
                      text:"带标签文本"
                      ,style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),),
                ]
              ),

            )
          ),
          SizedBox(height: 10),

          ListTile(
            title: Text("文本事件"),
          ),

         Center(
           child:RichText(text: TextSpan(
               style: TextStyle(
                   fontSize: 20,
                   color: Colors.grey
               ),
               children: [
                 TextSpan(
                   text: "登录代表您同意",
                 ),
                 TextSpan(
                     text: "<<隐私政策>>",
                     style: TextStyle(
                         color: Colors.blue
                     ),
                  
                 )
               ]
           )),
         )





        ],
      ),
    );
  }
}