import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AnswerKeyPage extends StatelessWidget {
  const AnswerKeyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: HexColor('#35408f'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0))),
          child: Text(
            'Create Answer Key',
            style: GoogleFonts.poppins(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
