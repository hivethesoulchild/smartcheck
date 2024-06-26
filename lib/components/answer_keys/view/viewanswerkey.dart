import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartcheck/components/answer_keys/view/view_aptitude_answerkey.dart';
import 'package:smartcheck/components/answer_keys/view/view_english_answerkey.dart';
import 'package:smartcheck/components/answer_keys/view/view_math_answerkey.dart';
import 'package:smartcheck/components/answer_keys/view/view_science_answerkey.dart';

class ViewAnswerKey extends StatefulWidget {
  final dynamic englishKey;
  final List scienceKey;
  final List mathematicsKey;
  final List aptitudeKey;

  const ViewAnswerKey({super.key, required this.englishKey, required this.scienceKey, required this.mathematicsKey, required this.aptitudeKey});

  @override
  State<ViewAnswerKey> createState() => _ViewAnswerKeyState();
}

class _ViewAnswerKeyState extends State<ViewAnswerKey> {
  



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: HexColor('#35408f')),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'View Answer Key',
            style: GoogleFonts.nunito(
              color: HexColor('#35408F'),
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
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
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [
            ViewEnglishAnswerKey(answerKey: widget.englishKey),
            ViewScienceAnswerKey(answerKey: widget.scienceKey),
            ViewMathAnswerKey(answerKey: widget.mathematicsKey),
            ViewAptitudeAnswerKey(answerKey: widget.aptitudeKey),
          ],
        ),
      ),
    );
  }
}