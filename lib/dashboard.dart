import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:smartcheck/answerkey.dart';
import 'package:smartcheck/archives.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  final List _children = [
    DashboardPage(),
    AnswerKeyPage(),
    Archives(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: HexColor('#ffffff'),
        title: Row(
          children: [
            Text(
              'Smart',
              style:
                  GoogleFonts.poppins(fontSize: 24, color: HexColor('#35408f')),
            ),
            Text(
              'Check',
              style:
                  GoogleFonts.poppins(fontSize: 24, color: HexColor('#CAB358')),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            color: HexColor('#35408f'),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            color: HexColor('#35408f'),
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        backgroundColor: HexColor('#ffffff'),
        selectedItemColor: HexColor('#35408f'),
        currentIndex: _currentIndex,
        selectedLabelStyle: GoogleFonts.poppins(),
        unselectedLabelStyle: GoogleFonts.lato(),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.copy), label: 'Answer Key'),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archive'),
        ],
      ),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String date = DateFormat("MMMM dd, yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisExtent: 300,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Archives()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.primaries[index & 15],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
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
                                  'Batch $index',
                                  style: GoogleFonts.poppins(
                                      fontSize: 22, color: Colors.white),
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
                                      fontSize: 12, color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
