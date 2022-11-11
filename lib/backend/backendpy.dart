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
        body: json.encode({'username': email, 'password': password}));

    final String responseString = response.body;
    print(responseString);
    return userModelFromJson(responseString);
  }

  static Future<dynamic> getAnswerKey() async {
    final url = Uri.parse('http://161.97.68.208:9922/getAnswerKey/');
    final response = await http.get(url);

    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return jsonResponse;
  }

  static void updateAnswerKey(String id, List data) async{
    final url = Uri.parse('http://161.97.68.208:9922/updateAnswerKey/');
    final response = await http.patch(url,
        body: json.encode({'id': '1', 'english': data[0], 'science': data[1], 'mathematics' : data[2], 'aptitude': data[3] }));

    print(response.body);
  }
}
