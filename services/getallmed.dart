


import 'dart:convert';



import 'package:http/http.dart' as http;
import 'package:pharmacy/services/newregister.dart';

import '../model/medicinemodel.dart';
import 'new_login.dart';

class getallmed {
  medicinemodel ?Medicinmodel;
  
  
 Future < List <medicinemodel> > getallproduct()async {
    
    http.Response response = await http.get(Uri.parse('http://10.0.2.2:8000/api/index') , headers: {




      'Authorization':
    'Bearer ${token}'

    });


    Map<String , dynamic> data = jsonDecode(response.body);


    List<medicinemodel> productlists = [];


      data["medicines"].forEach((element)=> productlists.add(medicinemodel.fromJson(element)));
      data["medicines"].forEach((element)=> Medicinmodel = medicinemodel.fromJson(element));





    print(productlists[0].id);

    return productlists ;
    
    





 }
  
}