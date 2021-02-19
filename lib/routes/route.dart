

import 'package:fluuter_layout/widget/category/category-grid.dart';
import 'package:fluuter_layout/widget/collect/collect.dart';
import 'package:fluuter_layout/widget/home/home.dart';
import 'package:fluuter_layout/widget/index.dart';
import 'package:fluuter_layout/widget/me/account.dart';

   var routes={
      "/index":(Context)=>IndexPage(),
      "/grid":(Context)=>CategoryGrid(),
   };

   List tabPage=[
      Homepage(),
      CollectPage(),
      Account()
   ];