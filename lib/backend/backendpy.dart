import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BackEndPy {
  static String baseUrl = dotenv.get("API_URL");

  static Future<dynamic> authentication(
      String username, String password) async {
    final url = Uri.parse('$baseUrl/authenticateUser/');
    final response = await http.post(url,
        body: json.encode({'username': username, 'password': password}));
    return jsonDecode(response.body);
  }

  static Future<dynamic> checkUser(String email, String password) async {
    final url = Uri.parse('$baseUrl/checkUser/');
    final response = await http.post(url,
        body: json.encode({'username': email, 'password': password}));
    
    return jsonDecode(response.body);
  }

  static Future<dynamic> getAnswerKey() async {
    final url = Uri.parse('$baseUrl/getAnswerKey/');
    final response = await http.get(url);
    return jsonDecode(response.body);
  }

  static Future<dynamic> getBatchData(String id) async {
    final url = Uri.parse('$baseUrl/getBatchData/');
    final response = await http.post(url, body: json.encode({'_id': id}));
    return jsonDecode(response.body);
  }

  static Future<dynamic> getAnalysisData() async {
    final url = Uri.parse('$baseUrl/getAnalysisData/');
    final response = await http.get(url);
    return jsonDecode(response.body);
  }

  static Future<dynamic> getFilteredAnalysisData(
      DateTime start, DateTime end) async {
    final url = Uri.parse('$baseUrl/getFilteredAnalysisData/');
    final response = await http.post(url,
        body: json.encode({
          "start": start.toIso8601String(), // Format dates for JSON
          "end": end.toIso8601String(),
        }));
    return jsonDecode(response.body);
  }

  static Future<dynamic> getFilteredAnswerKey(DateTime start) async {
    final url = Uri.parse('$baseUrl/getFilteredAnswerKey/');
    final response = await http.post(url,
    body: json.encode({
      "start": start.toIso8601String()
    }));

    return jsonDecode(response.body);
  }

  static void updateAnswerKey(String id, List data) async {
    final url = Uri.parse('$baseUrl/updateAnswerKey/');
    final response = await http.patch(url,
        body: json.encode({
          'id': '1',
          'english': data[0],
          'science': data[1],
          'mathematics': data[2],
          'aptitude': data[3]
        }));
  }

  static Future<dynamic> getAllUser() async {
    final url = Uri.parse('$baseUrl/getAllUser/');
    final response = await http.get(url);
    return jsonDecode(response.body) as List<dynamic>;
  }

  static void addApplicantList(String id, String schoolName, List applicants,
      String username, String date, bool archive) async {
    final url = Uri.parse('$baseUrl/addApplicantList/');
    final response = await http.post(url,
        body: json.encode({
          '_id': id,
          'schoolName': schoolName,
          'applicants': applicants,
          'proctor': username,
          'date': date,
          'archive': archive
        }));

    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
  }

  static Future<dynamic> getAllApplicantList() async {
    final url = Uri.parse('$baseUrl/getAllApplicantList/');
    final response = await http.get(url);
    return jsonDecode(response.body) as List<dynamic>;
  }

  static void getApplicantList(
      String id, String schoolName, List applicants) async {
    final url = Uri.parse('$baseUrl/addApplicantList/');
    final response = await http.post(url,
        body: json.encode(
            {'_id': id, 'schoolName': schoolName, 'applicants': applicants}));

    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
  }

  static void editApplicantList(String id, bool archive) async {
    final url = Uri.parse('$baseUrl/editApplicantList/');
    final response = await http.patch(url,
        body: json.encode({'_id': id, 'archive': archive}));

    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
  }

  static void deleteApplicantList(String id) async {
    final url = Uri.parse('$baseUrl/deleteApplicantList/');
    final response = await http.delete(url, body: json.encode({'_id': id}));

    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
  }

  static void addUser(String username, String password, String role) async {
    final url = Uri.parse('$baseUrl/addUser/v2');
    final response = await http.post(url,
        body: json.encode(
            {'username': username, 'password': password, 'role': role}));
  }

  static void changePassword(String id, String password) async {
    final url = Uri.parse('$baseUrl/changePassword/');
    final response = await http.patch(url,
        body: json.encode({
          '_id': id,
          'password': password,
        }));
  }

  static void editUser(String id, String password, String role) async {
    final url = Uri.parse('$baseUrl/editUser/');
    final response = await http.patch(url,
        body: json.encode({'_id': id, 'password': password, 'role': role}));
  }

  static void deleteUser(String id) async {
    final url = Uri.parse('$baseUrl/deleteUser/');
    final response = await http.delete(url, body: json.encode({'_id': id}));
  }

  static Future<dynamic> userValid(String username) async {
    final url = Uri.parse('$baseUrl/userValid/');
    final response =
        await http.post(url, body: json.encode({"username": username}));

    final result = jsonDecode(response.body) as Map<String, dynamic>;
    return result["exist"];
  }

  static Future<dynamic> uploadImage(
      dynamic imageFile, String batchId, int id) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$baseUrl/upload'),
    );

    // Add batchId and id as fields in the request body
    request.fields['batchId'] = batchId;
    request.fields['id'] = id.toString();

    File file = File(imageFile.path);

    // Attach the image file to the request
    request.files.add(
      http.MultipartFile(
        'file',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: imageFile.path.split('/').last,
      ),
    );

    var response = await request.send();
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      return jsonDecode(responseBody);
    } else {
      String errorBody = await response.stream.bytesToString();
      return jsonDecode(errorBody);
    }
  }
}
