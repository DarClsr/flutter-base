

import 'package:fluuter_layout/widget/FlowDart.dart';
import 'package:fluuter_layout/widget/InputCourse.dart';
import 'package:fluuter_layout/widget/animation/animation-course.dart';
import 'package:fluuter_layout/widget/category/category-grid.dart';
import 'package:fluuter_layout/widget/collect/collect.dart';
import 'package:fluuter_layout/widget/computer.dart';
import 'package:fluuter_layout/widget/factor.dart';
import 'package:fluuter_layout/widget/gestureCourse.dart';
import 'package:fluuter_layout/widget/home/home.dart';
import 'package:fluuter_layout/widget/index.dart';
import 'package:fluuter_layout/widget/me/account.dart';

   var routes={
      "/index":(Context)=>IndexPage(),
      "/grid":(Context)=>CategoryGrid(),
      "/animation":(Context)=>AnimationCourse(),
      "/input":(Context)=>InputCourse(),
      "/flow":(Context)=>FlowCourse(),
      "/factor":(Context)=>Factor(),
      "/gesture":(Context)=>GestureCourse(),
      "/computed":(Context)=>Computer(),
   };
   List tabPage=[
      {
         "name":"home",
         "page": Homepage(),
      },
      {
         "name":"collect",
         "page": CollectPage(),
      },
      {
         "name":"collect",
         "page":Account(),
      }
   ];