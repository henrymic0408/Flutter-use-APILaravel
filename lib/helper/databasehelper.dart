import 'dart:convert';

import 'package:http/http.dart' as http;

//function databasehelper
class DatabaseHelper {
  //string url
  String baseUrl = 'http://192.168.0.111:8000/api/';
  //function getAPI
  Future getData() async {
    var url = Uri.parse('${baseUrl}category');
    var response = await http.get(url);
    var result = json.decode(response.body)['data'];
    return result;
  }

  //function store API
  void addData(String name, String desc) async {
    var url = Uri.parse('${baseUrl}category');
    await http.post(url, body: {
      'name' : name,
      'description' : desc,
    }).then((response){
      print(response.statusCode);
      print(response.body);
    });
  }
}
