

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/custom_widget/new_medicin_card.dart';
import 'package:pharmacy/model/medicinemodel.dart';
import 'package:pharmacy/screen/medicindetails.dart';

import 'package:pharmacy/services/getallmed.dart';




class anasgallery extends StatelessWidget {



  Widget build(BuildContext context) {
    final gredienttext = LinearGradient(

        colors: [
          Color(0xff2ea3e5) ,
          Color(0xff5ad1a6)
        ]);



    return MaterialApp(
        debugShowCheckedModeBanner: false ,
        home : Scaffold(
appBar:  PreferredSize(
  
  preferredSize: Size.fromHeight(50),
  child:   AppBar(

    elevation:  10,
    backgroundColor:  Colors.white,
    title: ShaderMask(
        shaderCallback:(bounds){
          return gredienttext.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
        },
        child: Text('G A L L E R Y')),
    centerTitle:  true ,
  ),
),

      body :
       Padding(
         padding: const EdgeInsets.only(top: 50.0),
         child: Container(


         child: FutureBuilder<List<medicinemodel>> (
            future: getallmed().getallproduct() ,
             builder: (context , snapshot){

List<medicinemodel>?  productlist = snapshot.data ;



                if(snapshot.hasData!){
               return GridView.builder(
                   itemCount: productlist?.length,
                   clipBehavior: Clip.none,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                       mainAxisSpacing: 20,
                       crossAxisCount: 2,
                       childAspectRatio: 1.8),
                   itemBuilder: (context, index) {
                  return Container(child:  GestureDetector(
                      onTap:  (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return medicindetails(Medicinmodel:  productlist![index],);
                        }));
                      },
                      child: MedCard(Medicinmodel:productlist?[index] )),);
                   });}
                else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.greenAccent
                      ,
                    ),
                  );

                }

             }


           )
         ),
       ),


    ));
  }
}
