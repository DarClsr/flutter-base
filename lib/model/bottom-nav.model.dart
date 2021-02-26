
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavModel {
     IconData icon;
    BottomNavModel({this.icon});
}
List<BottomNavModel> BottomNavs=[
  BottomNavModel(icon:Icons.home),
  BottomNavModel(icon: Icons.collections),
  BottomNavModel(icon:Icons.supervised_user_circle),
];