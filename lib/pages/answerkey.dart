import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:smartcheck/answer_keys/aptitude_answerkey.dart';
import 'package:smartcheck/answer_keys/english_answerkey.dart';
import 'package:smartcheck/answer_keys/math_answerkey.dart';
import 'package:smartcheck/answer_keys/science_answerkey.dart';
import '../data.dart' as global;
import '../backend/backendpy.dart';

class AnswerKeyPage extends StatelessWidget {
  const AnswerKeyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = DateFormat("MMMM dd, yyyy").format(DateTime.now());

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: HexColor('#35408f'),
          onPressed: () {
            // Show a confirmation dialog before saving
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Confirm Save"),
                  content:
                      Text("Are you sure you want to save the answer key?"),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        // Save the answer key
                        BackEndPy.updateAnswerKey('1', global.answer_key_temp);
                        global.updateAnswerKey();
                        Fluttertoast.showToast(
                          msg: "Saved!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text("Save"),
                    ),
                  ],
                );
              },
            );
          },
          child: const Icon(
            Icons.save,
            color: Colors.white,
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: HexColor('#35408f')),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Answer Key',
            style: GoogleFonts.poppins(
              color: HexColor('#35408F'),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          bottom: TabBar(
            physics: const BouncingScrollPhysics(),
            labelColor: HexColor('#35408f'),
            indicatorColor: HexColor('#35408f'),
            labelStyle: GoogleFonts.poppins(
              fontSize: 15,
            ),
            unselectedLabelStyle: GoogleFonts.poppins(
              fontSize: 15,
            ),
            tabs: const [
              Tab(
                text: "English",
              ),
              Tab(
                text: "Science",
              ),
              Tab(
                text: "Math",
              ),
              Tab(
                text: "Aptitude",
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: const TabBarView(
          children: [
            EnglishAnswerKey(),
            ScienceAnswerKey(),
            MathAnswerKey(),
            AptitudeAnserKey(),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:intl/intl.dart';
// import 'package:smartcheck/answer_keys/aptitude_answerkey.dart';
// import 'package:smartcheck/answer_keys/english_answerkey.dart';
// import 'package:smartcheck/answer_keys/math_answerkey.dart';
// import 'package:smartcheck/answer_keys/science_answerkey.dart';
// import '../data.dart' as global;
// import '../backend/backendpy.dart';

// class AnswerKeyPage extends StatelessWidget {
//   const AnswerKeyPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     String date = DateFormat("MMMM dd, yyyy").format(DateTime.now());
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         floatingActionButton: FloatingActionButton(
//           elevation: 0.0,
//           backgroundColor: HexColor('#35408f'),
//           onPressed: () {
//             BackEndPy.updateAnswerKey('1', global.answer_key);
//             Fluttertoast.showToast(
//                 msg: "Saved!",
//                 toastLength: Toast.LENGTH_SHORT,
//                 gravity: ToastGravity.BOTTOM,
//                 timeInSecForIosWeb: 1,
//                 backgroundColor: Colors.grey,
//                 textColor: Colors.white,
//                 fontSize: 16.0);
//           },
//           child: const Icon(Icons.save),
//         ),
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back, color: HexColor('#35408f')),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//           title: Text(
//             'Answer Key',
//             style: GoogleFonts.poppins(
//               color: HexColor('#35408F'),
//             ),
//           ),
//           centerTitle: true,
//           backgroundColor: Colors.white,
//           bottom: TabBar(
//             physics: const BouncingScrollPhysics(),
//             labelColor: HexColor('#35408f'),
//             indicatorColor: HexColor('#35408f'),
//             labelStyle: GoogleFonts.poppins(
//               fontSize: 15,
//             ),
//             unselectedLabelStyle: GoogleFonts.poppins(
//               fontSize: 15,
//             ),
//             tabs: const [
//               Tab(
//                 text: "English",
//               ),
//               Tab(
//                 text: "Science",
//               ),
//               Tab(
//                 text: "Math",
//               ),
//               Tab(
//                 text: "Aptitude",
//               ),
//             ],
//           ),
//         ),
//         backgroundColor: Colors.white,
//         body: const TabBarView(
//           children: [
//             EnglishAnswerKey(),
//             ScienceAnswerKey(),
//             MathAnswerKey(),
//             AptitudeAnserKey(),
//           ],
//         ),
//       ),
//     );
//   }
// }
