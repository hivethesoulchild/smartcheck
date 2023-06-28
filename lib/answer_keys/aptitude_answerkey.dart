import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartcheck/answer_keys/buttons.dart';
import '../data.dart' as global;

class AptitudeAnserKey extends StatefulWidget {
  const AptitudeAnserKey({Key? key}) : super(key: key);

  @override
  State<AptitudeAnserKey> createState() => _AptitudeAnserKeyState();
}

class _AptitudeAnserKeyState extends State<AptitudeAnserKey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: 750,
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < 30; i++)
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${i + 1}. "),
                    ),
                    Center(
                      child: SizedBox(
                        height: 50,
                        child: InputChipotle(
                          answer: global.answer_key[3][i],
                          number: "${i + 1}",
                          subject: 'aptitude',
                        ),
                        width: 300,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}


// TODO: API Integration Pareho na rin sa the rest of the subjects if prefer mo na ganito

// import 'package:flutter/material.dart';
// import 'package:smartcheck/answer_keys/buttons.dart';
// import 'api.dart' as api;

// class AptitudeAnserKey extends StatefulWidget {
//   const AptitudeAnserKey({Key? key}) : super(key: key);

//   @override
//   State<AptitudeAnserKey> createState() => _AptitudeAnserKeyState();
// }

// class _AptitudeAnserKeyState extends State<AptitudeAnserKey> {
//   late Future<List<List<String>>> _answerKeys;

//   @override
//   void initState() {
//     super.initState();
//     _answerKeys = api.Api.fetchAnswerKeys();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       body: Container(
//         height: 750,
//         child: FutureBuilder<List<List<String>>>(
//           future: _answerKeys,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return SingleChildScrollView(
//                 child: Column(
//                   children: List.generate(snapshot.data!.length, (index) {
//                     final answerKey = snapshot.data![index];
//                     final questionNumber = (index + 1).toString();

//                     return Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text("$questionNumber. "),
//                         ),
//                         Center(
//                           child: SizedBox(
//                             height: 50,
//                             child: InputChipotle(
//                               answer: answerKey[3],
//                               number: questionNumber,
//                               subject: 'aptitude',
//                             ),
//                             width: 300,
//                           ),
//                         ),
//                       ],
//                     );
//                   }),
//                 ),
//               );
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else {
//               return Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
