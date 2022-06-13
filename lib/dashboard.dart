import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
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

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Container(
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            color: HexColor('#35408f'),
            onPressed: () {},
            child: Text(
              'Add/Import',
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
