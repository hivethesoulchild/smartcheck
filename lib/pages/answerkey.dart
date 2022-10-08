import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:smartcheck/models/create_answerkey.dart';

class AnswerKeyPage extends StatelessWidget {
  const AnswerKeyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = DateFormat("MMMM dd, yyyy").format(DateTime.now());
    return Scaffold(
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
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateAnswerKey()));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: HexColor('#35408f'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0))),
                  child: Text(
                    'Create Answer Key',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, bottom: 2, top: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Answer Key 1',
                          style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: HexColor("#35408f")),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '$date',
                          style: GoogleFonts.prompt(
                              fontSize: 12, color: HexColor("#35408f")),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
