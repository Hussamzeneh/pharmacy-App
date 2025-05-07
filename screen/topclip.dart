import 'package:flutter/material.dart';

class topclip extends StatelessWidget {


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
                height: screensize.height * .2,
                width: screensize.width,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                    color: Color(0xffFF08083A)),
              ), // second layer form top (white)
              Container(
                  height: screensize.height * .8,
                  width: screensize.width,
                  decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.only(topRight: Radius.circular(90)),
                      color: Colors.white))// second layer form top (blue)
            ],
          )
        ],
      ),
    );
  }
}
