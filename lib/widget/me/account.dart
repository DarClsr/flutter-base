

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_layout/common/BottomNavWidget.dart';

class Account extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>_AccountState();
}

 class _AccountState extends State<Account> {
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("account"),
      ),
      body: Text("account"),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           Navigator.pushNamed(context, "/grid").then((value) => print(value));
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.grade),
      ),
    );
  }
 }