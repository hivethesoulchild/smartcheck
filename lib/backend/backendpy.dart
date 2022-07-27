import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:smartcheck/apiModel/usermodel.dart';
import 'package:smartcheck/apiModel/countDocuments.dart';


class BackEndPy {
  static Future<UserModel> checkUser(String username, String password) async {
    final url = Uri.parse('http://161.97.68.208:5000/checkUser/');
    final response = await http.post(url,
        body: json.encode({'username': username, 'password': password}));


      final String responseString = response.body;
      print(responseString);

      return userModelFromJson(responseString);
  }

  static Future<UserModel> createUser(String username, String password) async {
    final url = Uri.parse('http://161.97.68.208:5000/createUser/');
    final response = await http.post(url,
        body: json.encode({'username': username, 'password': password}));


    final String responseString = response.body;
    print(responseString);

    return userModelFromJson(responseString);
  }

  static Future<CountDocuments> userExist(String username, String password) async {
    final url = Uri.parse('http://161.97.68.208:5000/checkUsername/');
    final response = await http.post(url,
        body: json.encode({'username': username, 'password': password}));


    final String responseString = response.body;
    print(responseString);

    return countDocumentsFromJson(responseString);
  }
}
