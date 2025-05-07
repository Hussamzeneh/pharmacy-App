
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy/Costom%20Widget/snackpar.dart';

import 'package:pharmacy/Costom%20Widget/textfiled1.dart';





import '../providerlang/language.dart';
import '../services/new_login.dart';

class login extends StatefulWidget {



  @override
  State<login> createState() => _loginState();

}

class _loginState extends State<login> {

  Language _language = Language();
  String? phonenumber;
  String? password;


  GlobalKey<ScaffoldState> scafoldkey = new GlobalKey<ScaffoldState>();
  Widget build(BuildContext context) {
    double screenhight = MediaQuery.of(context).size.height;
    double screenwidht = MediaQuery.of(context).size.width;
    return  Scaffold(
          key: scafoldkey,

            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topRight,
                      colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary
                  ])),
              child: Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Column(

                  children: [

                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Center(
                            child: Text(
                              _language.tlogin()!,
                              textDirection: _language.getLanguage() == 'EN'
                                  ? TextDirection.ltr
                                  : TextDirection.rtl,
                              style: TextStyle(
                                  fontSize: 33,
                                  fontFamily: 'YesevaOne',
                                  color: Theme.of(context).colorScheme.surface),
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Divider(
                        thickness: .6,
                        color: Theme.of(context).colorScheme.surface,
                        height: 2,
                        endIndent: 50,
                        indent: 50,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50.0, right: 50, top: 20),
                      child: Directionality(
                        textDirection: _language.getLanguage() == 'AR'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Theme.of(context).colorScheme.tertiary,
                                    Theme.of(context).colorScheme.onTertiary,
                                  ]),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 5,
                                    spreadRadius: 1.0)
                              ]),
                          child: customtextfiled(
                            hinttext:  _language.tPhonenumber(),
                            onCganged: (value){
setState(() {
  phonenumber = value;
});

                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50.0, right: 50, top: 20),
                      child: Directionality(
                        textDirection: _language.getLanguage() == 'AR'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [
                                    Theme.of(context).colorScheme.tertiary,
                                    Theme.of(context).colorScheme.onTertiary,
                                  ]),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 5,
                                    spreadRadius: 1.0)
                              ]),
                          child: customtextfiled(
                            hinttext:  _language.tPassword(),
                           onCganged: (value){

                           setState(() {
                             password = value;
                           });
                           },
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Container(
                          width: 150,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.all(
                                  _language.getLanguage() == 'AR' ? 0 : 8),
                              child: Text(
                                _language.tconfirm()!,
                                textDirection: _language.getLanguage() == 'EN'
                                    ? TextDirection.ltr
                                    : TextDirection.rtl,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'YesevaOne',
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondaryContainer
                                      .withOpacity(.8),
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
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
                                    color: Colors.black26,
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 5,
                                    spreadRadius: 1.0)
                              ],
                              color: Theme.of(context).colorScheme.background,
                             ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }


}



