

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:provider/provider.dart';

import '../theme/themeprovider.dart';
import 'fluttermoje.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    bool switchvalue = false;
    return Scaffold(

      body: Stack(children: [ Row(
        children: [
          Container(
              height: screensize.height,
              width: screensize.width * .5,
              color: Theme.of(context).colorScheme.onPrimary) ,

          Container(
            height: screensize.height,
            width: screensize.width * .5,
            color: Colors.pink,
          )
        ],
      ), Column(
        children: [
          Container(
            height: screensize.height * .3,
            width: screensize.width,
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.only(bottomLeft: Radius.circular(30)),
                color: Colors.pink),
            child:Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 40.0),

              ), Padding(
                padding: const EdgeInsets.only( left: 20,top: 80.0),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 82,
                      backgroundColor: Colors.white,
                      child: FluttermojiCircleAvatar(
                        backgroundColor: Color(0xffFF08083A),
                        radius: 80,
                      ),
                    ),
                    Positioned(
                        top: 130,
                        left: 120,


                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return NewPage();

                            }));

                          },

                          child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 15,
                              child: Icon(Icons.edit)),
                        ))

                  ],
                ),
              )




            ],) ,




          ), Padding(
            padding: const EdgeInsets.only(left: 24.0 , right: 52),
            child: Container(

              height: screensize.height * .15,
              width: screensize.width ,
              decoration:  BoxDecoration(
gradient: LinearGradient(
  transform: GradientRotation(- pi / 2.47),
    stops: [0.5  , 0.5],
    //begin: Alignment.bottomLeft , end:Alignment.topRight ,

    colors: [
    Theme.of(context).colorScheme.onPrimary , Colors.pink]
),

                    ),
          ) ),
           // second layer form top (white)
          Container(

              height: screensize.height * .55,
              width: screensize.width - 35,
              decoration:  BoxDecoration(

                  borderRadius:
                  BorderRadius.only(topRight: Radius.circular(44)),
                  color: Theme.of(context).colorScheme.onPrimary)  , child: ListView(
            itemExtent: 100,

            children: [
              profileinfo( first: 'USER NAME', second: Text('ANAS ASFAHANI') ,) ,
              profileinfo(first: 'CODE', second: Text('322345434')) ,
              Padding(
                padding: const EdgeInsets.only(left: 38.0),
                child: profileinfo(first: 'EMAIL', second: Text('anasasfahani@gmail.com')),
              ) ,
              profileinfo(first: 'PASSWORD', second: Text('************')) ,
              profileinfo(first: 'AGE', second: Text('21 YEARS')) ,
              profileinfo(first: 'GENDRE', second: Text('MALE')) ,
              profileinfo(first: 'DARK MODE', second: Switch(
                  activeColor: Color(0xffFF28C34C),
                  value: switchvalue,
                  onChanged: (newValue) {
                    switchvalue = newValue;
                    Provider.of<themeproviedr>(context, listen: false)
                        .toggleTheme();
                  }),) ,






          ],),



          )// second layer form top (blue)
        ],
      )],


      ),


    );
  }
}

class profileinfo extends StatelessWidget {
   profileinfo({
  required  this.first ,
    required this.second
    ,
  });
String ? first ;
Widget? second ;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
      children: [
        Text(first!  , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold),),second!
      ],
    );
  }
}
