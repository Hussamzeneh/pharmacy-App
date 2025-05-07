



import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:pharmacy/cubit/cubit.dart';
import 'package:pharmacy/screen/My_Request.dart';
import 'package:pharmacy/screen/Riveasset.dart';

import 'package:pharmacy/screen/anasgallery.dart';



import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../Costom Widget/spider_menu.dart';
import '../providerlang/language.dart';
import '../theme/themeprovider.dart';


class homepage2 extends StatefulWidget {
  @override
  State<homepage2> createState() => _homepage2State();
}

class _homepage2State extends State<homepage2> with SingleTickerProviderStateMixin {
  Language _language = Language();
  bool? Rebeat = false;

  List<String> _languages = ['AR' , 'EN' ];
  String? _Selectedlanguages;
   VoidCallback ? press ;
   ValueChanged<Artboard>? riveOnInit;
   late SMIBool ismenuclosed;
   bool issidemenuclosed= true ;
   late AnimationController _animationController;
   late Animation<double> animation ;
  late Animation<double> scalanimation ;

  @override
  void initState() {
_animationController =AnimationController(vsync: this , duration: Duration(milliseconds:  200) ,)..addListener(() {setState(() {

});});
    super.initState();
    getSelectedPref();
    setState(() => _language.getLanguage());

    animation = Tween<double>(begin: 0 , end: 1).animate(CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn));
scalanimation = Tween<double>(begin: 1 , end: 0.8).animate(CurvedAnimation(parent: _animationController, curve: Curves.fastOutSlowIn));
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  @override
  Widget build(BuildContext context) {

    List<Image> ARABICAVDS = [
      Image.asset('lib/widget/Images/AVDS1.png'),
      Image.asset('lib/widget/Images/AVDS2.png'),
      Image.asset('lib/widget/Images/AVDS3.png'),
      Image.asset('lib/widget/Images/44.png')
    ];

    List<Image> ENGLISHAVDS = [
      Image.asset('lib/widget/Images/11 - e.png'),
      Image.asset('lib/widget/Images/22 - e.png'),
      Image.asset('lib/widget/Images/33 - e.png'),
      Image.asset('lib/widget/Images/44 - e.png')
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<themeproviedr>(context).themeData,
      home: Scaffold(
        backgroundColor: Color(0xffFF08083A),
        extendBody:  true,

resizeToAvoidBottomInset: false,

        body: Stack(
          children: [



            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
                curve: Curves.fastOutSlowIn,
                width:  288,
                height: MediaQuery.of(context).size.height,
                left:  issidemenuclosed?- 288:0,

                child: spidermenu()),

            Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..setEntry(3, 2, 0.001)..rotateY(animation.value-30*animation.value*pi /180),
              child: Transform.translate(
                  offset: Offset(animation.value * 265 , 0),

                  child: Transform.scale(
                      scale: scalanimation.value,
                      child: ClipRRect(
                          borderRadius: issidemenuclosed?BorderRadius.zero:BorderRadius.all(Radius.circular(24)),
                          child: homepage2body(ARABICAVDS: ARABICAVDS, language: _language, ENGLISHAVDS: ENGLISHAVDS)))),
            ) ,

            AnimatedPositioned(
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds:  200),
              top: 20,
              left:  issidemenuclosed ?0:220,
              child: menubutton( riveOnInit: (artboard){
                StateMachineController controller = RiveUtils.getRivecontroller(artboard , StateMachineName: 'State Machine');
                ismenuclosed = controller.findSMI('isOpen')as SMIBool ;
                ismenuclosed.value = true;

              } , press:  (){
                ismenuclosed.value = !ismenuclosed.value;
                if(issidemenuclosed){
                  _animationController.forward();
                }else{
                  _animationController.reverse();
                }
                setState(() {
                  issidemenuclosed = ismenuclosed.value;
                });
              },),
            )
          ],
        ),
      ),
    );
  }

  getSelectedPref()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _Selectedlanguages=pref.getString('language');
    });

  }
}

class homepage2body extends StatelessWidget {
  const homepage2body({
    super.key,
    required this.ARABICAVDS,
    required Language language,
    required this.ENGLISHAVDS,
  }) : _language = language;

  final List<Image> ARABICAVDS;
  final Language _language;
  final List<Image> ENGLISHAVDS;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background
          ),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0 , right: 16),
            child: Container(
              clipBehavior: Clip.hardEdge,
              height: 200,
              width: 385,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 1500),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (index, reason) {},
                  scrollDirection: Axis.horizontal,
                ),
                itemCount: ARABICAVDS.length,
                itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) =>
                    Container(
                        child: _language.getLanguage() == 'AR'
                            ? ARABICAVDS[itemIndex]
                            : ENGLISHAVDS[itemIndex]),
              ),
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black45,
                        offset: Offset(2.0, 2.0),
                        blurRadius: 8,
                        spreadRadius: 1.0)
                  ],
                  borderRadius: BorderRadius.circular(50),
                 ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return Myrequest();
                  }));
                },
                child: Container(
                  child: Column(mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'lib/widget/Images/checklist (1).png',
                        height: 120,
                        width: 90,
                      ),
                      Text(
                        _language.tAllRequests()!,
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.error,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  height: 150,
                  width: 140,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 8,
                            spreadRadius: 1.0)
                      ],

                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xFFFFF45263)),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return homepage2();
                  }));
                },
                child: Container(
                  child: Column(
                    children: [
                      Image.asset(
                        'lib/widget/Images/koko.png',
                        height: 110,
                        width: 80,
                      ),
                      Text(
                        _language.tAddRequest()!,
                        style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.error,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'YesevaOne'),
                      )
                    ],
                  ),
                  height: 150,
                  width: 140,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 8,
                            spreadRadius: 1.0)
                      ],

                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xffDFFCFA)),
                ),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'lib/widget/Images/favourite_icom_new.png',
                      height: 90,
                      width: 50,
                    ),
                    Text(
                      _language.tFavourite()!,
                      style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.error,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'YesevaOne'),
                    )
                  ],
                ),
                height: 150,
                width: 140,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 8,
                          spreadRadius: 1.0)
                    ],

                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xffFEF2E2)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return anasgallery();
                  }));
                },
                child: Container(
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Image.asset(
                          'lib/widget/Images/ALLMEDICINE_NEW.png',
                          height: 100,
                          width: 80,
                        ),
                      ),
                      Center(
                        child: Text(
                          _language.tTotalProducts()!,
                          style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.error,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'YesevaOne'),
                        ),
                      )
                    ],
                  ),
                  height: 150,
                  width: 140,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            offset: Offset(2.0, 2.0),
                            blurRadius: 8,
                            spreadRadius: 1.0)
                      ],

                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xffE8E6E6)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class menubutton extends StatelessWidget {
  const menubutton({
    super.key,
    required this.press,
    required this.riveOnInit,
  });

  final VoidCallback? press;
  final ValueChanged<Artboard>? riveOnInit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press ,
        child: Container(
          margin: EdgeInsets.only(left: 16),
          width:  40, height: 40 ,

          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle ,
            boxShadow: [BoxShadow(
              color: Colors.black ,
              offset: Offset(0,3) ,
              blurRadius: 8

            )]



          ),
          child: RiveAnimation.asset('RiveAssets/menu_button.riv' ,
          onInit: riveOnInit
          ),
        ),
      ),
    );
  }
}
