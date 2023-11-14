import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartcheck/backend/backendpy.dart';
import 'package:smartcheck/data.dart' as global;
import 'package:smartcheck/pages/user_dashboard.dart';
import 'package:smartcheck/pages/dashboard.dart';
import 'package:flutter_bcrypt/flutter_bcrypt.dart';

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

    if (isValid!) {
      final user = await BackEndPy.checkUser(
        emailController.text,
        passwordController.text,
      );

      Fluttertoast.showToast(
        msg: 'Logging in...',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      if (emailController.text == user['username']) {
        final answerValue = await BackEndPy.getAnswerKey();
        final allUserValue = await BackEndPy.getAllUser();
        final batchData = await BackEndPy.getAllApplicantList();

        global.setAnswerKeyCache(answerValue);
        global.setUserListCache(allUserValue);
        global.setUserLoggedIn(user);
        global.setBatchData(batchData);
        global.setAnalysistData();

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

        final role = user['role'];

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => role == 'SUPERUSER'
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

// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:smartcheck/backend/backendpy.dart';
// import 'package:smartcheck/pages/dashboard.dart';
// import 'package:smartcheck/models/login_loading.dart';
// import 'package:smartcheck/apiModel/usermodel.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import '../models/user_dashboard.dart';
// import '../data.dart' as global;

// class Login extends StatefulWidget {
//   final List<CameraDescription> cameras;
//   const Login({Key? key, required this.cameras}) : super(key: key);

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final formKey = GlobalKey<FormState>();

//   var user;
//   String username = "";
//   String password = "";
//   bool isLoggedIn = true;
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   Widget buildUsername() => TextFormField(
//     controller: emailController,
//         obscureText: false,
//         decoration: const InputDecoration(
//             border: InputBorder.none, hintText: 'Username'),
//         onSaved: (value) => setState(() => username = value!),
//         validator: (value) {
//           if (value?.isEmpty == true) {
//             return 'Username must be filled out';
//           } else {
//             return null;
//           }
//         },
//       );

//   Widget buildPassword() => TextFormField(
//         controller: passwordController,
//         obscureText: true,
//         decoration: const InputDecoration(
//             border: InputBorder.none, hintText: 'Password'),
//         onSaved: (value) => setState(() => password = value!),
//         validator: (value) {
//           if (value?.isEmpty == true) {
//             return 'Password must be filled out';
//           } else {
//             return null;
//           }
//         },
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body: SafeArea(
//         child: Center(
//           child: Form(
//             key: formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Smart',
//                       style: GoogleFonts.poppins(
//                           fontSize: 32, color: HexColor('#35408f')),
//                     ),
//                     Text(
//                       'Check',
//                       style: GoogleFonts.poppins(
//                           fontSize: 32, color: HexColor('#CAB358')),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         border: Border.all(color: Colors.white),
//                         borderRadius: BorderRadius.circular(12)),
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 24.0),
//                       child: buildUsername(),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20.0,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         border: Border.all(color: Colors.white),
//                         borderRadius: BorderRadius.circular(12)),
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 24.0),
//                       child: buildPassword(),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20.0,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: InkWell(
//                     onTap: () async {
//                       final isValid = formKey.currentState?.validate();

//                       if (isValid!) {
//                         print(true);
//                         user = await BackEndPy.checkUser(emailController.text, passwordController.text);
//                         print(user);
//                         Fluttertoast.showToast(
//                             msg: "Logging in...",
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.BOTTOM,
//                             timeInSecForIosWeb: 1,
//                             backgroundColor: Colors.grey,
//                             textColor: Colors.white,
//                             fontSize: 16.0);
//                         if (emailController.text == user["username"]) {

//                           var answerValue = await BackEndPy.getAnswerKey();
//                           var allUserValue = await BackEndPy.getAllUser();
//                           var batchData = await BackEndPy.getAllApplicantList();

//                           global.setAnswerKeyCache(answerValue);
//                           global.setUserListCache(allUserValue);
//                           global.setUserLoggedIn(user);
//                           global.setBatchData(batchData);
//                           //temporary

//                             formKey.currentState?.save();
//                             Fluttertoast.showToast(
//                             msg: "Logged in!",
//                             toastLength: Toast.LENGTH_SHORT,
//                             gravity: ToastGravity.BOTTOM,
//                             timeInSecForIosWeb: 1,
//                             backgroundColor: Colors.grey,
//                             textColor: Colors.white,
//                             fontSize: 16.0);
                          
//                           if(user['role'] == 'SUPERUSER')
//                           Navigator.of(context).pushReplacement(
//                               MaterialPageRoute(
//                                   builder: (context) => Dashboard(cameras: widget.cameras,)));
//                           else
//                           Navigator.of(context).pushReplacement(
//                               MaterialPageRoute(
//                                   builder: (context) => UserDashboard(cameras: widget.cameras,)));
//                         } else {
//                           Fluttertoast.showToast(
//                               msg: "The username or password is invalid.",
//                               toastLength: Toast.LENGTH_SHORT,
//                               gravity: ToastGravity.BOTTOM,
//                               timeInSecForIosWeb: 1,
//                               backgroundColor: Colors.grey,
//                               textColor: Colors.white,
//                               fontSize: 16.0);
//                         }
//                         /**

//                          **/
//                       }

//                       //dispose();
//                     },
//                     child: Container(
//                       padding: EdgeInsets.all(18),
//                       decoration: BoxDecoration(
//                           color: HexColor('#35408f'),
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Center(
//                         child: isLoggedIn
//                             ? const Text(
//                                 'Sign In',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 18),
//                               )
//                             : Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: const [
//                                   SizedBox(
//                                     width: 15,
//                                     height: 15,
//                                     child: CircularProgressIndicator(
//                                       color: Colors.white,
//                                       strokeWidth: 3,
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Text(
//                                     'Logged in....',
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 18),
//                                   )
//                                 ],
//                               ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 /*Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Not registered yet? ',
//                       style: GoogleFonts.poppins(),
//                     ),
//                     InkWell(
//                       child: Text(
//                         'Register Now',
//                         style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
//                       ),
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Register()));
//                       },
//                     )
//                   ],
//                 ),*/
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
