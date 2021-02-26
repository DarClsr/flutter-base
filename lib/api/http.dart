


import 'dart:convert';
import 'dart:io';

 HttpClient http=new HttpClient();




 httpGet(String url) async {
   print(Uri.parse(url));
   var request=await http.getUrl(Uri.parse(url));
   var response=await request.close();
   var responseBody=await response.transform(Utf8Decoder()).join();
   return responseBody;
 }