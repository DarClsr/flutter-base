

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_layout/common/TopBar.dart';
import 'package:fluuter_layout/widget/animation/widget/animation-align.dart';
import 'package:fluuter_layout/widget/animation/widget/animation-tween.dart';
import 'package:fluuter_layout/widget/animation/widget/animatior-opacity.dart';

class AnimationCourse extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
       appBar: TopBar(title:"animation course"),
       body: ListView(
         children: [
             OpacityCard(),
             AlignCard(),
           TweenCard()
         ],
       ),
     );
  }
}