import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:smartcheck/apiModel//usermodel.dart';

class BackEndPy {
  static Future<UserModel> checkUser(String email, String password) async {
    final url = Uri.parse('http://161.97.68.208:9922/checkUser/');
    final response = await http.post(url,
        body: json.encode({'username': 'admin', 'password': 'pass'}));

    final String responseString = response.body;
    print(responseString);
    return userModelFromJson(responseString);
  }

  static Future checkUser1(String email, String password) async {
    final url = Uri.parse('http://161.97.68.208:9922/checkUser/');
    final response = await http.post(url,
        body: json.encode({'username': 'admin', 'password': 'pass'}));

    final String responseString = response.body;
    print(responseString);
    return userModelFromJson(responseString);
  }

  static Future<dynamic> getAnswerKey() async {
    final url = Uri.parse('http://161.97.68.208:9922/getAnswerKey/');
    final response = await http.get(url);

    final String responseString = response.body;
    print(responseString);
    return responseString;
  }
}
