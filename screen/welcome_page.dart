import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/Costom%20Widget/Gesterdetector.dart';
import 'package:pharmacy/screen/Signup.dart';
import 'package:pharmacy/screen/homepage.dart';
import 'package:pharmacy/screen/login.dart';
import 'package:rive/rive.dart';


class Welcomepage extends StatefulWidget {
  State<Welcomepage> createState() => _WelcomepageState();
}

class _WelcomepageState extends State<Welcomepage> {
  late RiveAnimationController _buttonanimationcontroller;


  void initState() {
    _buttonanimationcontroller = OneShotAnimation("active", onStart: () {
      _buttonanimationcontroller.isActive = true;
    }, onStop: () {
      _buttonanimationcontroller.isActive = true;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double  screenwidth = MediaQuery.of(context).size.width;
    double screenhight = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                  bottom: 100,
                  left: 200,
                  child: Image.asset('Backgrounds/Spline.png')),
              Positioned.fill(
                  child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
                child: SizedBox(),
              )),
              RiveAnimation.asset(
                'RiveAssets/shapes.riv',
                alignment: Alignment(1, 1),
              ),
              Positioned.fill(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                    child: SizedBox(),
              )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: screenwidth/10, top: screenhight/10.65),
                    child: Text(
                      'WELCOME\nto \nEDUSPHERER',
                      style: TextStyle(
                          fontSize: 40,
                          height: 1.2,
                          fontFamily: 'YesevaOne',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top:  screenhight/10 ,left: screenwidth/10 , bottom: screenhight/10  ),
                    child: Text(
                      'This application makes learning everywhere , make your school more famous  Hurry now to enter the lms trading Network , build realationship with nearby school and make your dealings with warehouses faster and more effective   ',
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.2,
                        fontFamily: 'YesevaOne',
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 64,
                      width: 250,
                      child: Stack(
                        children: [
                          RiveAnimation.asset(
                            'RiveAssets/button.riv',
                            controllers: [_buttonanimationcontroller],
                          ),
                          Positioned.fill(
                            top: 8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(top:  screenhight/38.65),
                                  child: Icon(CupertinoIcons.arrow_right),
                                ),
                                Text(
                                  'Start the EDUSPHERE',
                                  style:
                                  TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
               ],
              )
            ],
          ),
        ),
      ),
    );
  }


}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.screenhight,
  });

  final double screenhight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding:  EdgeInsets.only(top:  screenhight/38.65),
          child: Icon(CupertinoIcons.arrow_right),
        ),
        Text(
          'Start with  Edusphere',
          style:
          TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
