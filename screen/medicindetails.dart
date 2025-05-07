import 'package:flutter/material.dart';
import 'package:pharmacy/favourite_cart.dart';

import 'package:pharmacy/model/medicinemodel.dart';
import 'package:pharmacy/screen/homepage2.dart';
import 'package:pharmacy/widget/cart.dart';


import 'package:provider/provider.dart';




class medicindetails extends StatefulWidget {


 medicinemodel Medicinmodel ;



  @override
  State<medicindetails> createState() => _medicindetailsState();

 medicindetails({required this.Medicinmodel});
}

class _medicindetailsState extends State<medicindetails> {
  final gredienttext =
      LinearGradient(colors: [Color(0xff2ea3e5), Color(0xff5ad1a6)]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(

            appBar: PreferredSize(
              preferredSize: Size.fromHeight(65),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 8,
                          spreadRadius: 1.0)
                    ],
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Color(0xff2ea3e5), Color(0xff5ad1a6)])),
                child: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  centerTitle:  true,
                  title: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24.0 , left: 80),
                      child: Text(
                        widget.Medicinmodel!.sentficname,
                        style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).colorScheme.surface,
                        ),
                      ),
                    ),
                  ),
                  actions: [
                    Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                        ))
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 300.0),
              child: Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [

                    Positioned(
                      bottom: 450,
                      right: 55,
                      child: Image.asset(
                        getimage()!,
                        height: 300,
                        width: 300,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(


                          boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.2),
                            blurRadius: 40,
                            spreadRadius: 300,
                            offset: Offset(100, 100))
                      ]),

                      child: Card(

                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(

                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20.0, top: 16),
                                child: Consumer<favouritecart>(
                                    builder: (context, favouritecart, child) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.Medicinmodel.sentficname!,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),

                                      IconButton(
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return homepage2();
                                            }));
                                          },
                                          icon: Icon(
                                            Icons.add_shopping_cart_outlined,
                                            color: Colors.blue,
                                          ))
                                    ],
                                  );
                                  ;
                                }),
                              ),

                              Row(
                                children: [
                                  Text(
                                    'COMBANY  :',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      widget.Medicinmodel.combany,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                color: Colors.black,
                                indent: 10,
                                endIndent: 50,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12.0, left: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      'TYBE  :',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Text(
                                      '   TABLET',
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                                indent: 10,
                                endIndent: 50,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12.0, left: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      'COUNT  :',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Text(
                                      widget.Medicinmodel.amount.toString(),
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                                indent: 10,
                                endIndent: 50,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 12.0, left: 20),
                                child: Row(
                                  children: [
                                    Text(
                                      'PRICE  :',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Text(
                                      '  ${widget.Medicinmodel.price} S.P',
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.black,
                                indent: 10,
                                endIndent: 50,
                              ),

                              Divider(
                                color: Colors.grey,
                                indent: 10,
                                endIndent: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0),
                                child: Consumer<cart>(
                                  builder: (context, cart, child) {
                                    return GestureDetector(
                                      onTap: () {
                                        cart.add(widget.Medicinmodel);
                                      },
                                      child: Container(
                                          width: 150,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)),
                                              gradient: LinearGradient(
                                                  begin: Alignment.bottomLeft,
                                                  end: Alignment.topRight,
                                                  colors: [
                                                    Color(0xff2ea3e5),
                                                    Color(0xff5ad1a6)
                                                  ])),
                                          child: Center(
                                              child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('buy'),
                                          ))),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }

  String ? getimage (){
    if(widget.Medicinmodel.id == 1){
      return 'lib/widget/newimage/Medicine box 1.png';


    }



    else if(widget.Medicinmodel.id == 2 ){
      return 'lib/widget/newimage/Medicine box 2.png' ;
    }
    else if(widget.Medicinmodel.id == 3 ){
      return 'lib/widget/newimage/Medicine box 3.png' ;
    }
    else if(widget.Medicinmodel.id == 4 ){
      return 'lib/widget/newimage/Medicine box 4.png' ;
    }
    else if(widget.Medicinmodel.id == 5 ){
      return 'lib/widget/newimage/Medicine box 5.png' ;
    }
    else if(widget.Medicinmodel.id == 6 ){
      return 'lib/widget/newimage/Medicine box 6.png' ;
    }
    else if(widget.Medicinmodel.id == 7 ){
      return 'lib/widget/newimage/Medicine box 7.png' ;
    }
    else if(widget.Medicinmodel.id == 8 ){
      return 'lib/widget/newimage/Medicine box 8.png' ;
    }
    else if(widget.Medicinmodel.id == 9 ){
      return 'lib/widget/newimage/Medicine box 9.png' ;
    }
    else if(widget.Medicinmodel.id == 10 ){
      return 'lib/widget/newimage/Medicine box 10.png' ;
    }
    else if(widget.Medicinmodel.id== 11 ){
      return 'lib/widget/newimage/Medicine box 11.png' ;
    }
    else if(widget.Medicinmodel.id == 12 ){
      return 'lib/widget/newimage/Medicine box 12.png' ;
    }
    else if(widget.Medicinmodel.id == 13 ){
      return 'lib/widget/newimage/Medicine box 13.png' ;
    }
    else if(widget.Medicinmodel.id == 14 ){
      return 'lib/widget/newimage/Medicine box 14.png' ;
    }
    else {
      return  'lib/widget/newimage/Medicine box 14.png' ;
    }


  }
}
