
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_layout/widget/category/category-item.dart';

class CategoryGrid extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CategoryGridState();
  }
}

class _CategoryGridState extends  State<CategoryGrid>{
  getList(){
    List<Widget> categories=new List();
    for(int i=0;i<8;i++){
      categories.add(CategoryItem());
    }
    return categories.toList();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return  GridView.count(
     shrinkWrap: true,
     crossAxisCount: 4,
     mainAxisSpacing: 5,
     crossAxisSpacing: 5,
     children: getList(),
   );
  }
}