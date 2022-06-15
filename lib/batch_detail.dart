import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartcheck/dashboard.dart';

class BatchDetail extends StatelessWidget {
  final News s_new;

  const BatchDetail({Key? key, required this.s_new}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.primaries[index & 15],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Applicant ID',
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'English',
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Math',
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Science',
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Aptitude',
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Status',
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Expanded(
                            child: Text(
                              'Name',
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '0',
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '0',
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '0',
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '0',
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Recommendations',
                              softWrap: false,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      )
                    ],
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
