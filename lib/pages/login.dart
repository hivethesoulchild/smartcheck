import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartcheck/backend/backendpy.dart';
import 'package:smartcheck/pages/dashboard.dart';
import 'package:smartcheck/models/login_loading.dart';
import 'package:smartcheck/models/register.dart';
import 'package:smartcheck/apiModel/usermodel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../backend/backend.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  var user;
  String username = "";
  String password = "";
  bool isLoggedIn = true;

  Widget buildUsername() => TextFormField(
        obscureText: false,
        decoration: const InputDecoration(
            border: InputBorder.none, hintText: 'Username'),
        onSaved: (value) => setState(() => username = value!),
        validator: (value) {
          if (value?.isEmpty == true) {
            return 'Username must be filled out';
          } else {
            return null;
          }
        },
      );

  Widget buildPassword() => TextFormField(
        obscureText: true,
        decoration: const InputDecoration(
            border: InputBorder.none, hintText: 'Password'),
        onSaved: (value) => setState(() => password = value!),
        validator: (value) {
          if (value?.isEmpty == true) {
            return 'Password must be filled out';
          } else {
            return null;
          }
        },
      );

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
                          fontSize: 32, color: HexColor('#35408f')),
                    ),
                    Text(
                      'Check',
                      style: GoogleFonts.poppins(
                          fontSize: 32, color: HexColor('#CAB358')),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.0),
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
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.0),
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
                    onTap: () async {
                      final isValid = formKey.currentState?.validate();

                      if (isValid!) {
                        formKey.currentState?.save();
                        Fluttertoast.showToast(
                            msg: "nyenye",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        //var res = await checkUser(username, password);
                        user = await BackEndPy.checkUser(username, password);
                        Fluttertoast.showToast(
                            msg: user.username,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        if (username == user.username) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
                        } else {
                          Fluttertoast.showToast(
                              msg: "The username or password is invalid.",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        /**

                         **/
                      }

                      //dispose();
                    },
                    child: Container(
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          color: HexColor('#35408f'),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: isLoggedIn
                            ? const Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
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
                                        fontSize: 18),
                                  )
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not registered yet? ',
                      style: GoogleFonts.poppins(),
                    ),
                    InkWell(
                      child: Text(
                        'Register Now',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                    )
                  ],
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
