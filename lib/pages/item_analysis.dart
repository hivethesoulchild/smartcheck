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

Future<void> exportData() async {
  // Get the document directory
  final directory = await getApplicationDocumentsDirectory();

  // Define the file path where you want to save your exported data
  final filePath = '${directory.path}/exported_data.txt';

  // Implement your export logic here
  // For example, you can write data to the file using the File class:
  final file = File(filePath);
  await file.writeAsString('Your exported data goes here.');

  // Show a toast message to confirm the export
  Fluttertoast.showToast(
    msg: 'Data exported successfully!',
    toastLength: Toast.LENGTH_SHORT, // You can customize the duration
    gravity: ToastGravity.BOTTOM, // You can customize the position
    backgroundColor: Colors.green, // You can customize the background color
    textColor: Colors.white, // You can customize the text color
  );
}

class ItemAnalysis extends StatefulWidget {
  const ItemAnalysis({Key? key}) : super(key: key);

  @override
  State<ItemAnalysis> createState() => _ItemAnalysisState();
}

class _ItemAnalysisState extends State<ItemAnalysis> {
  void exportData() {
    // add logic here
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
            )),
      );
}
