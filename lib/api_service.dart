import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService{
  final baseURL="jsonplaceholder.typicode.com";

  getAlbum() async{
    var response = await http.get(Uri.https("$baseURL", "albums"));
    if (response.statusCode==200) {
      return jsonDecode(response.body);
    }
    else {
      throw Exception("Failed to load data");
    }
  }

  sendAlbum(String titles) async{
    var response = await http.post(Uri.https("$baseURL", "albums"),
    body: jsonEncode(<String, String>{
      "title":titles,
    }),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      }
    );
    print( "response.statusCode : ${response.statusCode}");
    if (response.statusCode==201) {
      return jsonDecode(response.body);
    }
    else {
      throw Exception("Failed to load data");
    }
  }
}