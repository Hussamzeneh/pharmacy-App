import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttermoji/fluttermoji.dart';


class fluttermoji extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluttermoji Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // darkTheme: ThemeData.dark(),
      home: MyHomePage(title: 'PROFILE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
        centerTitle: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(
            height: 25,
          ),

          SizedBox(
            height: 25,
          ),
          Center(
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
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "anas asfahani",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 50,
          ),


        ],
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: CircleAvatar(
                  radius: 102,
                  backgroundColor: Colors.white,
                  child: FluttermojiCircleAvatar(
                    radius: 100,
                    backgroundColor: Color(0xffFF08083A),
                  ),
                ),
              ),
              SizedBox(
                width: min(600, _width * 0.85),
                child: Row(
                  children: [
                    Text(
                      "Customize:",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Spacer(),
                    FluttermojiSaveWidget(),
                  ],
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 30),
                child: FluttermojiCustomizer(
                  scaffoldWidth: min(600, _width * 0.85),
                  autosave: false,
                  theme: FluttermojiThemeData(
                    labelTextStyle: TextStyle(color: Colors.white),
                    secondaryBgColor: Colors.white,
                    primaryBgColor: Color(0xffFF08083A),
                      boxDecoration: BoxDecoration(boxShadow: [BoxShadow()])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}