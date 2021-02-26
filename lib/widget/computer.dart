

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_layout/common/TopBar.dart';



class Computer extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ComputerState();
  }
}
class keyboardItem {
  String text;
  Color textColor;
  Color color;
  Color highlightColor;
}

// _keyboardList

class ComputerState extends State<Computer> {

  final List<Map>  keyLists = [
    {
      'text': 'AC',
      'textColor': Colors.black,
      'color': Color(0xFFA5A5A5),
      'highlightColor': Color(0xFFD8D8D8)
    },
    {
      'text': '+/-',
      'textColor': Colors.black,
      'color': Color(0xFFA5A5A5),
      'highlightColor': Color(0xFFD8D8D8)
    },
    {
      'text': '%',
      'textColor': Colors.black,
      'color': Color(0xFFA5A5A5),
      'highlightColor': Color(0xFFD8D8D8)
    },
    {
      'text': '÷',
      'color': Color(0xFFE89E28),
      'highlightColor': Color(0xFFEDC68F)
    },
    {'text': '7', 'color': Color(0xFF363636)},
    {'text': '8', 'color': Color(0xFF363636)},
    {'text': '9', 'color': Color(0xFF363636)},
    {
      'text': 'x',
      'color': Color(0xFFE89E28),
      'highlightColor': Color(0xFFEDC68F)
    },
    {'text': '4', 'color': Color(0xFF363636)},
    {'text': '5', 'color': Color(0xFF363636)},
    {'text': '6', 'color': Color(0xFF363636)},
    {
      'text': '-',
      'color': Color(0xFFE89E28),
      'highlightColor': Color(0xFFEDC68F)
    },
    {'text': '1', 'color': Color(0xFF363636)},
    {'text': '2', 'color': Color(0xFF363636)},
    {'text': '3', 'color': Color(0xFF363636)},
    {
      'text': '+',
      'color': Color(0xFFE89E28),
      'highlightColor': Color(0xFFEDC68F)
    },
    {'text': '0', 'color': Color(0xFF363636), 'width': 158.0},
    {'text': '.', 'color': Color(0xFF363636)},
    {
      'text': '=',
      'color': Color(0xFFE89E28),
      'highlightColor': Color(0xFFEDC68F)
    },
  ];
  onValueChange(value){
    print(value);

  }
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: TopBar(title: "计算器",),
      body:Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        child:  Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Text("result"),
              ),
            ),
            Wrap(
              runSpacing: 18,
              spacing: 18,
              direction: Axis.horizontal,
              children: List.generate(keyLists.length, (index){
                var item=keyLists[index];
                return CalculatorItem(
                    text:item["text"],
                    width: item["width"],
                    height: item["height"],
                    highlightColor: item["highlightColor"],
                    color:item["color"],
                    callback:onValueChange,
                );
              }).toList(),
            )

          ],
        ),
      )
    );
  }
}

class CalculatorItem extends StatelessWidget {
  String text;
  double width;
  double height;
  Color highlightColor;
  Color color;
  final callback;


  CalculatorItem({this.text,this.width,this.height,this.highlightColor,this.color,this.callback});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Ink(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(200)),
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(200)),
        highlightColor: highlightColor ?? color ,
        onTap: (){
           this.callback(text);
        },
        child: Container(
          child: Text("$text",style: TextStyle(color: Colors.white,fontSize: 24)),
          width: width??70,
          height: height??70,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}