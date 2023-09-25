import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartcheck/answer_keys/viewanswerkey.dart';


class BatchDetailArchive extends StatefulWidget {
  final List batchData;
  final String name;
  const BatchDetailArchive({super.key, required this.batchData, required this.name});

  @override
  State<BatchDetailArchive> createState() => _BatchDetailArchiveState();
}

class _BatchDetailArchiveState extends State<BatchDetailArchive> {
  @override
  int _currentIndex = 0;

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
                  height: 300,
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
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            (value['status'].toString() == 'true')
                                ? "Status: Submitted"
                                : "Status: Not yet taken",
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Recommendations: ${value['Recommendation']}',
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

    return StatefulBuilder(
      builder: (context, setStateSB) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: HexColor('#35408f')),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
            title: Text(
              widget.name,
              style: GoogleFonts.poppins(fontSize: 18, color: HexColor('#35408f')),
            ),
            backgroundColor: Colors.white,
            actions: [
              PopupMenuButton(
                icon: const Icon(
                  Icons.sort,
                  color: Colors.grey,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const Text("Sort by name"),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: const Text("Sort by number"),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: const Text("Sort by status"),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
          /*  body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ListView.builder(
                    itemCount: global.batchData[i]['applicantList'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          showDataAlert(i, index);
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
                                    offset: Offset(2, 3),
                                  )
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Applicant ID: ${global.batchData[i]['applicantList'][index]['id']}',
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                          style: GoogleFonts.poppins(
                                              fontSize: 14, color: HexColor("#35408f")),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${global.batchData[i]['applicantList'][index]['name']}',
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                          style: GoogleFonts.poppins(
                                              fontSize: 20, color: HexColor("#35408f")),
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
              ), */
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: GridView.count(
                crossAxisCount: 1,
                childAspectRatio: 3,
                mainAxisSpacing: 5.0,
                children: widget.batchData.map((value) {
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
                            ]),
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
                                      onSelected:  (thevalue) {
                                        setStateSB(() {
                                          if (thevalue == 1){
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewAnswerKey(englishKey: value['applicantKeyEnglish'],scienceKey: value['applicantKeyScience'], mathematicsKey: value['applicantKeyMathematics'],aptitudeKey: value['applicantKeyAptitude']),
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
                                        // PopupMenuItem(
                                        //   value: 2,
                                        //   child: Text('Delete'),
                                        //   onTap: () {},
                                        // ),
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
                                      (value['status'].toString() == 'true')
                                          ? "Status: Submitted"
                                          : "Status: Not yet taken",
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
                }).toList(),
              ),
            ),
          ),
        );
      }
    );
  }
}