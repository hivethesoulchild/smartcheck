import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CreateAnswerKey extends StatefulWidget {
  const CreateAnswerKey({Key? key}) : super(key: key);

  @override
  State<CreateAnswerKey> createState() => _CreateAnswerKeyState();
}

class _CreateAnswerKeyState extends State<CreateAnswerKey> {
  bool _AhasBeenPressed = false;
  bool _BhasBeenPressed = false;
  bool _ChasBeenPressed = false;
  bool _DhasBeenPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor('#35408f'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0))),
                  onPressed: () {},
                  child: Text(
                    'Upload Answer Key',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    '1. ',
                    style: GoogleFonts.nunito(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      _AhasBeenPressed = !_AhasBeenPressed;
                    })
                  },
                  child: new Text(
                    'A',
                    style: GoogleFonts.nunito(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor:
                          _AhasBeenPressed ? Colors.green[100] : Colors.white,
                      padding: EdgeInsets.all(20)),
                ),
                ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      _BhasBeenPressed = !_BhasBeenPressed;
                    })
                  },
                  child: new Text(
                    'B',
                    style: GoogleFonts.nunito(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor:
                          _BhasBeenPressed ? Colors.green[100] : Colors.white,
                      padding: EdgeInsets.all(20)),
                ),
                ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      _ChasBeenPressed = !_ChasBeenPressed;
                    })
                  },
                  child: new Text(
                    'C',
                    style: GoogleFonts.nunito(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor:
                          _ChasBeenPressed ? Colors.green[100] : Colors.white,
                      padding: EdgeInsets.all(20)),
                ),
                ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      _DhasBeenPressed = !_DhasBeenPressed;
                    })
                  },
                  child: new Text(
                    'D',
                    style: GoogleFonts.nunito(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor:
                          _DhasBeenPressed ? Colors.green[100] : Colors.white,
                      padding: EdgeInsets.all(20)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    '2. ',
                    style: GoogleFonts.nunito(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      _AhasBeenPressed = !_AhasBeenPressed;
                    })
                  },
                  child: new Text(
                    'A',
                    style: GoogleFonts.nunito(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor:
                          _AhasBeenPressed ? Colors.green[100] : Colors.white,
                      padding: EdgeInsets.all(20)),
                ),
                ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      _BhasBeenPressed = !_BhasBeenPressed;
                    })
                  },
                  child: new Text(
                    'B',
                    style: GoogleFonts.nunito(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor:
                          _BhasBeenPressed ? Colors.green[100] : Colors.white,
                      padding: EdgeInsets.all(20)),
                ),
                ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      _ChasBeenPressed = !_ChasBeenPressed;
                    })
                  },
                  child: new Text(
                    'C',
                    style: GoogleFonts.nunito(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor:
                          _ChasBeenPressed ? Colors.green[100] : Colors.white,
                      padding: EdgeInsets.all(20)),
                ),
                ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      _DhasBeenPressed = !_DhasBeenPressed;
                    })
                  },
                  child: new Text(
                    'D',
                    style: GoogleFonts.nunito(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor:
                          _DhasBeenPressed ? Colors.green[100] : Colors.white,
                      padding: EdgeInsets.all(20)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    '3. ',
                    style: GoogleFonts.nunito(color: Colors.black),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      _AhasBeenPressed = !_AhasBeenPressed;
                    })
                  },
                  child: new Text(
                    'A',
                    style: GoogleFonts.nunito(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor:
                          _AhasBeenPressed ? Colors.green[100] : Colors.white,
                      padding: EdgeInsets.all(20)),
                ),
                ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      _BhasBeenPressed = !_BhasBeenPressed;
                    })
                  },
                  child: new Text(
                    'B',
                    style: GoogleFonts.nunito(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor:
                          _BhasBeenPressed ? Colors.green[100] : Colors.white,
                      padding: EdgeInsets.all(20)),
                ),
                ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      _ChasBeenPressed = !_ChasBeenPressed;
                    })
                  },
                  child: new Text(
                    'C',
                    style: GoogleFonts.nunito(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor:
                          _ChasBeenPressed ? Colors.green[100] : Colors.white,
                      padding: EdgeInsets.all(20)),
                ),
                ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      _DhasBeenPressed = !_DhasBeenPressed;
                    })
                  },
                  child: new Text(
                    'D',
                    style: GoogleFonts.nunito(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      backgroundColor:
                          _DhasBeenPressed ? Colors.green[100] : Colors.white,
                      padding: EdgeInsets.all(20)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';

// class CreateAnswerKey extends StatefulWidget {
//   const CreateAnswerKey({Key? key}) : super(key: key);

//   @override
//   State<CreateAnswerKey> createState() => _CreateAnswerKeyState();
// }

// class _CreateAnswerKeyState extends State<CreateAnswerKey> {
//   List<bool> _answerPressed = [false, false, false, false];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: HexColor('#35408f')),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           'Answer Key',
//           style: GoogleFonts.poppins(
//             color: HexColor('#35408F'),
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Container(
//               alignment: Alignment.topCenter,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: HexColor('#35408f'),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12.0),
//                     ),
//                   ),
//                   onPressed: () {},
//                   child: Text(
//                     'Upload Answer Key',
//                     style: GoogleFonts.poppins(
//                       fontSize: 16,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             buildAnswerRow(1),
//             SizedBox(height: 10),
//             buildAnswerRow(2),
//             SizedBox(height: 10),
//             buildAnswerRow(3),
//           ],
//         ),
//       ),
//     );
//   }

//   Row buildAnswerRow(int questionNumber) {
//     return Row(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.only(left: 5),
//           child: Text(
//             '$questionNumber. ',
//             style: GoogleFonts.nunito(color: Colors.black),
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               _answerPressed[0] = !_answerPressed[0];
//             });
//           },
//           child: Text(
//             'A',
//             style: GoogleFonts.nunito(color: Colors.black),
//           ),
//           style: ElevatedButton.styleFrom(
//             shape: CircleBorder(),
//             backgroundColor:
//                 _answerPressed[0] ? Colors.green[100] : Colors.white,
//             padding: EdgeInsets.all(20),
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               _answerPressed[1] = !_answerPressed[1];
//             });
//           },
//           child: Text(
//             'B',
//             style: GoogleFonts.nunito(color: Colors.black),
//           ),
//           style: ElevatedButton.styleFrom(
//             shape: CircleBorder(),
//             backgroundColor:
//                 _answerPressed[1] ? Colors.green[100] : Colors.white,
//             padding: EdgeInsets.all(20),
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               _answerPressed[2] = !_answerPressed[2];
//             });
//           },
//           child: Text(
//             'C',
//             style: GoogleFonts.nunito(color: Colors.black),
//           ),
//           style: ElevatedButton.styleFrom(
//             shape: CircleBorder(),
//             backgroundColor:
//                 _answerPressed[2] ? Colors.green[100] : Colors.white,
//             padding: EdgeInsets.all(20),
//           ),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             setState(() {
//               _answerPressed[3] = !_answerPressed[3];
//             });
//           },
//           child: Text(
//             'D',
//             style: GoogleFonts.nunito(color: Colors.black),
//           ),
//           style: ElevatedButton.styleFrom(
//             shape: CircleBorder(),
//             backgroundColor:
//                 _answerPressed[3] ? Colors.green[100] : Colors.white,
//             padding: EdgeInsets.all(20),
//           ),
//         ),
//       ],
//     );
//   }
// }
