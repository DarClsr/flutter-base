

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_layout/common/BottomNavWidget.dart';

class Account extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>_AccountState();
}

 class _AccountState extends State<Account> {

   getCount(){
     List<Widget> chidren=new List();
     for(int i=0;i<16;i++){
       chidren.add(
           Container(
             color: Colors.red,
             child: Center(
               child: Text("iwan --- $i",style: TextStyle(
                 fontSize: 30,
                 color: Colors.white
               ),),
             )
           )
       );
     }

     return chidren.toList();
   }
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
         children: [
             Container(
                 padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                 child:Row(
                     children: [
                       Icon(Icons.menu,color: Colors.white),
                       Expanded(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                               Icon(Icons.notification_important_outlined,color:Colors.white,),
                               Container(
                                 margin: EdgeInsets.only(left: 20),
                                 decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54,
                                          offset: Offset(0.0,15.0),
                                        blurRadius: 30.0,
                                        spreadRadius: 1.0
                                      )
                                    ]
                                 ),

                                 child:  ClipOval(
                                   child:Image.asset("image/avatar.jpg",
                                     width: 80,
                                     height: 80,
                                     fit: BoxFit.cover,
                                   ),
                                 ),
                               )
                           ],
                         ),
                       )
                     ],
                 ) ,
             ),
             Expanded(
               child: ListView(
                 children: [
                   Container(
                     height: 50,
                   ),
                   Container(
                     width: double.infinity,
                     padding: EdgeInsets.all(20),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
                         color: Colors.white
                     ),
                     child: Wrap(
                       children: [
                           Center(
                             child: Container(
                               child: SizedBox(height: 10,width: 50),
                               color: Colors.black12,
                             ),
                           ),
                         SizedBox(height: 20),
                         Container(
                            child: GridView.count(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              crossAxisCount: 2,
                              crossAxisSpacing: 15,
                              mainAxisSpacing: 10,
                              children: getCount()
                           ),
                         )

                        ],
                     ),
                   )
                 ],
               ),
             )


           
         ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           Navigator.pushNamed(context, "/grid").then((value) => print(value));
        },
        backgroundColor: Color(0xff57cb5e),
        child: Icon(Icons.grade),
      ),
    );
  }
 }