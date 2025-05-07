import 'package:flutter/material.dart';

class aboutapp extends StatelessWidget {
  const aboutapp({super.key});

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Container(
                  height: screensize.height,
                  width: screensize.width * .5,
                  color: Colors.white),
              Container(
                height: screensize.height,
                width: screensize.width * .5,
                color: Color(0xffFF08083A),
              )
            ],
          ), // backgrond
          Column(
            children: [
              Container(
                height: screensize.height * .5,
                width: screensize.width,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(150)),
                    color: Colors.white),
              ), // second layer form top (white)
              Container(
                  height: screensize.height * .5,
                  width: screensize.width,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(150)),
                      color: Color(0xffFF08083A)))// second layer form top (blue)
            ],
          )
        ],
      ),
    );
  }
}
