import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:smartcheck/answerkey.dart';
import 'package:smartcheck/archives.dart';
import 'package:smartcheck/batch_detail.dart';
import 'package:csv/csv.dart';
import 'dart:convert' show utf8;
import 'data.dart' as global;

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
    const AnswerKeyPage(),
    const Archives(),
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
                      'Mathematics' : 0,
                      'Science': 0,
                      'Aptitude': 0,
                      'Status': 'Not yet taken',
                      'Recommendation': ['BSIT','BSCS']
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        backgroundColor: HexColor('#ffffff'),
        selectedItemColor: HexColor('#35408f'),
        currentIndex: _currentIndex,
        selectedLabelStyle: GoogleFonts.poppins(),
        unselectedLabelStyle: GoogleFonts.lato(),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.copy), label: 'Answer Key'),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archive'),
        ],
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
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
                        child:Container(
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
                                        fontSize: 12, color: HexColor("#35408f")),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
