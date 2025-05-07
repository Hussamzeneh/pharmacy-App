import 'package:flutter/material.dart';

class animatedsign extends StatefulWidget {


  @override
  State<animatedsign> createState() => _animatedsignState();
}
bool _ishover = false;
class _animatedsignState extends State<animatedsign> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          InkWell(
            onTap: (){
            }
            ,
            onHover: (hover){
              setState(() {
                 _ishover= hover;
              });
            },
            child: Container(
              height: 440 , width: 440,
              decoration: BoxDecoration(
                color: _ishover ? Colors.purple : Colors.white
                    , borderRadius: BorderRadius.all(Radius.circular(12))

              ),
            ),
          )

        ],

      ),


    );
  }
}
