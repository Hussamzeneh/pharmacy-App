import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pharmacy/main.dart';
import 'package:pharmacy/providerlang/language.dart';
import 'package:pharmacy/theme/darktheme.dart';
import 'package:pharmacy/theme/lighttheme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/themeprovider.dart';

import 'homepage.dart';

class Seeting extends StatefulWidget {
  @override
  State<Seeting> createState() => _SeetingState();
}

class _SeetingState extends State<Seeting> {

  Language _language = Language();
  List<String> _languages = ['AR' , 'EN' ];
  String? _Selectedlanguages;
  @override
  void initState() {

    super.initState();
    getSelectedPref();
    setState(() => _language.getLanguage());
  }
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(65),
            child: Container(decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
              color: Colors.black45,
              offset: Offset(2.0, 2.0),
              blurRadius: 8,
              spreadRadius: 1.0)
            ] ,

            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [Color(0xff2ea3e5), Color(0xff5ad1a6)])),
              child: AppBar(

                elevation: 0,
                backgroundColor: Colors.transparent,



                title: Center(
                  child: Text(
                    _language.tSettings()! ,textDirection: _language.getLanguage()=='AR'?TextDirection.rtl:TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 30,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: IconButton( onPressed: (){
                      Navigator.pop(context);
                    } ,icon: Icon(Icons.arrow_back),)
                  )
                ],
              ),
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40.0 , right: 40 , top: 16),
                  child: Container(
                    decoration: BoxDecoration(    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Theme.of(context).colorScheme.tertiaryContainer,
                          Theme.of(context).colorScheme.onTertiaryContainer,
                        ]), boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 8,
                          spreadRadius: 1.0)
                    ],  color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(30))),

                    child: ListTile(




                      title: Text(_language.tdarkmode()! ,textDirection: _language.getLanguage()=='AR'?TextDirection.rtl:TextDirection.ltr ,style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface
                      ),),
                      leading:_language.getLanguage()=='EN'? Icon(Icons.dark_mode_outlined , color: Colors.yellow,): Switch(
                          activeColor: Colors.blue,
                          value: switchvalue,
                          onChanged: (newValue) {
                            switchvalue = newValue;
                            Provider.of<themeproviedr>(context, listen: false)
                                .toggleTheme();
                          }) ,
                      trailing: _language.getLanguage()=='EN'? Switch(
                          activeColor: Colors.blue,
                          value: switchvalue,
                          onChanged: (newValue) {
                            switchvalue = newValue;
                            Provider.of<themeproviedr>(context, listen: false)
                                .toggleTheme();
                          }):Icon(Icons.dark_mode_outlined , color: Colors.yellow  )


                    ),
                  ),
                ) ,
                Padding(
                  padding: const EdgeInsets.only(left: 40.0 , right: 40 , top: 16),
                  child: Container(
                    decoration: BoxDecoration(    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Theme.of(context).colorScheme.tertiaryContainer,
                          Theme.of(context).colorScheme.onTertiaryContainer,
                        ]) ,  boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 8,
                          spreadRadius: 1.0)
                    ], color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(30))),

                    child: ListTile(




                        title: Text(_language.tlanguges()!  ,textDirection: _language.getLanguage()=='AR'?TextDirection.rtl:TextDirection.ltr ,style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface
                        ),),
                        leading: _language.getLanguage()=='EN'? Icon(Icons.translate , color: Colors.black,): DropdownButton(
                          menuMaxHeight: 100,
                          borderRadius: BorderRadius.all(Radius.circular(20)),

                          dropdownColor: Colors.white,
                          hint: Text('Languages' , style: TextStyle(color: Colors.grey , fontSize: 10),),
                          value: _Selectedlanguages,
                          onChanged: (newvalue) async {
                            SharedPreferences pref = await SharedPreferences.getInstance();

                            pref.setString('language', newvalue! );
                            _language.setLanguage(newvalue);
                            language = newvalue ;


                            setState(() {
                              _Selectedlanguages = newvalue;
                            });
                          },
                          items: _languages.map((lang) {
                            return DropdownMenuItem(child: new Text(lang) , value:lang,);
                          }).toList(),
                        ),
                        trailing:_language.getLanguage()=='EN'? DropdownButton(
                          menuMaxHeight: 100,
                          borderRadius: BorderRadius.all(Radius.circular(20)),

                          dropdownColor: Colors.white,
                          hint: Text('Languages' , style: TextStyle(color: Colors.grey , fontSize: 10),),
                          value: _Selectedlanguages,
                          onChanged: (newvalue) async {
                            SharedPreferences pref = await SharedPreferences.getInstance();

                            pref.setString('language', newvalue! );
                            _language.setLanguage(newvalue);
                            language = newvalue ;


                            setState(() {
                              _Selectedlanguages = newvalue;
                            });
                          },
                          items: _languages.map((lang) {
                            return DropdownMenuItem(child: new Text(lang) , value:lang,);
                          }).toList(),
                        ):Icon(Icons.translate , color: Colors.black,)


                    ),
                  ),
                )
              ],),
            )
          ),
        ));
  }
  getSelectedPref()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _Selectedlanguages=pref.getString('language');
    });

  }
}
