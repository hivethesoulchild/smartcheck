import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartcheck/models/privacypolicy.dart';
import 'package:smartcheck/pages/login.dart';
import 'package:smartcheck/backend/backendpy.dart';
import 'package:smartcheck/data.dart' as global;

class Settings extends StatelessWidget {
  const Settings({Key? key, required this.cameras}) : super(key: key);
  final List<CameraDescription> cameras;

  void showPasswordDialog(BuildContext context) {
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();

    RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$',
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Set Password'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Validate password and confirm password match
                if (_passwordController.text ==
                    _confirmPasswordController.text) {
                  // Process matching passwords
                  // (Ex: save to a database, send to API, etc.)

                  if (!passwordRegex.hasMatch(_passwordController.text)) {
                    Fluttertoast.showToast(
                      msg:
                          "Password must be at least 8 characters long and include uppercase letters, lowercase letters, and numbers.",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                    return; // Stop further processing if the password is invalid
                  }

                  BackEndPy.changePassword(
                      global.userId, _passwordController.text);
                  Navigator.pop(context);
                } else {
                  // Show error message for mismatched passwords

                  Fluttertoast.showToast(
                    msg: "Passwords do not match",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                }
              },
              child: Text('Set'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    showAlertDialog(BuildContext context) {
      AlertDialog alert = AlertDialog(
        title: const Text('Trojans'),
        content: SizedBox(
          height: 300,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Members',
                        style: GoogleFonts.nunito(fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [Text('Royce Christopher Abante')],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [Text('Marinelle Bagona')],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [Text('Allisandra Nicole Bendijo')],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [Text('Yvan Roi Casa')],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Adviser',
                        style: GoogleFonts.nunito(fontWeight: FontWeight.w200),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [Text('Roben Juanatas')],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        showPasswordDialog(context);
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Change Password',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showAlertDialog(context);
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'About Us',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        PrivacyPolicyDialog().show(context);
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Privacy Policy',
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login(
                                      cameras: cameras,
                                    )));
                      },
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Log Out',
                            style: GoogleFonts.poppins(color: Colors.red),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
