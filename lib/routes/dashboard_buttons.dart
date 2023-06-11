import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartcheck/pages/scanner.dart';
import 'package:smartcheck/pages/user_access.dart';
import 'package:smartcheck/pages/item_analysis.dart';

import '../pages/answerkey.dart';
import '../models/charts.dart';
import '../pages/answerkey.dart';

Widget buildAnalysisChartButton(BuildContext context) => InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ItemAnalysis()));
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
                offset: Offset(0, 3),
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
                  scale: 5,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Analysis Chart',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
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
            .push(MaterialPageRoute(builder: (context) => UserAccess()));
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
                offset: Offset(0, 3),
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
                  scale: 5,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Manage Users' ,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
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
            context, MaterialPageRoute(builder: (context) => AnswerKeyPage()));
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
                offset: Offset(0, 3),
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
                  scale: 5,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Answer Key',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
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