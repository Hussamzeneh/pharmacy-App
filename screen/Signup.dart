import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:pharmacy/Costom%20Widget/textfiled1.dart';

import 'package:pharmacy/services/newregister.dart';

import '../providerlang/language.dart';

class Signup extends StatefulWidget {
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Language _language = Language();
  String? confirmpassword;
  String? Pharmacyname;
  String? Phonenumber;
  String? Password;



  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 4),
                      child: Row(
                        children: [
                          Lottie.asset('Lottie_animation/6LvQZ3mhyl.json',
                              height: 80, width: 80),
                          Text(
                            _language.tSignup()!,
                            style: TextStyle(
                                fontSize:
                                    _language.getLanguage() == 'AR' ? 25 : 33,
                                fontFamily: 'YesevaOne',
                                color: Theme.of(context).colorScheme.surface),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 10),
                      child: Divider(
                        thickness: 0.6,
                        color: Theme.of(context).colorScheme.surface,
                        height: 2,
                        endIndent: 50,
                        indent: 50,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50.0, right: 50, top: 50),
                      child: Directionality(
                        textDirection: _language.getLanguage() == 'AR'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        child: customtextfiled(
                          icon: Icon(Icons.person),
                          hinttext: _language.tPharmacyName(),
                          onCganged: (value) {
                            Pharmacyname = value;
                          },
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
                        child: customtextfiled(
                            icon: Icon(Icons.phone),
                            hinttext: _language.tPhonenumber(),
                            onCganged: (val) {
                              Phonenumber = val;
                            }),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50.0, right: 50, top: 20),
                      child: Directionality(
                        textDirection: _language.getLanguage() == 'AR'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        child: customtextfiled(
                          icon: Icon(Icons.lock),
                          hinttext: _language.tPassword(),
                          onCganged: (vall) {
                            Password = vall;
                          },
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
                        child: customtextfiled(
                          hinttext: _language.tRewritePassword(),
                          onCganged: (value) {
                            confirmpassword = value;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                          _language.getLanguage() == 'AR' ? 10 : 30),
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('please enter phone and password') , duration: Duration(seconds: 50),behavior: SnackBarBehavior.floating,) );

                          newregister().registermethod(
                              pharmacyname: Pharmacyname!,
                              password: Password,
                              phone: Phonenumber,
                              confirmpassword: confirmpassword,
                              context: context);
                        },
                        child: Container(
                            width: 150,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  _language.tconfirm()!,
                                  style: TextStyle(
                                    fontFamily: 'YesevaOne',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondaryContainer,
                                    fontSize: _language.getLanguage() == 'AR'
                                        ? 15
                                        : 25,
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
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    )
                  ]),
            )));
  }
}
