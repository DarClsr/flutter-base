

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_layout/routes/route.dart';

void main(){
   runApp(BuysforsureApp());
}


class BuysforsureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       initialRoute: "/index",
       routes: routes,
    );
  }
}