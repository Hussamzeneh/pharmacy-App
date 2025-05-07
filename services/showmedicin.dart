
import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:pharmacy/model/Showmedicin.dart';
import 'package:pharmacy/services/newregister.dart';

class showmedicinmethod{
  showmedicin ?Showmedicin ;
String ?  x;

Future<List<showmedicin>> showmedicinMethod() async{
  
  http.Response response = await http.get(Uri.parse('http://10.0.2.2:8000/api/medicine/show/heart') , headers:
  {


    'Authorization':
    'Bearer ${token1}'

  }

  );
  print(response.statusCode);
  Map<String , dynamic> data = jsonDecode(response.body);
  List <showmedicin> listofshow = [];
print(data);
    data['data'][0]['med'].forEach((element)=> listofshow.add(showmedicin.fromJson(element)));
  data['data'][0]['med'].forEach((element)=> Showmedicin = showmedicin.fromJson(element));
  print(token1.toString());
  print(response.statusCode);
  print(response.body);






  return listofshow;


  
  
}



}