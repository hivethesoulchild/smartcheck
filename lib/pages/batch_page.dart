// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'answerkey.dart';
// import 'scanner.dart';
// import 'package:smartcheck/models/timer.dart';
// import 'package:smartcheck/pages/answerkey.dart';
// import '../data.dart' as global;

// class BatchPage extends StatelessWidget {
//   final int i;

//   const BatchPage({Key? key, required this.i}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
    
//     showDataAlert(int batchIndex, int applicantIndex) {
//       var recommendations = global.batchData[batchIndex]['applicantList']
//           [applicantIndex]['Recommendation'];
//       if (recommendations == null) {
//         recommendations = '';
//       } else {
//         recommendations = recommendations.join(',');
//       }
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             contentPadding: EdgeInsets.only(top: 10.0),
//             title: Text(
//               'Scores',
//               style: GoogleFonts.poppins(),
//             ),
//             content: SizedBox(
//               height: 500,
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Text(
//                               'English: ${global.batchData[batchIndex]['applicants'][applicantIndex]['English']}')
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Text(
//                               'Mathematics: ${global.batchData[batchIndex]['applicants'][applicantIndex]['Mathematics']}')
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Text(
//                               'Science: ${global.batchData[batchIndex]['applicants'][applicantIndex]['Science']}')
//                         ],
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Text(
//                               'Aptitude: ${global.batchData[batchIndex]['applicants'][applicantIndex]['Aptitude']}')
//                         ],
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         'Status: ${global.batchData[batchIndex]['applicants'][applicantIndex]['Status']}',
//                         style: GoogleFonts.poppins(),
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         'Recommendations: $recommendations',
//                         style: GoogleFonts.poppins(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       );
//     }

//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: HexColor('#35408f')),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         centerTitle: true,
//         title: Text(
//           'Batch ${global.batchData[i]['batchID']}',
//           style: GoogleFonts.poppins(fontSize: 18, color: HexColor('#35408f')),
//         ),
//         backgroundColor: Colors.white,
//         actions: [
//           PopupMenuButton(
//             itemBuilder: (context) => [
//               PopupMenuItem(
//                 child: Text("Sort by name"),
//                 onTap: () {},
//               ),
//               PopupMenuItem(
//                 child: Text("Sort by number"),
//                 onTap: () {},
//               ),
//               PopupMenuItem(
//                 child: Text("Sort by status"),
//                 onTap: () {},
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               flex: 1,
//               child: GridView(
//                 scrollDirection: Axis.horizontal,
//                 physics: ClampingScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisExtent: 120,
//                   mainAxisSpacing: 5.0,
//                   crossAxisSpacing: 5.0,
//                 ),
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => ScannerPage()));
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12.0),
//                           color: HexColor('#35408f'),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 0,
//                               blurRadius: 4,
//                               offset: Offset(0, 3),
//                             )
//                           ]),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Check Papers',
//                           style: GoogleFonts.poppins(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => AnswerKeyPage()));
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12.0),
//                           color: HexColor('#35408f'),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 0,
//                               blurRadius: 4,
//                               offset: Offset(0, 3),
//                             )
//                           ]),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Answer Key',
//                           style: GoogleFonts.poppins(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.of(context).push(
//                           MaterialPageRoute(builder: (context) => TimerPage()));
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12.0),
//                           color: HexColor('#35408f'),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 0,
//                               blurRadius: 4,
//                               offset: Offset(0, 3),
//                             )
//                           ]),
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Timer',
//                           style: GoogleFonts.poppins(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
