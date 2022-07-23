import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:smartcheck/model/usermodel.dart';

const MONGO_CONN_URL =
    'mongodb+srv://NUSMartCheck:9jdFoZTyYfgPpGmT@tc.xaicy.mongodb.net/NUSmartApp?retryWrites=true&w=majority';
const APP_COLLECTION = 'account';




class BackEndPy {
  static Future<UserModel> checkUser(String email, String password) async {
    final url = Uri.parse('http://161.97.68.208:5000/checkUser/');
    final response = await http.post(url,
        body: json.encode({'username': 'admin', 'password': 'pass'}));


      final String responseString = response.body;
      print(responseString);

      return userModelFromJson(responseString);


  }
}
