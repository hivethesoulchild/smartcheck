import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartcheck/backend/backendpy.dart';

class AddUserDialog extends StatefulWidget {
  const AddUserDialog({Key? key}) : super(key: key);

  @override
  _AddUserDialogState createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void showAddUserDialog(BuildContext context, String username, String password) {
    AlertDialog alert = AlertDialog(
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
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: 'Username',
              ),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            BackEndPy.addUser(username, password, 'USER');

            Navigator.pop(context);
          },
          child: const Text('Done'),
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            showAddUserDialog(context, _usernameController.text, _passwordController.text);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: HexColor('#35408f'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          ),
          child: Text(
            'Add User',
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hexcolor/hexcolor.dart';

// class AddUserDialog extends StatelessWidget {
//   const AddUserDialog({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _textFieldController = TextEditingController();
//     showAddUserDialog(BuildContext context) {
//       AlertDialog alert = AlertDialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         contentPadding: EdgeInsets.only(top: 10.0),
//         title: Text(
//           'Add User',
//           style: GoogleFonts.poppins(),
//         ),
//         content: SingleChildScrollView(
//           padding: EdgeInsets.all(8),
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _textFieldController,
//                 decoration: InputDecoration(
//                   hintText: 'Username',
//                 ),
//               ),
//               TextFormField(
//                 controller: _textFieldController,
//                 decoration: InputDecoration(
//                   hintText: 'Password',
//                 ),
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: Text('Done'),
//           ),
//         ],
//       );
//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return alert;
//           });
//     }

//     return Container(
//       alignment: Alignment.topCenter,
//       child: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: ElevatedButton(
//           onPressed: () {
//             showAddUserDialog(context);
//           },
//           style: ElevatedButton.styleFrom(
//               primary: HexColor('#35408f'),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12.0))),
//           child: Text(
//             'Add User',
//             style: GoogleFonts.poppins(
//                 fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
//           ),
//         ),
//       ),
//     );
//   }
// }
