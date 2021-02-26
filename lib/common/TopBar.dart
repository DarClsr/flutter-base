


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatefulWidget implements PreferredSizeWidget {
  String title;
  TopBar({Key key,this.title="default page"});
  @override
  State<StatefulWidget> createState() => _TopBarState();
  Size get preferredSize   {
    return new Size.fromHeight(50.0);
  }
}

class _TopBarState extends State<TopBar>  {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
       title: Text(widget.title),
       elevation: 0,
       actions: [
          IconButton(icon: Icon(Icons.share_outlined), onPressed: ()=>{})
       ],
    );
  }
}
