import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:smartcheck/apiModel//usermodel.dart';

class BackEndPy {
  static Future<dynamic> checkUser(String email, String password) async {
    final url = Uri.parse('http://161.97.68.208:9922/checkUser/');
    final response = await http.post(url,
        body: json.encode({'username': email, 'password': password}));

    var responseString = jsonDecode(response.body) as Map<String, dynamic>;
    return responseString;
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

  static Future<dynamic> getAllUser() async{
    final url = Uri.parse('http://161.97.68.208:9922/getAllUser/');
    final response = await http.get(url);

    var jsonResponse = jsonDecode(response.body) as List<dynamic>;

    return jsonResponse;
  }

  static void addApplicantList(String id, String schoolName, List applicants, String username, String date, bool archive) async {
    final url = Uri.parse('http://161.97.68.208:9922/addApplicantList/');
    final response = await http.post(url,
    body: json.encode({'_id': id,'schoolName': schoolName, 'applicants': applicants, 'proctor': username, 'date': date, 'archive': archive}));

    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    print(jsonResponse);
  }

  static Future<dynamic> getAllApplicantList() async{
    final url = Uri.parse('http://161.97.68.208:9922/getAllApplicantList/');
    final response = await http.get(url);

    var responseString = jsonDecode(response.body) as List<dynamic>;
    return responseString;
  }

  static void getApplicantList(String id, String schoolName, List applicants) async {
    final url = Uri.parse('http://161.97.68.208:9922/addApplicantList/');
    final response = await http.post(url,
    body: json.encode({'_id': id,'schoolName': schoolName, 'applicants': applicants}));

    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    print(jsonResponse);
  }

  static void editApplicantList(String id, bool archive) async{
    final url = Uri.parse('http://161.97.68.208:9922/editApplicantList/');
    final response = await http.patch(url,
    body: json.encode({'_id': id,'archive': archive}));

    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    print(jsonResponse);
  }

  static void deleteApplicantList(String id) async{
    final url = Uri.parse('http://161.97.68.208:9922/deleteApplicantList/');
    final response = await http.delete(url,
    body: json.encode({'_id': id}));

    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;

    print(jsonResponse);
  }

  static void addUser(String id, String username, String password, bool isActive, String role)async {
    final url = Uri.parse('http://161.97.68.208:9922/addUser/');
    final response = await http.post(url,
    body: json.encode({'_id': id, 'username' : username ,'password': password, 'isActive': isActive, 'role' : role}));

    print(response.body);
  }

  static void editUser(String id, String password, bool isActive, String role)async {
    final url = Uri.parse('http://161.97.68.208:9922/editUser/');
    final response = await http.patch(url,
    body: json.encode({'_id': id,'password': password, 'isActive': isActive, 'role' : role}));

    print(response.body);
  }

  static void deleteUser(String id)async {
    final url = Uri.parse('http://161.97.68.208:9922/deleteUser/');
    final response = await http.delete(url,
    body: json.encode({'_id': id}));

    print(response.body);
  }
}
