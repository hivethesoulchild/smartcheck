import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';


var data = [
  {
    "id" : "0123",
    "name": "Royce",
    "status": "taken",
    "english": "0",
    "science": "0",
    "mathematics": "0",
    "aptitude": "0",
    "Recommendations": ["BSIT", "BSCS"]
  },
  {
    "id" : "012213",
    "name": "chris",
    "status": "taken",
    "english": "0",
    "science": "0",
    "mathematics": "0",
    "aptitude": "0",
    "Recommendations": ["BSIT", "BSCS"]
  },
  {
    "id" : "01233",
    "name": "abante",
    "status": "taken",
    "english": "0",
    "science": "0",
    "mathematics": "0",
    "aptitude": "0",
    "Recommendations": ["BSIT", "BSCS"]
  },
  {
    "id" : "014123",
    "name": "Royce",
    "status": "taken",
    "english": "0",
    "science": "0",
    "mathematics": "0",
    "aptitude": "0",
    "Recommendations": ["BSIT", "BSCS"]
  },
];

class ApplicantBuilder extends StatelessWidget {
  const ApplicantBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    showAlertDialog(BuildContext context) {
      AlertDialog alert = AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        contentPadding: const EdgeInsets.only(top: 10.0),
        title: Text(
          'Scores',
          style: GoogleFonts.poppins(),
        ),
        content: SizedBox(
          height: 300,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [Text('English: 17')],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [Text('Mathematics: 15')],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [Text('Science: 13')],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [Text('Aptitude: 10')],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Status: Submitted',
                    style: GoogleFonts.poppins(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Recommendations: BS Information technology',
                    style: GoogleFonts.poppins(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }

    return InkWell(
      onTap: () {
        showAlertDialog(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 3,
                  offset: const Offset(2, 3),
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Allisandra Bendijo III',
                      softWrap: false,
                      overflow: TextOverflow.fade,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: HexColor("#35408f"),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        PopupMenuButton<int>(
                          itemBuilder: (context) => [
                            const PopupMenuItem(
                              child: Text('Details'),
                            ),
                          ],
                        );
                      },
                      child: PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: const Text('Edit'),
                            onTap: () {},
                          ),
                          PopupMenuItem(
                            child: const Text('Delete'),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Applicant ID: 001',
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: HexColor("#35408f")),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Did not take yet",
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//TODO: Need mo nalang ayusin yung scores, name, applicantID and status either passed, failed or did not take yet
