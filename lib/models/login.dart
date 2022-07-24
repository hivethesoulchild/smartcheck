import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartcheck/backend/backendpy.dart';
import 'package:smartcheck/models/dashboard.dart';
import 'package:smartcheck/models/register.dart';
import 'package:smartcheck/apiModel/usermodel.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  late UserModel _user;
  String username = "";
  String password = "";

  Widget buildUsername() => TextFormField(
        obscureText: false,
        key: formKey,
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
        key: formKey,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Smart',
                      style: GoogleFonts.poppins(
                          fontSize: 24, color: HexColor('#35408f')),
                    ),
                    Text(
                      'Check',
                      style: GoogleFonts.poppins(
                          fontSize: 24, color: HexColor('#CAB358')),
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
                      final user =
                          await BackEndPy.checkUser(username, password);

                      setState(() {
                        _user = user;
                      });

                      if (_user.username.isNotEmpty) {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Dashboard()));
                      }
                      //dispose();
                    },
                    child: Container(
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                          color: HexColor('#35408f'),
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
