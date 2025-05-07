import 'package:flutter/material.dart';

class Animatedhover extends StatefulWidget {
  const Animatedhover({


    this.size =  const Size(440, 440),
    required this.child,
    this.bgcolor = Colors.white,
    this.border = const Border(),
    this.curve = Curves.easeOutBack,
    this.hovercolor = Colors.yellow,
    this.offset = const Offset(-12 , 12) ,
    this.duration = const Duration(milliseconds: 200) ,




  }
      );
  final Duration duration ;

  final Widget  child;
  final Size   size ;
  final Color  hovercolor , bgcolor;
  final Offset  offset;
  final Curve  curve ;
  final Border  border ;

  @override
  State<Animatedhover> createState() => _hoveranimatedState();
}

class _hoveranimatedState extends State<Animatedhover> {


  bool ishover = false ;
  Widget build(BuildContext context) {
    return Stack(

      clipBehavior: Clip.none,

      children: [
        Container(height: widget.size.height , width: widget.size.width ,

          decoration: BoxDecoration(




             color:  Colors.black
              ,
              borderRadius: BorderRadius.all(Radius.circular(12))

          ),) ,
        AnimatedPositioned(
          curve: widget.curve,
          duration: widget.duration,
          top:ishover ?  widget.offset.dx  : 0,
          right: ishover ?  widget.offset.dy  : 0,
          child : InkWell(
            onTap: (){
            }
            ,
            onHover: (hover){
              setState(() {
                ishover= hover;
              });
            },
            borderRadius: BorderRadius.all(Radius.circular(12)),

            overlayColor:  MaterialStateProperty.all(Colors.transparent),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              height: widget.size.height , width: widget.size.width,
              decoration: BoxDecoration(
                  color: ishover ? widget.hovercolor : widget.bgcolor
                  , borderRadius: BorderRadius.all(Radius.circular(12))
                  ,border: widget.border

              ),

              child: widget.child,
            ),
          ),
        )

      ],

    );
  }
}
