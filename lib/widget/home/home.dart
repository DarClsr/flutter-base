

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluuter_layout/common/BottomNavWidget.dart';
import 'package:fluuter_layout/product/product-card.dart';
import 'package:fluuter_layout/product/product-grid.dart';
import 'package:fluuter_layout/styles/custom-text-style.dart';
import 'package:fluuter_layout/widget/category/category-grid.dart';
import 'package:fluuter_layout/widget/home/home-scroll.dart';
import 'package:fluuter_layout/widget/home/home-title.dart';
import 'package:fluuter_layout/widget/home/user-item.dart';

class Homepage extends StatelessWidget {
  getUserList(){
    List<Widget> users=new List();
    for(int i=0;i<10;i++){
      users.add(
        UserItem()
      );
    }

    return users.toList();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xffEBEBEB),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("home"),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
        //  homepage 页面
          Container(
            height: 150,
            child: HomeScroll(),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 250,
            child:  Card(
              elevation: 10,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                )
              ), clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  Container(
                    child:Text("Popular Buyer",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    color: Colors.pinkAccent,
                    width: double.infinity,
                  ),
                  Expanded(
                    flex: 1,
                    child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: getUserList()
                    ),
                  )
                ],
              )
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            padding: EdgeInsets.all(10),
            child: Card(
              elevation: 10,
              child: Column(
                children: [
                   HomeTilte(title:"Top Ranking", subTitle:"View More"),
                   Container(
                     height: 150,
                     child:  Swiper(
                       itemCount: 3,
                       itemBuilder:(BuildContext context,int index){
                         return Container(
                           height: 150,
                           child: Text("$index"),
                           color: Colors.red,
                         );
                       },
                       pagination: new SwiperPagination(alignment: Alignment.bottomCenter,

                       ),
                     ),
                   )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              shrinkWrap: true,
              children: [
                HomeTilte(title:"Featured Categories"),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child:  CategoryGrid(),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                HomeTilte(title:"Shops"),
                Row(
                  children: [],

                )
              ],
            ),
          ),
           Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  HomeTilte(title:"More To Love"),
                  Container(
                    child:ProductGrid(),
                  ),
                ],
              ),
          )
        ],
      ),
    );
  }
}

