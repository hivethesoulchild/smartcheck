import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../backend/backendpy.dart';
import 'package:uuid/uuid.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../data.dart' as global;

class UserAccess extends StatefulWidget {
  const UserAccess({Key? key}) : super(key: key);

  @override
  State<UserAccess> createState() => _UserAccessState();
}

//TODO: fix SUPERUSER AND USER default Value

class _UserAccessState extends State<UserAccess> {
  bool _isSwitched = false;

  List<String> superuser = ['SUPERUSER', 'USER'];

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String selectedValue = 'SUPERUSER';

  Future<dynamic> showDeleteDialog(BuildContext context, dynamic value) async {
    return showDialog(
      context: context,
      builder: ((BuildContext context) {
        return StatefulBuilder(builder: (context, setStateSB) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: const EdgeInsets.only(top: 20.0),
            content: const SingleChildScrollView(
                child: Column(
              children: [
                Text("Are you sure you want to delete?"),
              ],
            )),
            actions: [
              ElevatedButton(
                onPressed: () {
                  //chuchu
                  if (global.userLoggedIn['_id'] == value['id']) {
                    Fluttertoast.showToast(
                        msg: "Error: Cannot delete the current logged in...",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    Navigator.of(context).pop();
                    return;
                  }
                  global.userList
                      .removeWhere((element) => element['id'] == value['id']);
                  BackEndPy.deleteUser(value['id']);
                  setState(() {});
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: HexColor("#35408F"),
                ),
                child: const Text('Yes'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: HexColor("#35408F"),
                ),
                child: const Text("No"),
              ),
            ],
          );
        });
      }),
    );
  }

  Future<dynamic> showEditUserDialog(
      BuildContext context, dynamic value) async {
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
              'Edit User',
              style: GoogleFonts.poppins(),
            ),
            content: SingleChildScrollView(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      readOnly: true,
                      controller: usernameController..text = value['username'],
                      decoration: const InputDecoration(
                        hintText: 'Username',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController..text = value['password'],
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    child: DropdownButton(
                        dropdownColor: Colors.white,
                        value: selectedValue,
                        items: superuser
                            .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                            .toList(),
                        onChanged: (String? value) {
                          setStateSB(() {
                            selectedValue = value!;
                          });
                        }),
                  ),
                  SizedBox(
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Active"),
                        ),
                        const Spacer(),
                        Switch(
                          onChanged: (bool value) {
                            setStateSB(() {
                              _isSwitched = value;
                            });
                          },
                          value: _isSwitched,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  textStyle: GoogleFonts.poppins(),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  BackEndPy.editUser(value['id'], passwordController.text,
                      _isSwitched, selectedValue);
                  Fluttertoast.showToast(
                    msg: "User saved!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor("#35408f"),
                  textStyle: GoogleFonts.poppins(),
                  foregroundColor: Colors.white,
                ),
                child: const Text('Save'),
              ),
            ],
          );
        });
      },
    );
  }

  Future<dynamic> showAddUserDialog(BuildContext context) async {
    TextEditingController newUsernameController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setStateSB) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              contentPadding: const EdgeInsets.only(top: 10.0),
              title: Text(
                'Add User',
                style: GoogleFonts.poppins(),
              ),
              content: SingleChildScrollView(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        controller: newUsernameController,
                        decoration: const InputDecoration(
                          hintText: 'Username',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        obscureText: true,
                        controller: newPasswordController,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: DropdownButton(
                        hint: const Text("Select role.."),
                        dropdownColor: Colors.white,
                        items: superuser
                            .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                            .toList(),
                        onChanged: (value) {
                          setStateSB(
                            () {
                              setState(() {
                                selectedValue = value.toString();
                                print(value);
                              });
                            },
                          );
                        },
                        value: selectedValue,
                      ),
                    )
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    textStyle: GoogleFonts.poppins(),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    var uuid = const Uuid();
                    var uniqueId = uuid.v4();
                    BackEndPy.addUser(newUsernameController.text,
                        newPasswordController.text, true, selectedValue);
                    global.userList.add({
                      "id": uniqueId,
                      "username": newUsernameController.text,
                      "password": newPasswordController.text,
                      "role": selectedValue,
                      "isActive": true
                    });
                    setState(() {});
                    Fluttertoast.showToast(
                      msg: "User added!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.grey,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    textStyle: GoogleFonts.poppins(),
                    foregroundColor: HexColor("#35408F"),
                  ),
                  child: const Text('Done'),
                ),
              ],
            );
          },
        );
      },
    );
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddUserDialog(context);
        },
        elevation: 0.0,
        backgroundColor: HexColor('#35408F'),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 1,
              mainAxisSpacing: 5.0,
              childAspectRatio: 3.4,
              children: global.userList.map(
                (value) {
                  _isSwitched = value['isActive'];
                  return Padding(
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
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, bottom: 2, top: 10),
                            child: Row(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    value["username"],
                                    style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: HexColor("#35408f")),
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: EdgeInsets.zero,
                                  child: PopupMenuButton<int>(
                                    onSelected: (index) {
                                      if (index == 1) {
                                        showEditUserDialog(context, value);
                                      } else if (index == 2) {
                                        showDeleteDialog(context, value);
                                      }
                                    },
                                    itemBuilder: (context) => [
                                      const PopupMenuItem(
                                        value: 1,
                                        child: Text('Edit'),
                                      ),
                                      const PopupMenuItem(
                                        value: 2,
                                        child: Text('Delete'),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, bottom: 5, top: 3),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                value["role"],
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
