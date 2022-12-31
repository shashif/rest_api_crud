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
}