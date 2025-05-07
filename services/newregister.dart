

import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacy/screen/homepage2.dart';

import '../screen/login.dart';
String ? token1 ;
class newregister{

  
   registermethod({required String pharmacyname,phone,password , confirmpassword  , context})async {
    http.Response response = await http.post(Uri.parse('http://10.0.2.2:8000/api/registerP') , body: {

      'Pharmacy_name': pharmacyname ,
      'phone': phone ,
      'password': password ,
      'confirm_password':confirmpassword

    } );
    if (response.statusCode == 200){
      print(token1);
      Map<String , dynamic> data = jsonDecode(response.body);
      List<dynamic> list = [];
       token1=data['user']['token'];
       print(token1);
       if(data['message'] == 'register successfully'){
         Navigator.push(context, MaterialPageRoute(builder: (context){
           return login();
         }));

       }else{
         Navigator.push(context , MaterialPageRoute(builder: (context){
           return homepage2();
         }));

       }



    }
    else {
      throw Exception('eroor is in ${response.statusCode}');
    }

    
  }
  
  
}