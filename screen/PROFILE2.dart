import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:pharmacy/screen/profile.dart';
import 'package:provider/provider.dart';

import '../theme/themeprovider.dart';
import 'fluttermoje.dart';
import 'homepage.dart';

class profile2 extends StatelessWidget {
  const profile2({super.key});

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
Container(
    width: double.infinity,

    child: Image.asset('lib/widget/Images/profile-01ahamad.png' , fit: BoxFit.cover,  )) ,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(

              mainAxisSize: MainAxisSize.max,


              children: [
                personalavatar(),
                 Text('aaaaaaaaa') ,


              ],
            ),

          ],)



         ,Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(child: personalavatar()),

          ],
        ),


        Padding(
          padding:  EdgeInsets.only(top: screensize.height * .3 , right: 80),
          child: ListView(
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
        ),




      ],),


    );
  }
}

class personalavatar extends StatelessWidget {
  const personalavatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 40,
          top: 60 ,
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: FluttermojiCircleAvatar(
              backgroundColor: Color(0xffFF08083A),
              radius: 45,
            ),
          ),
        ),
        Positioned(
            top: 138,
            left: 110,


            child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return NewPage();

                }));

              },

              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 12,
                  child: Icon(Icons.edit , size: 16,)),
            ))

      ],
    );
  }
}
