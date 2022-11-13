import 'dart:io';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:smartcheck/backend/backendpy.dart';
import 'package:smartcheck/pages/archives.dart';
import 'package:smartcheck/batch_detail.dart';
import 'package:csv/csv.dart';
import 'package:smartcheck/models/settings.dart';
import 'package:smartcheck/routes/dashboard_buttons.dart';
import 'dart:convert' show utf8;
import '../data.dart' as global;
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
    final List _children = [
    UserDashboardPage(
      title: 'Batch',
      cameras: widget.cameras,
    ),
    const Archives(),
    Settings(cameras: widget.cameras,),
  ];
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
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
              icon: Icon(Icons.dashboard), label: 'Homepage'),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archive'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
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

class UserDashboardPage extends StatefulWidget {
  final String title;
  final List<CameraDescription> cameras;
  const UserDashboardPage({Key? key, required this.title, required this.cameras}) : super(key: key);

  @override
  State<UserDashboardPage> createState() => _UserDashboardPageState();
}

class _UserDashboardPageState extends State<UserDashboardPage> {
  String date = DateFormat("MMMM dd, yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    var applicantList = [];
    return StatefulBuilder(builder: (context, setStateSB) {
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
                          buildAnswerKeyButton(context),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
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
                  InkWell(
                    onTap: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(
                              allowMultiple: false,
                              withData: true,
                              type: FileType.custom,
                              allowedExtensions: ['csv']);

                      //set to database

                      if (result != null) {
                        final input =
                            File(result.files.single.path!).openRead();
                        final fields = await input
                            .transform(utf8.decoder)
                            .transform(const CsvToListConverter())
                            .toList();
                        final fileName = result.files.first.name;
                        fields.asMap().forEach((key, value) {
                          if (key == 0) {
                            return;
                          }
                          applicantList.add({
                            fields[0][0].toString().toLowerCase(): value[0],
                            fields[0][1].toString().toLowerCase(): value[1],
                            'applicantKeyEnglish': [],
                            'applicantKeyScience': [],
                            'applicantKeyMathematics': [],
                            'applicantKeyAptitude': [],
                            'English': 0,
                            'Mathematics': 0,
                            'Science': 0,
                            'Aptitude': 0,
                            'Status': 'Not yet taken',
                            'Recommendation': []
                          });
                        });
                        var uuid = const Uuid();
                        var uniqueId = uuid.v4();
                        var now = new DateTime.now();
                        var formatter = new DateFormat('yyyy-MM-dd');
                        String formattedDate = formatter.format(now);

                        global.batchData.add({
                          '_id': uniqueId,
                          'schoolName': fileName,
                          'applicantList': applicantList,
                          'date': DateTime.now(),
                          'archive': false
                        });
                        
                        BackEndPy.addApplicantList(
                            uniqueId, fileName, applicantList, global.userLoggedIn['username'], formattedDate, false);
                      }
                      setStateSB(() {});
                    },
                    child: Container(child: Text("Add")),
                  )
                ],
              ),
              Flexible(
                flex: 5,
                fit: FlexFit.loose,
                child: GridView.count(
                  padding: const EdgeInsets.all(5.0),
                  crossAxisCount: 1,
                  childAspectRatio: 2.6,
                  crossAxisSpacing: 120,
                  children: global.batchData.map((value) {
                    if(value['archive'] != true) return Container();
                    return InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BatchDetail(batchData: value['applicants'], name: value['name'], cameras: widget.cameras,)));
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
                                        value['name'],
                                        style: GoogleFonts.poppins(
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            color: HexColor("#35408f")),
                                      ),
                                    ),
                                  ),
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
                                        'Number of Applicants:  ${value['applicants'].length}',
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
                                        'Submitted: ${value['applicants'].where((e) => e['status'] == true).length}',
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
                                        'Did Not Submit: ${value['applicants'].where((e) => e['status'] == false).length}',
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
                                padding:
                                    const EdgeInsets.only(left: 16, top: 5),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'November 20 202020202',
                                    style: GoogleFonts.prompt(
                                        fontSize: 12,
                                        color: HexColor("#35408f")),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
