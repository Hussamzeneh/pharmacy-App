import 'package:flutter/material.dart';


import 'hoveranimated.dart';

class newsign extends StatefulWidget {


  @override
  State<newsign> createState() => _newsignState();
}



class _newsignState extends State<newsign> {
  @override
  bool ishover = false;
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,


      body: Center(
          child:Animatedhover(child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Animatedhover(
                  size: Size(170 , 50),
                  hovercolor: Colors.white,
                  bgcolor: Colors.white,
                  border: Border.all(),
                  offset: Offset(-9,-9),

                  child: Center(
                    child: Text('Get Started' ,style: TextStyle(
                        fontSize: 30 ,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              )
              , SizedBox(
                width: 360,

                child: Form(child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Animatedhover(
                        size: Size(360 , 56),
                        hovercolor: Colors.white,
                        bgcolor: Colors.white,
                        border: Border.all(),
                        offset: Offset(-9,9),

                        child: TextFormField(
                          decoration: InputDecoration(

                            hoverColor: Colors.white,
                            hintText:  'Full name ',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                            fillColor: Colors.white
                            ,filled: true ,
                            border: InputBorder.none
                            ,enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12)
                          ) ,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12)
                            ) ,



                          ),

                          // )


                        ),
                      ),
                    ) ,   Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Animatedhover(
                        size: Size(360 , 56),
                        hovercolor: Colors.white,
                        bgcolor: Colors.white,
                        border: Border.all(),
                        offset: Offset(-9,-9),

                        child: TextFormField(
                          decoration: InputDecoration(

                            hoverColor: Colors.red,
                            hintText:  'Email addres ',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                            fillColor: Colors.white
                            ,filled: true ,
                            border: InputBorder.none
                            ,enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12)
                          ) ,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12)
                            ) ,


                          ),

                          // )


                        ),
                      ),
                    ) ,   Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Animatedhover(
                        size: Size(360 , 56),
                        hovercolor: Colors.white,
                        bgcolor: Colors.white,
                        border: Border.all(),
                        offset: Offset(-9,9),

                        child: TextFormField(
                          decoration: InputDecoration(


                            hoverColor: Colors.white,
                            hintText:  'Password ',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                            fillColor: Colors.white
                            ,filled: true ,
                            border: InputBorder.none
                            ,enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12)
                          ) ,
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(12)
                            ) ,



                          ),

                          // )


                        ),
                      ),
                    ) ,
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0 , left: 300),
                      child: Animatedhover(
                          size: Size(50 , 50),
                          hovercolor: Colors.white,
                          bgcolor: Colors.white,
                          border: Border.all(),
                          offset: Offset(-9,-9),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(12))
                            ),


                            child:  Center(
                                child: Text('Sign' , style: TextStyle(
                                  fontWeight: FontWeight.bold

                                ),)),
                          )),
                    )],
                )),
              )

            ],),)
      ),


    );
  }
}
