import 'dart:convert';
import 'package:fluttertest/model/user.dart';
import 'package:http/http.dart' as http; 

class UsersApiProvider {

  Future<List<User>> getUser() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if(response.statusCode == 200) {
      Iterable listJson = json.decode(response.body);
      List<User> userList = List<User>.from(listJson.map((model) => User.fromJson(model)));
      return userList; 
    } else {
      throw Exception("No data!");
    }
  }
}