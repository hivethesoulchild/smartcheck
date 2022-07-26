import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartcheck/routes/adduserdialog.dart';

class UserAccess extends StatefulWidget {
  const UserAccess({Key? key}) : super(key: key);

  @override
  State<UserAccess> createState() => _UserAccessState();
}


class _UserAccessState extends State<UserAccess> {
  bool _isSwitched = false;

  void toggleSwitch(bool value){
    if(_isSwitched == false){
      setState(() {
        _isSwitched = true;
      });
    } else {
      setState(() {
        _isSwitched = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: HexColor('#35408f')),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Privileged Users',
          style: GoogleFonts.poppins(
            color: HexColor('#35408F'),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            AddUserDialog(),
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 2,top: 10),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'esteban_ant',
                              style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: HexColor("#35408f")),
                            ),
                          ),
                          Spacer(),
                          Align(
                            alignment: Alignment.topRight,
                            child: Switch(
                              onChanged: toggleSwitch,
                              value: _isSwitched,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


