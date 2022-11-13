import 'package:flutter/material.dart';
import 'package:smartcheck/answer_keys/view_buttons.dart';
import '../data.dart' as global;

class ViewAptitudeAnswerKey extends StatefulWidget {
  final dynamic answerKey;
  const ViewAptitudeAnswerKey({super.key, required this.answerKey});

  @override
  State<ViewAptitudeAnswerKey> createState() => _ViewAptitudeAnswerKeyState();
}

class _ViewAptitudeAnswerKeyState extends State<ViewAptitudeAnswerKey> {
  @override
  Widget build(BuildContext context) {

     var row = <Widget>[];
    for (int i = 0; i < 15; i++) {
      row.add(
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${i + 1}. "),
            ),
            Center(
              child: SizedBox(
                height: 50,
                child: ViewChipotle(answer: widget.answerKey[i]['${i + 1}'].toString()),
                width: 300,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: 750,
        child: SingleChildScrollView(
          child: Column(
            children: row
          ),
        ),
      ),
    );
  }
}