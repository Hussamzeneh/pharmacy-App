
import 'dart:convert';

import 'package:http/http.dart' as http ;
import 'package:pharmacy/model/medicinemodel.dart';


class searchbyname {
  medicinemodel ?MidicinModel;

Future<List<medicinemodel>> Shearchbynamemethod ()async{

  http.Response response = await http.get(Uri.parse('http://10.0.2.2:8000/api/search/acitamino') , headers:
  {
    'Authorization':
    'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5YWZlYTJhZi1hNTk5LTQzYmEtYWM2OS01Nzk2YWU4OTRlNzEiLCJqdGkiOiJiYWZmYzc2ZTAyZDc5NGU1ZjdjMTNmMjMzMDM1MGMyMWFlNWNkYzliZDY2NmVmODZkZThmYzU0NmQ3ZTg4N2U1ZTg5N2NmMDg5NGIwYmM1MCIsImlhdCI6MTcwNDE5Njk4OC42OTU2NTEsIm5iZiI6MTcwNDE5Njk4OC42OTU2NTMsImV4cCI6MTczNTgxOTM4OC42ODk5ODcsInN1YiI6IjMiLCJzY29wZXMiOltdfQ.NZtfN4wWM9HcJ2MAs08rRmyB8WN6phFrucSaYu0FYVHe7WDIRql83G-y-BccQGQXYkL3r0XtPrMOf2IWS8XpUxWAm4R1Ti6h0PHN2rNiTfd3sOFYSV8Ysqv5-SIBRZh7ucQy2urY62wGB1DWOnAZqnJ8w5Fy2luG1B_kcvkR-hOMTSsAdkjCpk3KIImHgGXQywQIBBY6kNsMo3ipVc3uRm3au7A1PuHrk5CH5-isvTeaTMz02yxvqRmtAv6BDKdMX8nEHmsNIoTvcTEaofUxXehoo6if82NC6NUirVgtpnjBNtTwmJztpWKl5NNIEocJqrwDQYXRbFGFvL3Q5tDO38n9WnfCm8WRnnweiRFOXKS8BP3Mo20AuHUS4OGu8hFXINaHRQ_MbAFnEpZYyH0zXuytcqpmYbuUjCDStaSK4SLCz87lbqmOpLFVim8SyyCgKDsbPdCI-hMbebbVZlTpMwBxauEexJuh9LpRZKwCaRbiqwQ5j-zvI4c_xoQBKrcyIuC4CSLoFnKQPgiWps7oiWGqDk-NogipwnfLB7af1P0K8SKUvESc7IXqdf3FbdIMKgB4pFCPnIzwIrvoZSLM8oGTmStQhWy4264bKLEagxXelf2DIQAhiJwDFcJ2ziCzv1aW1Uc_faeePoO1qtgFzA_fCUXwXnJAQYYyNnec6yg'


  }
  );
  Map<String , dynamic> Data = jsonDecode(response.body);
  List<medicinemodel> listofshow = [];
  if(response.statusCode == 200){
    Data["Medicine"].forEach((element)=> listofshow.add(medicinemodel.fromJson(element)));
    Data["Medicine"]. forEach((element)=> MidicinModel = medicinemodel.fromJson(element));

return listofshow ;
  }else {

    throw Exception('problem in ${response.statusCode}');
  }

}


}