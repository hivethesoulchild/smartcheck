import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartcheck/dashboard.dart';

class BatchDetail extends StatelessWidget {
  final News s_new;

  const BatchDetail({Key? key, required this.s_new}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    showDataAlert() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              contentPadding: EdgeInsets.only(top: 10.0),
              title: Text(
                'Scores',
                style: GoogleFonts.poppins(),
              ),
              content: Container(
                height: 500,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [Text('English 0')],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [Text('Math 0')],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [Text('Science 0')],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [Text('Aptitude 0')],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Status', style: GoogleFonts.poppins(),),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Recommendations', style: GoogleFonts.poppins(),),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          this.s_new.title,
          style: GoogleFonts.poppins(fontSize: 18, color: HexColor('#35408f')),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ListView.builder(
            itemCount: 150,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  showDataAlert();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.primaries[index & 15],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Applicant ID',
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  style: GoogleFonts.poppins(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Name',
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                  style: GoogleFonts.poppins(fontSize: 20),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
