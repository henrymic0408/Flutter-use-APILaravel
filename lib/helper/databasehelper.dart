import 'dart:convert';

import 'package:http/http.dart' as http;

//function databasehelper
class DatabaseHelper {
  //string url
  String baseUrl = 'http://192.168.0.106:8000/api/';
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

  //function delete API
  void deleteData(int id)async{
    var url = Uri.parse('${baseUrl}category/$id');
    await http.delete(url).then((response) {
      print(response.statusCode);
    });
  }

  //function update API
  void updateData(int id, String name, String desc) async {
    var url = Uri.parse('${baseUrl}category/$id');
    await http.put(url, body: {
      'name' : name,
      'description' : desc,
    }).then((response){
      print(response.statusCode);
      print(response.body);
    });
  }
}
