import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartcheck/pages/scanner.dart';
import 'package:smartcheck/routes/applicant_dialog.dart';
import 'data.dart' as global;

class BatchDetail extends StatefulWidget {
  //final int i;

  const BatchDetail({
    Key? key,
  }) : super(key: key);

  @override
  State<BatchDetail> createState() => _BatchDetailState();
}

class _BatchDetailState extends State<BatchDetail> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    showDataAlert(int batchIndex, int applicantIndex) {
      var recommendations = global.batchData[batchIndex]['applicantList']
          [applicantIndex]['Recommendation'];
      if (recommendations == null) {
        recommendations = '';
      } else {
        recommendations = recommendations.join(',');
      }
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
            content: SizedBox(
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
                        children: [
                          Text(
                              'English: ${global.batchData[batchIndex]['applicantList'][applicantIndex]['English']}')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                              'Mathematics: ${global.batchData[batchIndex]['applicantList'][applicantIndex]['Mathematics']}')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                              'Science: ${global.batchData[batchIndex]['applicantList'][applicantIndex]['Science']}')
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                              'Aptitude: ${global.batchData[batchIndex]['applicantList'][applicantIndex]['Aptitude']}')
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Status: ${global.batchData[batchIndex]['applicantList'][applicantIndex]['Status']}',
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Recommendations: $recommendations',
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
        backgroundColor: HexColor('#35408f'),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ScannerPage(),
            ),
          );
        },
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: HexColor('#35408f')),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'Lorem Ipsum College',
          style: GoogleFonts.poppins(fontSize: 18, color: HexColor('#35408f')),
        ),
        backgroundColor: Colors.white,
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.sort, color: Colors.grey,),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Sort by name"),
                onTap: () {},
              ),
              PopupMenuItem(
                child: Text("Sort by number"),
                onTap: () {},
              ),
              PopupMenuItem(
                child: Text("Sort by status"),
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
          //TODO: Convert to ListView.builder in order to make data
          child: ListView(
            children: [
              ApplicantBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
