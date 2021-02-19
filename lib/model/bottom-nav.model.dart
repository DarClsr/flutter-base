
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavModel {
    Icon icon;
    String path;
    BottomNavModel({this.icon,this.path});
}
List<BottomNavModel> BottomNavs=[
  BottomNavModel(icon: Icon(Icons.home),path: "/home"),
  BottomNavModel(icon: Icon(Icons.collections),path:"/collect"),
  BottomNavModel(icon: Icon(Icons.supervised_user_circle_sharp),path:"/me"),
];