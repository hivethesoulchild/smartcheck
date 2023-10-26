import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class BackEndPy {
  static const String baseUrl = 'http://192.168.195.241:8000';

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

  static Future<dynamic> getAnalysisData() async {
    final url = Uri.parse('$baseUrl/getAnalysisData/');
    final response = await http.get(url);
    return jsonDecode(response.body)
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

    print(response.body);
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
    print(jsonResponse);
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
    print(jsonResponse);
  }

  static void editApplicantList(String id, bool archive) async {
    final url = Uri.parse('$baseUrl/editApplicantList/');
    final response = await http.patch(url,
        body: json.encode({'_id': id, 'archive': archive}));

    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    print(jsonResponse);
  }

  static void deleteApplicantList(String id) async {
    final url = Uri.parse('$baseUrl/deleteApplicantList/');
    final response = await http.delete(url, body: json.encode({'_id': id}));

    var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    print(jsonResponse);
  }

  static void addUser(
      String username, String password, bool isActive, String role) async {
    final url = Uri.parse('$baseUrl/addUser/');
    final response = await http.post(url,
        body: json.encode({
          'username': username,
          'password': password,
          'isActive': isActive,
          'role': role
        }));

    print(response.body);
  }

  static void editUser(
      String id, String password, bool isActive, String role) async {
    final url = Uri.parse('$baseUrl/editUser/');
    final response = await http.patch(url,
        body: json.encode({
          '_id': id,
          'password': password,
          'isActive': isActive,
          'role': role
        }));

    print(response.body);
  }

  static void deleteUser(String id) async {
    final url = Uri.parse('$baseUrl/deleteUser/');
    final response = await http.delete(url, body: json.encode({'_id': id}));

    print(response.body);
  }

  static Future<void> uploadImage(
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
      print('Image uploaded successfully');
      print(response);
    } else {
      print('Image upload failed with status code: ${response.statusCode}');
    }
  }
}
