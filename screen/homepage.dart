import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy/Costom%20Widget/Gesterdetector.dart';
import 'package:pharmacy/screen/Signup.dart';
import 'package:pharmacy/screen/login.dart';

import 'package:pharmacy/theme/themeprovider.dart';

import 'package:provider/provider.dart';



import '../providerlang/language.dart';

class homepage extends StatefulWidget {

  @override
  State<homepage> createState() => _homepageState();

}


Language _language = Language();
String? _Selectedlanguages;


bool switchvalue = false;


class _homepageState extends State<homepage>
   {






  
  Widget build(BuildContext context) {
    double screenhight = MediaQuery.sizeOf(context).height;
    double screenwidth = MediaQuery.sizeOf(context).width;
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: Provider.of<themeproviedr>(context).themeData,
      home: Scaffold( body :Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ])),
        child: Column(


            children: [

          Switch(
              activeColor: Color(0xffFF28C34C),
              value: switchvalue,
              onChanged: (newValue) {
                switchvalue = newValue;
                Provider.of<themeproviedr>(context, listen: false)
                    .toggleTheme();
              }),

          Padding(
            padding:  EdgeInsets.only(top:screenhight*(3.9/100)),
            child: Text(_language.tWelcome_to()! ,
                style: TextStyle(
                    fontSize:  _language.getLanguage()=='AR'?33:35,
                    color: Theme.of(context).colorScheme.surface,
                  //  fontFamily: 'YesevaOne',
                    inherit: false)),
          ),
          Text(_language.tPharmacy()!,
              style: TextStyle(
                  inherit: false,
                  fontSize: _language.getLanguage()=='AR'?33:35,
                  color: Theme.of(context).colorScheme.surface,
                 )),
          Padding(
            padding:  EdgeInsets.only(top: screenhight*(14.3/100)),
            child: GEST(
              page: login(),
              context1: context,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Theme.of(context).colorScheme.tertiary,
                        Theme.of(context).colorScheme.onTertiary,
                      ]),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          offset: Offset(4.0, 4.0),
                          blurRadius: 5,
                          spreadRadius: 1.0)
                    ],
                    borderRadius: BorderRadius.circular(30),
                   ),
                height: 50,
                width: 220,
                child: Center(
                  child: Text(
                    _language.tlogin()!,
                    style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        inherit: false,
                        fontFamily: 'YesevaOne'),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0 ),
              child: GEST(
                page: Signup(),
                context1: context,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [
                            Theme.of(context).colorScheme.tertiary,
                            Theme.of(context).colorScheme.onTertiary,
                          ]),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            offset: Offset(4.0, 4.0),
                            blurRadius: 5,
                            spreadRadius: 1.0)
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).colorScheme.background),
                  height: 50,
                  width: 220,
                  child: Center(
                    child: Text(
                      _language.tSignup()!,
                      style: TextStyle(
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.inversePrimary,
                          inherit: false,
                          fontFamily: 'YesevaOne'),
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    ));
  }


}
