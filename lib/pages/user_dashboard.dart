import 'dart:io';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:smartcheck/pages/archives.dart';
import 'package:smartcheck/batch_detail.dart';
import 'package:csv/csv.dart';
import 'package:smartcheck/models/settings.dart';
import 'dart:convert' show utf8;
import '../data.dart' as global;
import '../routes/dashboard_buttons.dart';
import '../backend/backendpy.dart';
import 'package:uuid/uuid.dart';

class UserDashboard extends StatefulWidget {
  final List<CameraDescription> cameras;
  const UserDashboard({Key? key, required this.cameras}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var applicantList = [];
    final List children = [
      UserDashboardPage(cameras: widget.cameras),
      const Archives(),
      Settings(
        cameras: widget.cameras,
      ),
    ];
    return StatefulBuilder(builder: (context, setStateSB) {
      return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: HexColor('#ffffff'),
          title: Row(
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
        ),
        body: children[_currentIndex],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black,
              blurRadius: 1,
            ),
          ]),
          child: BottomNavigationBar(
            onTap: onTabTapped,
            backgroundColor: HexColor('#ffffff'),
            selectedItemColor: HexColor('#35408f'),
            unselectedItemColor: HexColor('#35408f'),
            currentIndex: _currentIndex,
            selectedLabelStyle: GoogleFonts.poppins(),
            unselectedLabelStyle: GoogleFonts.lato(),
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: 'Homepage'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.archive), label: 'Archive'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        ),
      );
    });
  }
}

class News {
  final String title;
  final String description;

  News(this.title, this.description);
}

class UserDashboardPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const UserDashboardPage({Key? key, required this.cameras}) : super(key: key);

  @override
  State<UserDashboardPage> createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage> {
  @override
  Widget build(BuildContext context) {
    var applicantList = [];
    return StatefulBuilder(builder: (context, setStateSB) {
      return Scaffold(
        backgroundColor: HexColor('#FFFFFF'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Recent Batch',
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w800,
                                fontSize: 20,
                                color: HexColor('#35408f'),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: const Divider(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles(
                                allowMultiple: false,
                                withData: true,
                                type: FileType.custom,
                                allowedExtensions: ['csv'],
                              );

                              //set to database

                              if (result != null) {
                                final input =
                                    File(result.files.single.path!).openRead();
                                final fields = await input
                                    .transform(utf8.decoder)
                                    .transform(const CsvToListConverter())
                                    .toList();
                                final fileName =
                                    result.files.first.name.split('.')[0];

                                var question40 = [];

                                for (int i = 0; i < 30; i++) {
                                  question40.add({"${i + 1}": -1});
                                }

                                var question15 = [];

                                for (int i = 0; i < 30; i++) {
                                  question15.add({"${i + 1}": -1});
                                }

                                fields.asMap().forEach((key, value) {
                                  if (key == 0) {
                                    return;
                                  }
                                  applicantList.add({
                                    fields[0][0].toString().toLowerCase():
                                        value[0],
                                    fields[0][1].toString().toLowerCase():
                                        value[1],
                                    'applicantKeyEnglish': question40,
                                    'applicantKeyScience': question40,
                                    'applicantKeyMathematics': question40,
                                    'applicantKeyAptitude': question15,
                                    'English': 0,
                                    'Mathematics': 0,
                                    'Science': 0,
                                    'Aptitude': 0,
                                    'status': false,
                                    'Recommendation': [],
                                  });
                                });
                                var uuid = const Uuid();
                                var uniqueId = uuid.v4();
                                var now = DateTime.now();
                                var formatter = DateFormat('yyyy-MM-dd');
                                String formattedDate = formatter.format(now);

                                global.batchData.add({
                                  '_id': uniqueId,
                                  'name': fileName,
                                  'archive': false,
                                  'applicants': applicantList,
                                  'date': formattedDate,
                                  'proctor': global.userLoggedIn['username'],
                                });
                                BackEndPy.addApplicantList(
                                  uniqueId,
                                  fileName,
                                  applicantList,
                                  global.userLoggedIn['username'],
                                  formattedDate,
                                  false,
                                );
                              }
                              setStateSB(() {});
                            },
                            child: const Text("Add"),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(7),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisExtent:
                              MediaQuery.of(context).size.width < 380
                                  ? 200
                                  : 150,
                          mainAxisSpacing: 5.0,
                        ),
                        itemCount: global.batchData.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BatchDetail(
                                      cameras: widget.cameras,
                                      dataIndex: index,
                                    ),
                                  ),
                                );
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 12,
                                            bottom: 2,
                                            top: 10,
                                          ),
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              global.batchData[index]['name'],
                                              style: GoogleFonts.poppins(
                                                fontSize: 19,
                                                fontWeight: FontWeight.bold,
                                                color: HexColor("#35408f"),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: PopupMenuButton<int>(
                                            itemBuilder: (context) => [
                                              PopupMenuItem(
                                                value: 1,
                                                onTap: () {
                                                  BackEndPy.editApplicantList(
                                                      global.batchData[index]
                                                          ['_id'],
                                                      true);
                                                  global.batchDataArchive.add(
                                                      global.batchData[index]);
                                                  global.batchData.removeWhere(
                                                      (item) =>
                                                          item['_id'] ==
                                                          global.batchData[
                                                              index]['_id']);
                                                  setState(() {});
                                                },
                                                child: const Text('Archive'),
                                              ),
                                              PopupMenuItem(
                                                value: 2,
                                                onTap: () {
                                                  BackEndPy.deleteApplicantList(
                                                      global.batchData[index]
                                                          ['_id']);
                                                  global.batchData.removeWhere(
                                                      (item) =>
                                                          item['_id'] ==
                                                          global.batchData[
                                                              index]['_id']);
                                                  setState(() {});
                                                },
                                                child: const Text('Delete'),
                                              ),
                                              PopupMenuItem(
                                                value: 3,
                                                onTap: (() {}),
                                                child:
                                                    const Text('Export Data'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: LayoutBuilder(
                                        builder: (BuildContext context,
                                            BoxConstraints constraints) {
                                          if (constraints.maxWidth < 360) {
                                            // For smaller screens, use Wrap
                                            return Wrap(
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12, top: 5),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      'Number of Applicants: ${global.batchData[index]['applicants'].length}',
                                                      overflow:
                                                          TextOverflow.fade,
                                                      style: GoogleFonts.prompt(
                                                        fontSize: 12,
                                                        color:
                                                            HexColor("#35408f"),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12, top: 5),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      'Submitted: ${global.batchData[index]['applicants'].where((e) => e['status'] == true).length}',
                                                      style: GoogleFonts.prompt(
                                                        fontSize: 12,
                                                        color:
                                                            HexColor("#35408f"),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12, top: 5),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      'Did Not Submit: ${global.batchData[index]['applicants'].where((e) => e['status'] == false).length}',
                                                      style: GoogleFonts.prompt(
                                                        fontSize: 12,
                                                        color:
                                                            HexColor("#35408f"),
                                                      ),
                                                      overflow:
                                                          TextOverflow.fade,
                                                      softWrap: false,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else {
                                            // For larger screens, use Row
                                            return Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12, top: 5),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      'Number of Applicants: ${global.batchData[index]['applicants'].length}',
                                                      overflow:
                                                          TextOverflow.fade,
                                                      style: GoogleFonts.prompt(
                                                        fontSize: 10,
                                                        color:
                                                            HexColor("#35408f"),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12, top: 5),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      'Submitted: ${global.batchData[index]['applicants'].where((e) => e['status'] == true).length}',
                                                      style: GoogleFonts.prompt(
                                                        fontSize: 10,
                                                        color:
                                                            HexColor("#35408f"),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 12, top: 5),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.topLeft,
                                                    child: Text(
                                                      'Did Not Submit: ${global.batchData[index]['applicants'].where((e) => e['status'] == false).length}',
                                                      style: GoogleFonts.prompt(
                                                        fontSize: 10,
                                                        color:
                                                            HexColor("#35408f"),
                                                      ),
                                                      overflow:
                                                          TextOverflow.fade,
                                                      softWrap: false,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          }
                                        },
                                      ),
                                    ),

                                    // Expanded(
                                    //   child: Padding(
                                    //     padding: const EdgeInsets.only(
                                    //       left: 16,
                                    //       top: 5,
                                    //     ),
                                    //     child: Align(
                                    //       alignment: Alignment.topLeft,
                                    //       child: Text(
                                    //         global.batchData[index]['name'],
                                    //         style: GoogleFonts.prompt(
                                    //           fontSize: 12,
                                    //           color: HexColor("#35408f"),
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

//       InkWell(
//         onTap: () {
//           setState(() {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => BatchDetail()));
//           });
//         },
//         child: Padding(
//           padding: EdgeInsets.all(3.0),
//           child: Container(
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12.0),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 2,
//                     blurRadius: 4,
//                     offset: Offset(0, 3),
//                   )
//                 ]),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                           left: 12, bottom: 2, top: 10),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           'Haggard University',
//                           style: GoogleFonts.poppins(
//                               fontSize: 19,
//                               fontWeight: FontWeight.bold,
//                               color: HexColor("#35408f")),
//                         ),
//                       ),
//                     ),
//                     Spacer(),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: PopupMenuButton<int>(
//                         itemBuilder: (context) => [
//                           PopupMenuItem(
//                             child: Text('Archive'),
//                             value: 1,
//                           ),
//                           PopupMenuItem(
//                             child: Text('Delete'),
//                             value: 2,
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(left: 16, top: 5),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           'Number of Applicants: 1',
//                           style: GoogleFonts.prompt(
//                               fontSize: 10,
//                               color: HexColor("#35408f")),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(left: 16, top: 5),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           'Submitted: 1',
//                           style: GoogleFonts.prompt(
//                               fontSize: 10,
//                               color: HexColor("#35408f")),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           const EdgeInsets.only(left: 16, top: 5),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           'Did Not Submit: 0',
//                           style: GoogleFonts.prompt(
//                               fontSize: 10,
//                               color: HexColor("#35408f")),
//                           overflow: TextOverflow.fade,
//                           softWrap: false,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 16, top: 5),
//                   child: Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       '$date',
//                       style: GoogleFonts.prompt(
//                           fontSize: 12, color: HexColor("#35408f")),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   ),
// ),

// Is in builder mode, change itemCount into dynamic and replace BatchDetail
// Flexible(
//   flex: 2,
//   fit: FlexFit.loose,
//   child: GridView.builder(
//     padding: EdgeInsets.all(7),
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 1,
//       mainAxisExtent: 130,
//       mainAxisSpacing: 5.0,
//     ),
//     itemCount: 3,
//     itemBuilder: (context, index) {
//       return InkWell(
//         onTap: () {
//           setState(() {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => BatchDetail()),
//             );
//           });
//         },
//         child: Padding(
//           padding: EdgeInsets.all(3.0),
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12.0),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 4,
//                   offset: Offset(0, 3),
//                 )
//               ],
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: <Widget>[
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         left: 12,
//                         bottom: 2,
//                         top: 10,
//                       ),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           'Batch $index',
//                           style: GoogleFonts.poppins(
//                             fontSize: 19,
//                             fontWeight: FontWeight.bold,
//                             color: HexColor("#35408f"),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Spacer(),
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: PopupMenuButton<int>(
//                         itemBuilder: (context) => [
//                           PopupMenuItem(
//                             child: Text('Archive'),
//                             value: 1,
//                           ),
//                           PopupMenuItem(
//                             child: Text('Delete'),
//                             value: 2,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         left: 16,
//                         top: 5,
//                       ),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           'Number of Applicants: 1',
//                           style: GoogleFonts.prompt(
//                             fontSize: 10,
//                             color: HexColor("#35408f"),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         left: 16,
//                         top: 5,
//                       ),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           'Submitted: 1',
//                           style: GoogleFonts.prompt(
//                             fontSize: 10,
//                             color: HexColor("#35408f"),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         left: 16,
//                         top: 5,
//                       ),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           'Did Not Submit: 0',
//                           style: GoogleFonts.prompt(
//                             fontSize: 10,
//                             color: HexColor("#35408f"),
//                           ),
//                           overflow: TextOverflow.fade,
//                           softWrap: false,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 16,
//                     top: 5,
//                   ),
//                   child: Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       '$date',
//                       style: GoogleFonts.prompt(
//                         fontSize: 12,
//                         color: HexColor("#35408f"),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   ),
// )


// Flexible(
//                 flex: 2,
//                 fit: FlexFit.loose,
//                 child: GridView.count(
//                   padding: const EdgeInsets.all(5.0),
//                   crossAxisCount: 1,
//                   childAspectRatio: 2.6,
//                   crossAxisSpacing: 120,
//                   children: global.batchData.map((value) {
//                     return InkWell(
//                       onTap: () {
//                         setState(() {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => BatchDetail(
//                                         batchData: value['applicants'],
//                                         name: value['name'],
//                                         cameras: widget.cameras,
//                                       )));
//                         });
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.all(3.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12.0),
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   spreadRadius: 2,
//                                   blurRadius: 4,
//                                   offset: Offset(0, 3),
//                                 )
//                               ]),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisSize: MainAxisSize.max,
//                             children: <Widget>[
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 80,
//                                     child: Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 15, bottom: 2, top: 10),
//                                       child: Align(
//                                         alignment: Alignment.topLeft,
//                                         child: Text(
//                                           value['name'],
//                                           style: GoogleFonts.poppins(
//                                               fontSize: 19,
//                                               fontWeight: FontWeight.bold,
//                                               color: HexColor("#35408f")),
//                                           overflow: TextOverflow.fade,
//                                           maxLines: 1,
//                                           softWrap: true,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Spacer(),
//                                   Padding(
//                                     padding: const EdgeInsets.all(10.0),
//                                     child: PopupMenuButton<int>(
//                                       itemBuilder: (context) => [
//                                         PopupMenuItem(
//                                           child: Text('Archive'),
//                                           value: 1,
//                                           onTap: () {
//                                             BackEndPy.editApplicantList(
//                                                 value['_id'], true);
//                                             global.batchDataArchive.add(value);
//                                             global.batchData.removeWhere(
//                                                 (item) =>
//                                                     item['_id'] ==
//                                                     value['_id']);
//                                             setState(() {});
//                                           },
//                                         ),
//                                         PopupMenuItem(
//                                           child: Text('Delete'),
//                                           value: 2,
//                                           onTap: () {
//                                             BackEndPy.deleteApplicantList(
//                                                 value['_id']);
//                                             global.batchData.removeWhere(
//                                                 (item) =>
//                                                     item['_id'] ==
//                                                     value['_id']);
//                                             setState(() {});
//                                           },
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(left: 16, top: 5),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         'Number of Applicants: ${value['applicants'].length}',
//                                         style: GoogleFonts.prompt(
//                                             fontSize: 10,
//                                             color: HexColor("#35408f")),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(left: 16, top: 5),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         'Submitted: ${value['applicants'].where((e) => e['status'] == true).length}',
//                                         style: GoogleFonts.prompt(
//                                             fontSize: 10,
//                                             color: HexColor("#35408f")),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.only(left: 16, top: 5),
//                                     child: Align(
//                                       alignment: Alignment.topLeft,
//                                       child: Text(
//                                         'Did Not Submit: ${value['applicants'].where((e) => e['status'] == false).length}',
//                                         style: GoogleFonts.prompt(
//                                             fontSize: 10,
//                                             color: HexColor("#35408f")),
//                                         overflow: TextOverflow.fade,
//                                         softWrap: false,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 16, top: 5),
//                                 child: Align(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     value['date'],
//                                     style: GoogleFonts.prompt(
//                                         fontSize: 12,
//                                         color: HexColor("#35408f")),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ),