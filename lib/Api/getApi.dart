import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Models/usermodel.dart';

class getApi{
  static Future<DataModel> getUsers() async {
    String url = "https://reqres.in/api/users?page=2";

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return DataModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }

  
}




