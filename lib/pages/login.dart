import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartcheck/backend/backendpy.dart';
import 'package:smartcheck/backend/data.dart' as global;
import 'package:smartcheck/pages/proctor/user_dashboard.dart';
import 'package:smartcheck/pages/admin/dashboard.dart';

class Login extends StatefulWidget {
  final List<CameraDescription> cameras;

  const Login({Key? key, required this.cameras}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoggedIn = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget buildUsername() => TextFormField(
        controller: emailController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Username',
        ),
        validator: (value) {
          if (value?.isEmpty == true) {
            return 'Username must be filled out';
          }
          return null;
        },
      );

  Widget buildPassword() => TextFormField(
        controller: passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Password',
        ),
        validator: (value) {
          if (value?.isEmpty == true) {
            return 'Password must be filled out';
          }
          return null;
        },
      );

  Future<void> login() async {
    final isValid = formKey.currentState?.validate();

    Fluttertoast.showToast(
      msg: 'Logging in...',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    if (isValid!) {
      final auth = await BackEndPy.authentication(
          emailController.text, passwordController.text);

      if (auth['authenticated']) {
        final answerValue = await BackEndPy.getAnswerKey();
        final allUserValue = await BackEndPy.getAllUser();
        final batchData = await BackEndPy.getAllApplicantList();

        global.setAnswerKeyCache(answerValue);
        global.setUserListCache(allUserValue);
        global.setProfile(auth['_id'], auth['username']);
        global.setBatchData(batchData);
        //global.setAnalysistData();

        formKey.currentState?.save();

        Fluttertoast.showToast(
          msg: 'Logged in!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );

        final role = auth['role'];

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => role == 'ADMIN'
                ? Dashboard(cameras: widget.cameras)
                : UserDashboard(cameras: widget.cameras),
          ),
        );
      } else {
        Fluttertoast.showToast(
          msg: 'The username or password is invalid.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Smart',
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        color: HexColor('#35408f'),
                      ),
                    ),
                    Text(
                      'Check',
                      style: GoogleFonts.poppins(
                        fontSize: 32,
                        color: HexColor('#CAB358'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: buildUsername(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: buildPassword(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InkWell(
                    onTap: login,
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: HexColor('#35408f'),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: isLoggedIn
                            ? const Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              )
                            : const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 15,
                                    height: 15,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 3,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Logged in....',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
