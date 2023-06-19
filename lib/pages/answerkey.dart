import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:smartcheck/answer_keys/aptitude_answerkey.dart';
import 'package:smartcheck/answer_keys/english_answerkey.dart';
import 'package:smartcheck/answer_keys/math_answerkey.dart';
import 'package:smartcheck/answer_keys/science_answerkey.dart';
import 'package:smartcheck/models/create_answerkey.dart';
import '../data.dart' as global;
import '../backend/backendpy.dart';

class AnswerKeyPage extends StatelessWidget {
  const AnswerKeyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = DateFormat("MMMM dd, yyyy").format(DateTime.now());
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          child: new Icon(Icons.save),
          backgroundColor: HexColor('#35408f'),
          onPressed: () {
            BackEndPy.updateAnswerKey('1', global.answer_key);
            Fluttertoast.showToast(
                msg: "Saved!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.grey,
                textColor: Colors.white,
                fontSize: 16.0);
          },
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: HexColor('#35408f')),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Answer Key',
            style: GoogleFonts.poppins(
              color: HexColor('#35408F'),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          bottom: TabBar(
            physics: BouncingScrollPhysics(),
            labelColor: HexColor('#35408f'),
            indicatorColor: HexColor('#35408f'),
            labelStyle: GoogleFonts.poppins(
              fontSize: 15,
            ),
            unselectedLabelStyle: GoogleFonts.poppins(
              fontSize: 15,
            ),
            tabs: [
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
        backgroundColor: Colors.white,
        body: const TabBarView(
          children: [
            EnglishAnswerKey(),
            ScienceAnswerKey(),
            MathAnswerKey(),
            AptitudeAnserKey(),
          ],
        ),
      ),
    );
  }
}
