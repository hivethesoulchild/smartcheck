import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginLoading extends StatefulWidget {
  const LoginLoading({Key? key}) : super(key: key);

  @override
  State<LoginLoading> createState() => _LoginLoadingState();
}

showLoaderDialog(BuildContext context) async {
  Future.delayed(Duration(seconds: 2))
      .then((value) => Navigator.of(context).pop());
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    content: new Row(
      children: [
        CircularProgressIndicator(
          color: HexColor('35408F'),
        ),
        SizedBox(
          width: 3,
        ),
        Container(
            margin: EdgeInsets.only(left: 7),
            child: Text(
              "Loading...",
              style: GoogleFonts.montserrat(),
            )),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class _LoginLoadingState extends State<LoginLoading> {
  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return showLoaderDialog(context);
  }
}
