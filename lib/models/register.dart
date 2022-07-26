import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartcheck/models/dashboard.dart';
import 'package:smartcheck/models/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  String username = "";
  String password = "";
  String confirmPassword = "";

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
    onSaved: (value) => setState(() => username = value!),
    validator: (value) {
      if (value?.isEmpty == true) {
        return 'Password must be filled out';
      } else {
        return null;
      }
    },
  );

  Widget buildConfirmPassword() => TextFormField(
    obscureText: true,
    decoration: const InputDecoration(
        border: InputBorder.none, hintText: 'Re-enter Password'),
    onSaved: (value) => setState(() => username = value!),
    validator: (value) {
      if (value?.isEmpty == true) {
        return 'Please re-enter the password';
      }else if(password != value){
        return 'Password doesn\'t match';
      }
      else {
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
                          fontSize: 24, color: HexColor('#35408f')),
                    ),
                    Text(
                      'Check',
                      style: GoogleFonts.poppins(
                          fontSize: 24, color: HexColor('#CAB358')),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
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
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.only(left: 24.0),
                      child: buildConfirmPassword(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                      dispose();
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
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already an user? ',
                      style: GoogleFonts.poppins(),
                    ),
                    InkWell(
                      child: Text(
                        'Log In',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {


                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
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
