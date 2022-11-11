import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:smartcheck/pages/answerkey.dart';
import 'package:smartcheck/pages/archives.dart';
import 'package:smartcheck/batch_detail.dart';
import 'package:csv/csv.dart';
import 'package:smartcheck/pages/batch_page.dart';
import 'package:smartcheck/models/charts.dart';
import 'package:smartcheck/models/settings.dart';
import 'dart:convert' show utf8;
import '../data.dart' as global;
import '../routes/dashboard_buttons.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  final List _children = [
    const DashboardPage(
      title: 'Batch',
    ),
    const Archives(),
    const Settings(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var applicantList = [];
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: HexColor('#ffffff'),
        title: Row(
          children: [
            Text(
              'Smart',
              style:
                  GoogleFonts.poppins(fontSize: 24, color: HexColor('#35408f')),
            ),
            Text(
              'Check',
              style:
                  GoogleFonts.poppins(fontSize: 24, color: HexColor('#CAB358')),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: HexColor('#35408f'),
          ),
          IconButton(
            onPressed: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  withData: true,
                  type: FileType.custom,
                  allowedExtensions: ['csv']);
              setState(() async {
                if (result != null) {
                  final input = File(result.files.single.path!).openRead();
                  final fields = await input
                      .transform(utf8.decoder)
                      .transform(const CsvToListConverter())
                      .toList();

                  fields.asMap().forEach((key, value) {
                    if (key == 0) {
                      return;
                    }
                    applicantList.add({
                      fields[0][0].toString().toLowerCase(): value[0],
                      fields[0][1].toString().toLowerCase(): value[1],
                      'English': 0,
                      'Mathematics': 0,
                      'Science': 0,
                      'Aptitude': 0,
                      'Status': 'Not yet taken',
                      'Recommendation': ['BSIT', 'BSCS']
                    });
                  });
                }

                global.batchData.add({
                  'batchID': global.batchData.length,
                  'applicantList': applicantList
                });
              });
            },
            icon: const Icon(Icons.add),
            color: HexColor('#35408f'),
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: <BoxShadow>[
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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Homepage'),
            BottomNavigationBarItem(
                icon: Icon(Icons.archive), label: 'Archive'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
    );
  }
}

class News {
  final String title;
  final String description;

  News(this.title, this.description);
}

class DashboardPage extends StatefulWidget {
  final String title;

  const DashboardPage({Key? key, required this.title}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String date = DateFormat("MMMM dd, yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FFFFFF'),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.tight,
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: GridView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(5.0),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 130,
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0,
                      ),
                      children: [
                        buildAnalysisChartButton(context),
                        buildPrivilegedUserButton(context),
                        buildAnswerKeyButton(context),
                        buildScannerButton(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Recent Batch',
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        color: HexColor('#35408f')),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0, right: 20.0),
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            /* Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: GridView.builder(
                  padding: const EdgeInsets.all(5.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 150,
                  ),
                  itemCount: global.batchData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BatchDetail(i: index)));
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: Offset(0, 3),
                                  )
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Batch ${global.batchData[index]["batchID"]}',
                                      style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor("#35408f")),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '$date',
                                      style: GoogleFonts.prompt(
                                          fontSize: 12,
                                          color: HexColor("#35408f")),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
                  }),
            ), */

            //TODO: Make this as a builder that will serves as a data, and fix the formatting
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: GridView(
                padding: EdgeInsets.all(7),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisExtent: 130,
                  mainAxisSpacing: 5.0,
                ),
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BatchDetail()));
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, bottom: 2, top: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Haggard University',
                                      style: GoogleFonts.poppins(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor("#35408f")),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: PopupMenuButton<int>(
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: Text('Archive'),
                                        value: 1,
                                      ),
                                      PopupMenuItem(
                                        child: Text('Delete'),
                                        value: 2,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, top: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Number of Applicants: 1',
                                      style: GoogleFonts.prompt(
                                          fontSize: 10,
                                          color: HexColor("#35408f")),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, top: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Submitted: 1',
                                      style: GoogleFonts.prompt(
                                          fontSize: 10,
                                          color: HexColor("#35408f")),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, top: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Did Not Submit: 0',
                                      style: GoogleFonts.prompt(
                                          fontSize: 10,
                                          color: HexColor("#35408f")),
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '$date',
                                  style: GoogleFonts.prompt(
                                      fontSize: 12, color: HexColor("#35408f")),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BatchDetail()));
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, bottom: 2, top: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Ricardo Dimagiba College',
                                      style: GoogleFonts.poppins(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor("#35408f")),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: PopupMenuButton<int>(
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        value: 1,
                                        child: Text('Archive'),
                                      ),
                                      PopupMenuItem(
                                        value: 2,
                                        child: Text('Delete'),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, top: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Number of Applicants: 1',
                                      style: GoogleFonts.prompt(
                                          fontSize: 10,
                                          color: HexColor("#35408f")),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, top: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Submitted: 1',
                                      style: GoogleFonts.prompt(
                                          fontSize: 10,
                                          color: HexColor("#35408f")),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, top: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Did Not Submit: 0',
                                      style: GoogleFonts.prompt(
                                          fontSize: 10,
                                          color: HexColor("#35408f")),
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, top: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '$date',
                                      style: GoogleFonts.prompt(
                                          fontSize: 12,
                                          color: HexColor("#35408f")),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BatchDetail()));
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              )
                            ]),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, bottom: 2, top: 10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Boracay State Academy',
                                      style: GoogleFonts.poppins(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor("#35408f")),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: PopupMenuButton<int>(
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: Text('Archive'),
                                        value: 1,
                                      ),
                                      PopupMenuItem(
                                        child: Text('Delete'),
                                        value: 2,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, top: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Number of Applicants: 1',
                                      style: GoogleFonts.prompt(
                                          fontSize: 10,
                                          color: HexColor("#35408f")),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, top: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Submitted: 1',
                                      style: GoogleFonts.prompt(
                                          fontSize: 10,
                                          color: HexColor("#35408f")),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, top: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Did Not Submit: 0',
                                      style: GoogleFonts.prompt(
                                          fontSize: 10,
                                          color: HexColor("#35408f")),
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  '$date',
                                  style: GoogleFonts.prompt(
                                      fontSize: 12, color: HexColor("#35408f")),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
