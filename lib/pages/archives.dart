import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:smartcheck/pages/batch_detail_archive.dart';
import '../backend/backendpy.dart';
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: GridView.builder(
                padding: const EdgeInsets.all(5.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      MediaQuery.of(context).size.width < 600 ? 1 : 2,
                  childAspectRatio:
                      MediaQuery.of(context).size.width < 600 ? 3.0 : 2.6,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                ),
                itemCount: global.batchDataArchive.length,
                itemBuilder: (context, index) {
                  final value = global.batchDataArchive[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BatchDetailArchive(
                            batchData: value['applicants'],
                            name: value['name'],
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12,
                                    bottom: 2,
                                    top: 10,
                                  ),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      value['name'],
                                      style: GoogleFonts.poppins(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#35408f"),
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: PopupMenuButton<int>(
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        value: 1,
                                        onTap: () {
                                          BackEndPy.editApplicantList(
                                              value['_id'], false);
                                          global.batchData.add(value);
                                          global.batchDataArchive.removeWhere(
                                              (item) =>
                                                  item['_id'] == value['_id']);
                                          setState(() {});
                                        },
                                        child: const Text('Unarchive'),
                                      ),
                                      PopupMenuItem(
                                        value: 2,
                                        onTap: () {
                                          BackEndPy.deleteApplicantList(
                                              value['_id']);
                                          global.batchDataArchive.removeWhere((item) =>
                                              item['_id'] == value['_id']);
                                          setState(() {});
                                        },
                                        child: const Text('Delete'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, top: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Number of Applicants: ${value['applicants'].length}',
                                      style: GoogleFonts.prompt(
                                        fontSize: 10,
                                        color: HexColor("#35408f"),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, top: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Submitted: ${value['applicants'].where((e) => e['status'] == true).length}',
                                      style: GoogleFonts.prompt(
                                        fontSize: 10,
                                        color: HexColor("#35408f"),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, top: 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Did Not Submit: ${value['applicants'].where((e) => e['status'] == false).length}',
                                      style: GoogleFonts.prompt(
                                        fontSize: 10,
                                        color: HexColor("#35408f"),
                                      ),
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16, top: 5),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  value['date'],
                                  style: GoogleFonts.prompt(
                                    fontSize: 12,
                                    color: HexColor("#35408f"),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
