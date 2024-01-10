import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pkl_smkn1mejayan_guru/routes/api_route.dart';

class IzinModel {
   static Future getData({Uri? changeUrl}) async {
     try{
       final Uri url = changeUrl ?? ApiRoutes.getDataIzinRoute;
       var response = await http.get(
         url,
         headers: {
           'Content-Type': 'application/json',
           'x-api-key': ApiRoutes.API_KEY
         }
       );

       var data = json.decode(response.body);
       print(data);
       return data;
     }catch(e){
       return {
         'izin': {
           'success': false,
           'message': "Ada kesalahan aplikasi"
         }
       };
     }
   }
}