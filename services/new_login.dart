import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacy/screen/anasgallery.dart';
import 'package:pharmacy/screen/homepage2.dart';

import 'package:pharmacy/screen/login.dart';

String ?token;

class LOGIN{

  Loginmethod({required String phone , password , context})async{

    http.Response response = await http.post(Uri.parse('http://10.0.2.2:8000/api/login') , body:  {
      'phone' : phone ,
      'password' : password

    } , headers:  {

      // 'Authorization' : "Bearer ${newregister().token}"

    });

    if (response.statusCode == 200){

      Map<String , dynamic> data = jsonDecode(response.body);
      List<dynamic> list = [];

      if(data['message'] == 'user login successfully'){
        token = data['data']['token'];


        Navigator.push(context, MaterialPageRoute(builder: (context){
          return homepage2();
        }));

      }else{
        Navigator.push(context , MaterialPageRoute(builder: (context){
          return login();
        }));

      }



    }
    else {
      throw Exception('eroor is in ${response.statusCode}');
    }


  }


}


