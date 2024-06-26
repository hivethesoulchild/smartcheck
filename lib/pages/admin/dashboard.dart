import 'dart:io';

import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smartcheck/pages/archives.dart';
import 'package:smartcheck/pages/batch_detail.dart';
import 'package:csv/csv.dart';
import 'package:smartcheck/pages/settings.dart';
import 'dart:convert' show utf8;
import '../../backend/data.dart' as global;
import '../../components/dashboard/dashboard_buttons.dart';
import '../../backend/backendpy.dart';
import 'package:uuid/uuid.dart';

class Dashboard extends StatefulWidget {
  final List<CameraDescription> cameras;
  const Dashboard({Key? key, required this.cameras}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> exportData() async {
    var status = await Permission.manageExternalStorage.status;
    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    }

    if (status.isGranted) {
      // final directory =
      //     await getExternalStorageDirectory(); // This is the path to external storage on Android.
      // final customFolder = Directory('${directory?.path}SmartCheck');
      // customFolder.createSync(recursive: true);

      final directory = Directory(
          '/storage/emulated/0/'); // This is the path to external storage on Android.
      final customFolder = Directory('${directory.path}SmartCheck');
      customFolder.createSync(recursive: true);

      var analysis = await BackEndPy.getAnalysisData();

      // var dataEnglish = global.analysisEnglishData;
      // var dataMath = global.analysisMathData;
      // var dataScience = global.analysisScienceData;
      // var dataAptitude = global.analysisAptitudeData;

      List<List<dynamic>> rows = [
        ['English'],
        ['Item Number', 'A', 'B', 'C', 'D', 'E']
      ];

      for (int rowNumber = 0;
          rowNumber < analysis['englishCount']['0'].length;
          rowNumber++) {
        rows.add([
          '${rowNumber + 1}',
          '${analysis['englishCount']['0'][rowNumber]}',
          '${analysis['englishCount']['1'][rowNumber]}',
          '${analysis['englishCount']['2'][rowNumber]}',
          '${analysis['englishCount']['3'][rowNumber]}',
          '${analysis['englishCount']['4'][rowNumber]}'
        ]);
      }
      rows.add(['Mathematics']);
      rows.add(['Item Number', 'A', 'B', 'C', 'D']);
      for (int rowNumber = 0;
          rowNumber < analysis['mathCount']['0'].length;
          rowNumber++) {
        rows.add([
          '${rowNumber + 1}',
          '${analysis['mathCount']['0'][rowNumber]}',
          '${analysis['mathCount']['1'][rowNumber]}',
          '${analysis['mathCount']['2'][rowNumber]}',
          '${analysis['mathCount']['3'][rowNumber]}'
        ]);
      }
      rows.add(['Science']);
      rows.add(['Item Number', 'A', 'B', 'C', 'D']);
      for (int rowNumber = 0;
          rowNumber < analysis['scienceCount']['0'].length;
          rowNumber++) {
        rows.add([
          '${rowNumber + 1}',
          '${analysis['scienceCount']['0'][rowNumber]}',
          '${analysis['scienceCount']['1'][rowNumber]}',
          '${analysis['scienceCount']['2'][rowNumber]}',
          '${analysis['scienceCount']['3'][rowNumber]}'
        ]);
      }
      rows.add(['Aptitude']);
      rows.add(['Item Number', 'A', 'B', 'C', 'D']);
      for (int rowNumber = 0; rowNumber < 15; rowNumber++) {
        rows.add([
          '${rowNumber + 1}',
          '${analysis['aptitudeCount']['0'][rowNumber]}',
          '${analysis['aptitudeCount']['1'][rowNumber]}',
          '${analysis['aptitudeCount']['2'][rowNumber]}',
          '${analysis['aptitudeCount']['3'][rowNumber]}'
        ]);
      }

      String csv = const ListToCsvConverter().convert(rows);
      final file = File('${customFolder}/my_data.csv');

      try {
        await file.writeAsString(csv);
        Fluttertoast.showToast(
          msg: 'Data exported successfully! $file',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      } catch (e) {
        Fluttertoast.showToast(
          msg: 'Error exporting data: $e',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
      }

      // Show a toast message to confirm the export
      // Fluttertoast.showToast(
      //   msg: 'Data exported successfully! $file',
      //   toastLength: Toast.LENGTH_SHORT, // You can customize the duration
      //   gravity: ToastGravity.BOTTOM, // You can customize the position
      //   backgroundColor: Colors.green, // You can customize the background color
      //   textColor: Colors.white, // You can customize the text color
      // );
    } else {
      // Handle denied or restricted permissions.
      Fluttertoast.showToast(
        msg: 'Permission denied to access storage',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var applicantList = [];
    final List children = [
      DashboardPage(cameras: widget.cameras),
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

class DashboardPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const DashboardPage({Key? key, required this.cameras}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  Widget buildText(String text, double fontSize,
      {TextOverflow? overflow, bool softWrap = true}) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: GoogleFonts.prompt(
            fontSize: fontSize,
            color: HexColor("#35408f"),
          ),
          overflow: overflow,
          softWrap: softWrap,
        ),
      ),
    );
  }

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
                    Expanded(
                      flex: 0,
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
                        ],
                      ),
                    ),
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
                                  if (value.length >= 2) {
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
                                  }
                                });
                                var uuid = const Uuid();
                                var uniqueId = uuid.v4();
                                var now = DateTime.now();
                                var formatter = DateFormat('yyyy-MM-dd');
                                String formattedDate = formatter.format(now);

                                var response = await BackEndPy.addApplicantList(
                                  uniqueId,
                                  fileName,
                                  applicantList,
                                  global.username,
                                  formattedDate,
                                  false,
                                );
                                if (response['duplicate']) {
                                  Fluttertoast.showToast(
                                    msg:
                                        'Failed to add due to duplicate entries',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                  );
                                } else {
                                  global.batchData.add({
                                    '_id': uniqueId,
                                    'name': fileName,
                                    'archive': false,
                                    'applicants': applicantList,
                                    'date': formattedDate,
                                    'proctor': global.username,
                                  });
                                  Fluttertoast.showToast(
                                      msg: 'Added successfully!',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white);
                                }
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
                              MediaQuery.of(context).size.width <= 480
                                  ? MediaQuery.of(context).size.width * 0.5
                                  : MediaQuery.of(context).size.width * 0.32,
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
                            child: Stack(
                              children: [
                                Padding(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                  global.batchData[index]
                                                      ['name'],
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                    color: HexColor("#35408f"),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: PopupMenuButton<int>(
                                                itemBuilder: (context) => [
                                                  PopupMenuItem(
                                                    value: 1,
                                                    onTap: () {
                                                      BackEndPy
                                                          .editApplicantList(
                                                              global.batchData[
                                                                  index]['_id'],
                                                              true);
                                                      global.batchDataArchive
                                                          .add(global.batchData[
                                                              index]);
                                                      global.batchData
                                                          .removeWhere((item) =>
                                                              item['_id'] ==
                                                              global.batchData[
                                                                      index]
                                                                  ['_id']);
                                                      setState(() {});
                                                    },
                                                    child:
                                                        const Text('Archive'),
                                                  ),
                                                  PopupMenuItem(
                                                    value: 2,
                                                    onTap: () {
                                                      BackEndPy
                                                          .deleteApplicantList(
                                                              global.batchData[
                                                                      index]
                                                                  ['_id']);
                                                      global.batchData
                                                          .removeWhere((item) =>
                                                              item['_id'] ==
                                                              global.batchData[
                                                                      index]
                                                                  ['_id']);
                                                      setState(() {});
                                                    },
                                                    child: const Text('Delete'),
                                                  ),
                                                  PopupMenuItem(
                                                    value: 3,
                                                    onTap: (() async {
                                                      var status = await Permission
                                                          .manageExternalStorage
                                                          .status;
                                                      if (!status.isGranted) {
                                                        await Permission
                                                            .manageExternalStorage
                                                            .request();
                                                      }

                                                      if (status.isGranted) {
                                                        // final directory =
                                                        //     await getExternalStorageDirectory(); // This is the path to external storage on Android.
                                                        // final customFolder = Directory('${directory?.path}SmartCheck');
                                                        // customFolder.createSync(recursive: true);

                                                        final directory = Directory(
                                                            '/storage/emulated/0/');
                                                        final customFolder =
                                                            Directory(
                                                                '${directory.path}SmartCheck');
                                                        customFolder.createSync(
                                                            recursive: true);

                                                        var data = await BackEndPy
                                                            .getBatchData(global
                                                                    .batchData[
                                                                index]['_id']);

                                                        var dataEnglish = data[
                                                            "englishCount"];
                                                        var dataMath =
                                                            data["mathCount"];
                                                        var dataScience = data[
                                                            "scienceCount"];
                                                        var dataAptitude = data[
                                                            "aptitudeCount"];
                                                        var applicants =
                                                            data["applicants"];

                                                        List<List<dynamic>>
                                                            rows = [
                                                          ['English'],
                                                          [
                                                            'Item Number',
                                                            'A',
                                                            'B',
                                                            'C',
                                                            'D',
                                                            'E',
                                                            "void"
                                                          ]
                                                        ];

                                                        for (int rowNumber = 0;
                                                            rowNumber <
                                                                dataEnglish['0']
                                                                    .length;
                                                            rowNumber++) {
                                                          rows.add([
                                                            '${rowNumber + 1}',
                                                            '${dataEnglish['0'][rowNumber]}',
                                                            '${dataEnglish['1'][rowNumber]}',
                                                            '${dataEnglish['2'][rowNumber]}',
                                                            '${dataEnglish['3'][rowNumber]}',
                                                            '${dataEnglish['4'][rowNumber]}',
                                                            '${dataEnglish['5'][rowNumber]}'
                                                          ]);
                                                        }
                                                        rows.add(
                                                            ['Mathematics']);
                                                        rows.add([
                                                          'Item Number',
                                                          'A',
                                                          'B',
                                                          'C',
                                                          'D',
                                                          'void'
                                                        ]);
                                                        for (int rowNumber = 0;
                                                            rowNumber <
                                                                dataMath['0']
                                                                    .length;
                                                            rowNumber++) {
                                                          rows.add([
                                                            '${rowNumber + 1}',
                                                            '${dataMath['0'][rowNumber]}',
                                                            '${dataMath['1'][rowNumber]}',
                                                            '${dataMath['2'][rowNumber]}',
                                                            '${dataMath['3'][rowNumber]}',
                                                            '${dataMath['4'][rowNumber]}'
                                                          ]);
                                                        }
                                                        rows.add(['Science']);
                                                        rows.add([
                                                          'Item Number',
                                                          'A',
                                                          'B',
                                                          'C',
                                                          'D',
                                                          'void'
                                                        ]);
                                                        for (int rowNumber = 0;
                                                            rowNumber <
                                                                dataScience['0']
                                                                    .length;
                                                            rowNumber++) {
                                                          rows.add([
                                                            '${rowNumber + 1}',
                                                            '${dataScience['0'][rowNumber]}',
                                                            '${dataScience['1'][rowNumber]}',
                                                            '${dataScience['2'][rowNumber]}',
                                                            '${dataScience['3'][rowNumber]}',
                                                            '${dataScience['4'][rowNumber]}'
                                                          ]);
                                                        }
                                                        rows.add(['Aptitude']);
                                                        rows.add([
                                                          'Item Number',
                                                          'A',
                                                          'B',
                                                          'C',
                                                          'D',
                                                          'void'
                                                        ]);
                                                        for (int rowNumber = 0;
                                                            rowNumber < 15;
                                                            rowNumber++) {
                                                          rows.add([
                                                            '${rowNumber + 1}',
                                                            '${dataAptitude['0'][rowNumber]}',
                                                            '${dataAptitude['1'][rowNumber]}',
                                                            '${dataAptitude['2'][rowNumber]}',
                                                            '${dataAptitude['3'][rowNumber]}',
                                                            '${dataAptitude['4'][rowNumber]}'
                                                          ]);
                                                        }

                                                        List<List<dynamic>>
                                                            applicantResult = [
                                                          [
                                                            'id',
                                                            'name',
                                                            'English',
                                                            'Mathematics',
                                                            'Science',
                                                            'Aptitude'
                                                          ]
                                                        ];

                                                        for (var applicant
                                                            in applicants) {
                                                          applicantResult.add([
                                                            applicant['id'],
                                                            applicant['name'],
                                                            applicant[
                                                                'English'],
                                                            applicant[
                                                                'Mathematics'],
                                                            applicant[
                                                                'Science'],
                                                            applicant[
                                                                'Aptitude'],
                                                          ]);
                                                        }

                                                        String csv =
                                                            const ListToCsvConverter()
                                                                .convert(rows);

                                                        csv += '\n\n';

                                                        csv += const ListToCsvConverter()
                                                            .convert(
                                                                applicantResult);
                                                        final file = File(
                                                            '${directory.path}/${data["name"]}.csv');

                                                        try {
                                                          await file
                                                              .writeAsString(
                                                                  csv);
                                                          Fluttertoast
                                                              .showToast(
                                                            msg:
                                                                'Data exported successfully! $file',
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity:
                                                                ToastGravity
                                                                    .BOTTOM,
                                                            backgroundColor:
                                                                Colors.green,
                                                            textColor:
                                                                Colors.white,
                                                          );
                                                        } catch (e) {
                                                          Fluttertoast
                                                              .showToast(
                                                            msg:
                                                                'Error exporting data: $e',
                                                            toastLength: Toast
                                                                .LENGTH_SHORT,
                                                            gravity:
                                                                ToastGravity
                                                                    .BOTTOM,
                                                            backgroundColor:
                                                                Colors.red,
                                                            textColor:
                                                                Colors.white,
                                                          );
                                                        }
                                                      } else {
                                                        // Handle denied or restricted permissions.
                                                        Fluttertoast.showToast(
                                                          msg:
                                                              'Permission denied to access storage',
                                                          toastLength: Toast
                                                              .LENGTH_SHORT,
                                                          gravity: ToastGravity
                                                              .BOTTOM,
                                                          backgroundColor:
                                                              Colors.red,
                                                          textColor:
                                                              Colors.white,
                                                        );
                                                      }
                                                    }),
                                                    child: const Text(
                                                        'Export Data'),
                                                  ),
                                                ],
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        LayoutBuilder(
                                          builder: (BuildContext context,
                                              BoxConstraints constraints) {
                                            if (constraints.maxWidth < 360) {
                                              // For smaller screens, use Wrap
                                              return Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.start,
                                                children: [
                                                  buildText(
                                                      'Number of Applicants: ${global.batchData[index]['applicants'].length}',
                                                      12),
                                                  buildText(
                                                      'Submitted: ${global.batchData[index]['applicants'].where((e) => e['status'] == true).length}',
                                                      12),
                                                  buildText(
                                                      'Did Not Submit: ${global.batchData[index]['applicants'].where((e) => e['status'] == false).length}',
                                                      12,
                                                      overflow:
                                                          TextOverflow.fade,
                                                      softWrap: false),
                                                ],
                                              );
                                            } else {
                                              // For larger screens, use Row
                                              return Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  buildText(
                                                      'Number of Applicants: ${global.batchData[index]['applicants'].length}',
                                                      10),
                                                  buildText(
                                                      'Submitted: ${global.batchData[index]['applicants'].where((e) => e['status'] == true).length}',
                                                      10),
                                                  buildText(
                                                      'Did Not Submit: ${global.batchData[index]['applicants'].where((e) => e['status'] == false).length}',
                                                      10,
                                                      overflow:
                                                          TextOverflow.fade,
                                                      softWrap: false),
                                                ],
                                              );
                                            }
                                          },
                                        ),
                                        Align(
                                          alignment: Alignment.bottomLeft,
                                          child: buildText(
                                              '${global.batchData[index]['proctor']}',
                                              12),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: buildText(
                                                '${global.batchData[index]['date']}',
                                                12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
