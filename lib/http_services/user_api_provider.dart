import 'dart:convert';
import 'package:bloc_8_http/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  Future<List<User>> getUsers() async {
    final responce =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (responce.statusCode == 200) {
      print(json.decode(responce.body));
      final List<dynamic> userJson = json.decode(responce.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching users');
    }
  }
}
