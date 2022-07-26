import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import '../batch_detail.dart';
import '../data.dart' as global;

class Archives extends StatefulWidget {
  const Archives({Key? key}) : super(key: key);

  @override
  State<Archives> createState() => _ArchivesState();
}

class _ArchivesState extends State<Archives> {
  String date = DateFormat("MMMM dd, yyyy").format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              fit: FlexFit.loose,
              child: GridView.builder(
                  padding: const EdgeInsets.all(5.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 150,
                  ),
                  itemCount: global.batchData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        BatchDetail()));
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
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
                                ]),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Batch ${global
                                          .batchData[index]["batchID"]}',
                                      style: GoogleFonts.poppins(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor("#35408f")),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '$date',
                                      style: GoogleFonts.prompt(
                                          fontSize: 12,
                                          color: HexColor("#35408f")),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
