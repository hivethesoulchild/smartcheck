import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginLoading extends StatefulWidget {
  const LoginLoading({Key? key}) : super(key: key);

  @override
  State<LoginLoading> createState() => _LoginLoadingState();
}

showLoaderDialog(BuildContext context) async {
  Future.delayed(const Duration(seconds: 2))
      .then((value) => Navigator.of(context).pop());
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    content: Row(
      children: [
        CircularProgressIndicator(
          color: HexColor('35408F'),
        ),
        const SizedBox(
          width: 3,
        ),
        Container(
            margin: const EdgeInsets.only(left: 7),
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
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7), child: const Text("Loading...")),
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
