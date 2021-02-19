
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluuter_layout/model/product.model.dart';
import 'package:fluuter_layout/product/product-card.dart';

class ProductGrid extends StatelessWidget{
  List<Product> productList=ProductList;
  getList(BuildContext context,int index){
     return Container(
       color:Colors.red,
       child: new Center(
         child: CircleAvatar(
           backgroundColor: Colors.redAccent,
           child: Text("$index child"),
         ),
       ),
     );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child:  StaggeredGridView.countBuilder(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 4,
          mainAxisSpacing: 10,
          itemCount: productList.length,
          itemBuilder:(BuildContext context,int index){
            Product product=productList[index];
            print(product.cover);
            return Container(
              color: Colors.redAccent,
              child:  Container(
                height: double.infinity,
                child: Hero(
                  tag: index,
                  child: Image.network(product.cover,fit: BoxFit.cover),
                ),
              )
            );
          },
          staggeredTileBuilder:(int index)=>new StaggeredTile.count(1, index.isEven?2:1)
      ),
    );
  }
}