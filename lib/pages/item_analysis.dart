import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:smartcheck/backend/backendpy.dart';
import 'package:smartcheck/charts/aptitude_chart.dart';
import 'package:smartcheck/charts/english_analysis.dart';
import 'package:smartcheck/charts/math_analysis.dart';
import 'package:smartcheck/charts/science_analysis.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartcheck/data.dart' as global;
import 'package:permission_handler/permission_handler.dart';
import 'package:csv/csv.dart';
import 'dart:async';

class ItemAnalysis extends StatefulWidget {
  final dynamic analysisEnglish;
  final dynamic analysisScience;
  final dynamic analysisMath;
  final dynamic analysisAptitude;

  const ItemAnalysis(
      {Key? key,
      required this.analysisEnglish,
      required this.analysisScience,
      required this.analysisMath,
      required this.analysisAptitude})
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
                    }
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Apply filtering logic based on start and end dates
                // (Ex: retrieve data within the selected date range)
                _applyFilter(context, DateTime.parse(_startDateController.text),
                    DateTime.parse(_endDateController.text));
                Navigator.pop(context);
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

  void _applyFilter(
      BuildContext context, DateTime startDate, DateTime endDate) async {
    var englishFiltered =
        await BackEndPy.getFilteredAnalysisDataEnglish(startDate, endDate);
    var scienceFiltered =
        await BackEndPy.getFilteredAnalysisDataScience(startDate, endDate);
    var mathFiltered =
        await BackEndPy.getFilteredAnalysisDataMath(startDate, endDate);
    var aptitudeFiltered =
        await BackEndPy.getFilteredAnalysisDataAptitude(startDate, endDate);

    setState(() {
      analysisEnglish = englishFiltered;
      analysisScience = scienceFiltered;
      analysisMath = mathFiltered;
      analysisAptitude = aptitudeFiltered;
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

      var dataEnglish = global.analysisEnglishData;
      var dataMath = global.analysisMathData;
      var dataScience = global.analysisScienceData;
      var dataAptitude = global.analysisAptitudeData;

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

  // Future<void> fetchData() async {
  //   var batchData = await BackEndPy.getAllApplicantList();

  //   if (batchData != null) {
  //     // If the server returns a 200 OK response, parse the JSON.
  //     setState(() {
  //       global.setBatchData(batchData);
  //       applicants = global.batchData[widget.dataIndex]["applicants"];
  //     });
  //   } else {
  //     // Handle errors or no response.
  //   }
  // }
  @override
  void initState() {
    super.initState();
    analysisEnglish = widget.analysisEnglish;
    analysisScience = widget.analysisScience;
    analysisMath = widget.analysisMath;
    analysisAptitude = widget.analysisAptitude;
  }

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  //   print('disposed');
  // }

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
              'Item Analysis',
              style: GoogleFonts.poppins(
                color: HexColor('#35408F'),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () => exportData, icon: Icon(Icons.save_alt)),
              IconButton(
                  onPressed: () => showFilterDialog(context),
                  icon: Icon(Icons.tune)),
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
              EnglishAnalysis(analysisEnglishData: analysisEnglish),
              ScienceAnalysis(analysisScienceData: analysisScience),
              MathAnalysis(analysisMathData: analysisMath),
              AptitudeAnalysis(
                analysisAptitudeData: analysisAptitude,
              ),
            ],
          ),
        ),
      );
}
