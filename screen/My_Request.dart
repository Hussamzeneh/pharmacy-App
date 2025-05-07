import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:pharmacy/providerlang/language.dart';

import 'package:provider/provider.dart';

import '../theme/themeprovider.dart';
import '../widget/request_containar.dart';

class Myrequest extends StatefulWidget {
  @override
  State<Myrequest> createState() => _MyrequestState();
}

class _MyrequestState extends State<Myrequest> {


Language _language = Language();

  Widget build(BuildContext context) {
    return MaterialApp(


        debugShowCheckedModeBanner: false,
        home: Scaffold(


appBar: PreferredSize(
  preferredSize: Size.fromHeight(70),
  child:   Container(decoration: BoxDecoration(
    gradient: LinearGradient(colors: [ Color(0xff2ea3e5) ,
      Color(0xff5ad1a6)])


  ),
    child: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
centerTitle: true,
title: Text(_language.tRequest()!, style: TextStyle(
  color: Theme.of(context).colorScheme.background
),),

    ),
  ),
)

           ,body: Container(
          color: Theme.of(context).colorScheme.background,
          child: ListView(
            children: [
              requestcontainer(),
              requestcontainer(),
              requestcontainer(),
              requestcontainer(),
              requestcontainer(),
              requestcontainer(),
              requestcontainer(),
              requestcontainer(),
              requestcontainer(),
              requestcontainer(),
              requestcontainer()
            ],
          ),

    )));
  }
}
