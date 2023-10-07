import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartcheck/charts/aptitude_chart.dart';
import 'package:smartcheck/charts/english_analysis.dart';
import 'package:smartcheck/charts/math_analysis.dart';
import 'package:smartcheck/charts/science_analysis.dart';
import 'package:smartcheck/routes/analysis_per_subject_button.dart';

class ItemAnalysis extends StatefulWidget {
  const ItemAnalysis({Key? key}) : super(key: key);

  @override
  State<ItemAnalysis> createState() => _ItemAnalysisState();
}

class _ItemAnalysisState extends State<ItemAnalysis> {
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
                      onTap: (() {}),
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
