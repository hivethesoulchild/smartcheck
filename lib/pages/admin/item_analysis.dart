import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:smartcheck/backend/backendpy.dart';
import 'package:smartcheck/components/data_visual/aptitude_chart.dart';
import 'package:smartcheck/components/data_visual/english_analysis.dart';
import 'package:smartcheck/components/data_visual/math_analysis.dart';
import 'package:smartcheck/components/data_visual/science_analysis.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:csv/csv.dart';
import 'dart:async';

class ItemAnalysis extends StatefulWidget {
  final dynamic analysisEnglish;
  final dynamic analysisScience;
  final dynamic analysisMath;
  final dynamic analysisAptitude;
  final dynamic answerKey;

  const ItemAnalysis(
      {Key? key,
      required this.analysisEnglish,
      required this.analysisScience,
      required this.analysisMath,
      required this.analysisAptitude,
      required this.answerKey})
      : super(key: key);
  @override
  State<ItemAnalysis> createState() => _ItemAnalysisState();
}

class _ItemAnalysisState extends State<ItemAnalysis> {
  late Timer _timer;

  var analysisEnglish;
  var analysisScience;
  var analysisMath;
  var analysisAptitude;
  var answerKey;

  void showFilterDialog(BuildContext context) {
    final _startDateController = TextEditingController();
    final _endDateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Filter by Date'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _startDateController,
                  decoration: InputDecoration(
                    labelText: 'Start Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (selectedDate != null) {
                      _startDateController.text =
                          DateFormat('yyyy-MM-dd').format(selectedDate);
                    } else {
                      _startDateController.text = '';
                    }
                  },
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _endDateController,
                  decoration: InputDecoration(
                    labelText: 'End Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (selectedDate != null) {
                      _endDateController.text =
                          DateFormat('yyyy-MM-dd').format(selectedDate);
                    } else {
                      _endDateController.text =
                          ''; // or any default value you prefer
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if ((_startDateController.text.isNotEmpty ||
                        _endDateController.text.isNotEmpty) &&
                    !(_startDateController.text.isNotEmpty &&
                        _endDateController.text.isNotEmpty)) {
                  Fluttertoast.showToast(
                    msg: 'Both start and end dates must be provided.',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                  );
                } else if (_startDateController.text.isNotEmpty &&
                    _endDateController.text.isNotEmpty) {
                  _applyFilter(
                      context,
                      DateTime.parse(_startDateController.text),
                      DateTime.parse(_endDateController.text));
                  Navigator.pop(context);
                  Fluttertoast.showToast(
                    msg: 'Data has been filtered.',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                  );
                } else {
                  _resetFilter(context);
                  Navigator.pop(context);
                }
              },
              child: Text('Filter'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _resetFilter(BuildContext context) async {
    var analysis = await BackEndPy.getAnalysisData();
    var answers = await BackEndPy.getAnswerKey();

    setState(() {
      analysisEnglish = analysis;
      analysisScience = analysis;
      analysisMath = analysis;
      analysisAptitude = analysis;
      answerKey = answers;
    });
  }

  void _applyFilter(
      BuildContext context, DateTime startDate, DateTime endDate) async {
    var analysis = await BackEndPy.getFilteredAnalysisData(startDate, endDate);
    var answers = await BackEndPy.getFilteredAnswerKey(startDate);

    setState(() {
      analysisEnglish = analysis;
      analysisScience = analysis;
      analysisMath = analysis;
      analysisAptitude = analysis;
      answerKey = answers;
    });
  }

  Future<void> exportData() async {
    var status = await Permission.manageExternalStorage.status;
    if (!status.isGranted) {
      await Permission.manageExternalStorage.request();
    }

    if (status.isGranted) {
      final directory = Directory(
          '/storage/emulated/0/'); // This is the path to external storage on Android.
      final customFolder = Directory('${directory.path}SmartCheck');
      customFolder.createSync(recursive: true);

      var dataEnglish = analysisEnglish;
      var dataMath = analysisMath;
      var dataScience = analysisScience;
      var dataAptitude = analysisAptitude;

      List<List<dynamic>> rows = [
        ['English'],
        ['Item Number', 'A', 'B', 'C', 'D', 'E']
      ];

      for (int rowNumber = 0;
          rowNumber < dataEnglish['englishCount']['0'].length;
          rowNumber++) {
        rows.add([
          '${rowNumber + 1}',
          '${dataEnglish['englishCount']['0'][rowNumber]}',
          '${dataEnglish['englishCount']['1'][rowNumber]}',
          '${dataEnglish['englishCount']['2'][rowNumber]}',
          '${dataEnglish['englishCount']['3'][rowNumber]}',
          '${dataEnglish['englishCount']['4'][rowNumber]}'
        ]);
      }
      rows.add(['Mathematics']);
      rows.add(['Item Number', 'A', 'B', 'C', 'D']);
      for (int rowNumber = 0;
          rowNumber < dataMath['mathCount']['0'].length;
          rowNumber++) {
        rows.add([
          '${rowNumber + 1}',
          '${dataMath['mathCount']['0'][rowNumber]}',
          '${dataMath['mathCount']['1'][rowNumber]}',
          '${dataMath['mathCount']['2'][rowNumber]}',
          '${dataMath['mathCount']['3'][rowNumber]}'
        ]);
      }
      rows.add(['Science']);
      rows.add(['Item Number', 'A', 'B', 'C', 'D']);
      for (int rowNumber = 0;
          rowNumber < dataScience['scienceCount']['0'].length;
          rowNumber++) {
        rows.add([
          '${rowNumber + 1}',
          '${dataScience['scienceCount']['0'][rowNumber]}',
          '${dataScience['scienceCount']['1'][rowNumber]}',
          '${dataScience['scienceCount']['2'][rowNumber]}',
          '${dataScience['scienceCount']['3'][rowNumber]}'
        ]);
      }
      rows.add(['Aptitude']);
      rows.add(['Item Number', 'A', 'B', 'C', 'D']);
      for (int rowNumber = 0; rowNumber < 15; rowNumber++) {
        rows.add([
          '${rowNumber + 1}',
          '${dataAptitude['aptitudeCount']['0'][rowNumber]}',
          '${dataAptitude['aptitudeCount']['1'][rowNumber]}',
          '${dataAptitude['aptitudeCount']['2'][rowNumber]}',
          '${dataAptitude['aptitudeCount']['3'][rowNumber]}'
        ]);
      }

      String csv = const ListToCsvConverter().convert(rows);
      final file = File('${customFolder.path}/my_data.csv');

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
  void initState() {
    super.initState();
    analysisEnglish = widget.analysisEnglish;
    analysisScience = widget.analysisScience;
    analysisMath = widget.analysisMath;
    analysisAptitude = widget.analysisAptitude;
    answerKey = widget.answerKey;
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: HexColor('#35408f'),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
            backgroundColor: HexColor('#ffffff'),
            title: Text(
              'Data Visualization',
              style: GoogleFonts.poppins(
                color: HexColor('#35408F'),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () => exportData,
                  icon: Icon(
                    Icons.save_alt,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () => showFilterDialog(context),
                  icon: Icon(
                    Icons.tune,
                    color: Colors.black,
                  )),
            ],
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
          body: TabBarView(
            children: [
              EnglishAnalysis(
                analysisEnglishData: analysisEnglish,
                answerKey: answerKey,
              ),
              ScienceAnalysis(
                analysisScienceData: analysisScience,
                answerKey: answerKey,
              ),
              MathAnalysis(
                analysisMathData: analysisMath,
                answerKey: answerKey,
              ),
              AptitudeAnalysis(
                analysisAptitudeData: analysisAptitude,
                answerKey: answerKey,
              ),
            ],
          ),
        ),
      );
}
