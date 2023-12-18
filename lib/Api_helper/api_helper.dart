
import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiHelper{
   // static String everyThingbaseUrl="https://newsapi.org/v2/everything?q=keyword&apiKey=4b816d71d9524bdba2874cdcd77027c4";


 Future<dynamic> getApi({required String url,Map<String,String>? mHeader})async{
    var res=await http.get(Uri.parse(url),headers: mHeader ?? {
      "Authorization":"4b816d71d9524bdba2874cdcd77027c4"
    });

    if(res.statusCode==200){
      return jsonDecode(res.body);
    }
    else{
      return null;
    }
}
}