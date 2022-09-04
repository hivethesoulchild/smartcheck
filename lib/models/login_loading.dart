import 'package:flutter/material.dart';

class LoginLoading extends StatefulWidget {
  const LoginLoading({Key? key}) : super(key: key);

  @override
  State<LoginLoading> createState() => _LoginLoadingState();
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
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
  @override
  Widget build(BuildContext context) {
    return showLoaderDialog(context);
  }
}
