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

  void toggleSwitch(bool value) {
    if (_isSwitched == false) {
      setState(() {
        _isSwitched = true;
      });
    } else {
      setState(() {
        _isSwitched = false;
      });
    }
  }

  TextEditingController _textFieldController = TextEditingController();

  showAddUserDialog(BuildContext context) {
    String selectedValue = "Superuser";
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      contentPadding: EdgeInsets.only(top: 10.0),
      title: Text(
        'Add User',
        style: GoogleFonts.poppins(),
      ),
      content: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextFormField(
              controller: _textFieldController,
              decoration: InputDecoration(
                hintText: 'Username',
              ),
            ),
            TextFormField(
              controller: _textFieldController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            DropdownButton(
              dropdownColor: Colors.white,
              value: selectedValue,
              items: <String>['Superuser', 'User'].map((String value) {
                return DropdownMenuItem<String>(
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.black),
                  ),
                  value: value,
                );
              }).toList(),
              onChanged: (value) {
                setState(
                  () {
                    selectedValue = value.toString();
                  },
                );
              },
            )
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Done'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            textStyle: GoogleFonts.poppins(),
            foregroundColor: Colors.black,
          ),
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
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
          'User Management',
          style: GoogleFonts.poppins(
            color: HexColor('#35408F'),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.sort,
              color: Colors.grey,
            ),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Sort by name"),
                onTap: () {},
              ),
              PopupMenuItem(
                child: Text("Sort by position"),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddUserDialog(context);
        },
        child: new Icon(Icons.add),
        elevation: 0.0,
        backgroundColor: HexColor('#35408F'),
      ),
      body: Center(
        child: Column(
          children: [
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
                      padding:
                          const EdgeInsets.only(left: 16, bottom: 2, top: 10),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'tropicana_user',
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
                          Padding(
                            padding: EdgeInsets.zero,
                            child: PopupMenuButton<int>(
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: Text('Edit'),
                                  value: 1,
                                ),
                                PopupMenuItem(
                                  child: Text('Delete'),
                                  value: 2,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, bottom: 5, top: 3),
                      child: Align(
                        child: Text(
                          "Superuser",
                          style: GoogleFonts.poppins(),
                        ),
                        alignment: Alignment.topLeft,
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
