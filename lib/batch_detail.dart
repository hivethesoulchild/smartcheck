import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartcheck/answer_keys/viewanswerkey.dart';
import 'package:smartcheck/pages/scanner.dart';
import 'data.dart' as global;
import 'backend/backendpy.dart';
import 'dart:async';

var data = [];

class BatchDetail extends StatefulWidget {
  final List<CameraDescription> cameras;
  final int dataIndex;
  const BatchDetail({
    Key? key,
    required this.dataIndex,
    required this.cameras,
  }) : super(key: key);

  @override
  State<BatchDetail> createState() => _BatchDetailState();
}

class _BatchDetailState extends State<BatchDetail> {
  int _currentIndex = 0;
  List<dynamic> applicants = [];
  late Timer _timer;

  Future<void> fetchData() async {
    var batchData = await BackEndPy.getAllApplicantList();

    if (batchData != null) {
      // If the server returns a 200 OK response, parse the JSON.
      setState(() {
        global.setBatchData(batchData);
        applicants = global.batchData[widget.dataIndex]["applicants"];
      });
    } else {
      // Handle errors or no response.
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  String getStatus(bool status) {
    if (status) {
      return 'Submitted.';
    } else {
      return 'Not yet taken.';
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<dynamic> showAlertDialog(BuildContext context, dynamic value) async {
      var selectedItem = '';
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return StatefulBuilder(builder: (context, setStateSB) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                contentPadding: const EdgeInsets.only(top: 10.0),
                title: Text(
                  'Scores',
                  style: GoogleFonts.poppins(),
                ),
                content: SizedBox(
                  height: 200,
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
                            children: [Text('English: ${value['English']}')],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text('Mathematics: ${value['Mathematics']}')
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [Text('Science: ${value['Science']}')],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [Text('Aptitude: ${value['Aptitude']}')],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [Text('Result: ${value['Result']}')],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            (value['status'].toString() == 'true')
                                ? "Status: Submitted"
                                : "Status: Not yet taken",
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            });
          });
    }

    return StatefulBuilder(builder: (context, setStateSB) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: HexColor('#35408f')),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            global.batchData[widget.dataIndex]["name"],
            style:
                GoogleFonts.poppins(fontSize: 18, color: HexColor('#35408f')),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: GridView.count(
              crossAxisCount: 1,
              childAspectRatio: MediaQuery.of(context).size.width / 150,
              mainAxisSpacing: 5.0,
              children: List.generate(applicants.length, (index) {
                //List.generate(global.batchData[widget.dataIndex]["applicants"].length, (index) {
                //final value = global.batchData[widget.dataIndex]["applicants"][index];
                final value = applicants[index];
                return InkWell(
                  onTap: () {
                    showAlertDialog(context, value);
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
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  value['name'],
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
                                    onSelected: (thevalue) {
                                      setState(() {
                                        if (thevalue == 1) {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewAnswerKey(
                                                englishKey: value[
                                                    'applicantKeyEnglish'],
                                                scienceKey: value[
                                                    'applicantKeyScience'],
                                                mathematicsKey: value[
                                                    'applicantKeyMathematics'],
                                                aptitudeKey: value[
                                                    'applicantKeyAptitude'],
                                              ),
                                            ),
                                          );
                                        }
                                        if (thevalue == 2) {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => ScannerPage(
                                                batchId: global.batchData[
                                                    widget.dataIndex]["_id"],
                                                id: index,
                                                cameras: widget.cameras,
                                              ),
                                            ),
                                          );
                                        }
                                      });
                                    },
                                    itemBuilder: (context) => [
                                      const PopupMenuItem(
                                        value: 1,
                                        child: Text('View'),
                                      ),
                                      const PopupMenuItem(
                                        value: 2,
                                        child: Text('Scan Paper'),
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
                                    'Applicant ID: ${value['id']}',
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: HexColor("#35408f"),
                                    ),
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
                                    (value['status'].toString() == 'true')
                                        ? "Status: Submitted"
                                        : "Status: Not yet taken",
                                    softWrap: false,
                                    overflow: TextOverflow.fade,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
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
              }),
            ),
          ),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Initial data fetch
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      fetchData(); // Fetch data every 5 seconds
    });
    applicants = global.batchData[widget.dataIndex]["applicants"];
  }
}
