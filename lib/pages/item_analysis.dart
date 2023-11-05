import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartcheck/charts/aptitude_chart.dart';
import 'package:smartcheck/charts/english_analysis.dart';
import 'package:smartcheck/charts/math_analysis.dart';
import 'package:smartcheck/charts/science_analysis.dart';
import 'package:smartcheck/routes/analysis_per_subject_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smartcheck/data.dart' as global;
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';
import 'package:csv/csv.dart';

class ItemAnalysis extends StatefulWidget {
  const ItemAnalysis({Key? key}) : super(key: key);
  @override
  State<ItemAnalysis> createState() => _ItemAnalysisState();
}

class _ItemAnalysisState extends State<ItemAnalysis> {
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
      final file = File('${directory.path}/my_data.csv');

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
  void initState() {
    super.initState();
    global.setAnalysistData();
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
              'Item Analysis',
              style: GoogleFonts.poppins(
                color: HexColor('#35408F'),
              ),
            ),
            actions: [
              PopupMenuButton(
                icon: Icon(
                  Icons.more_vert,
                  color: HexColor('#35408F'),
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: exportData,
                    value: 1,
                    child: const Text('Export'),
                  )
                ],
              )
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
          body: const TabBarView(
            children: [
              EnglishAnalysis(),
              ScienceAnalysis(),
              MathAnalysis(),
              AptitudeAnalysis(),
            ],
          ),
        ),
      );
}
