import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartcheck/backend/backendpy.dart';
import 'package:smartcheck/pages/admin/user_access.dart';
import 'package:smartcheck/pages/admin/item_analysis.dart';
import 'package:smartcheck/backend/data.dart' as global;

import '../../pages/admin/answerkey.dart';

Widget buildAnalysisChartButton(BuildContext context) => InkWell(
      onTap: () async {
        global.resetAnswerKey();
        var analysis = await BackEndPy.getAnalysisData();
        var answerKey = await BackEndPy.getAnswerKey();
        // var analysisEnglish = await BackEndPy.getAnalysisDataEnglish();
        // var analysisScience = await BackEndPy.getAnalysisDataScience();
        // var analysisMath = await BackEndPy.getAnalysisDataMath();
        // var analysisAptitude = await BackEndPy.getAnalysisDataAptitude();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ItemAnalysis(
              analysisEnglish: analysis,
              analysisScience: analysis,
              analysisMath:  analysis,
              analysisAptitude: analysis,
              answerKey: answerKey
            )));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: HexColor('#35408f'),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 3),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons8_bar_chart_1.png',
                  scale: 6,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Data Visualization',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

Widget buildPrivilegedUserButton(BuildContext context) => InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const UserAccess()));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: HexColor('#35408f'),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 3),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons8_user_account.png',
                  scale: 6,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Manage Users',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

Widget buildAnswerKeyButton(BuildContext context) => InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const AnswerKeyPage()));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: HexColor('#35408f'),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 4,
                offset: const Offset(0, 3),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons8_test_1.png',
                  scale: 6,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Answer Key',
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
