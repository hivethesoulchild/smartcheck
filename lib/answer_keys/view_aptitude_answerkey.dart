import 'package:flutter/material.dart';
import 'package:smartcheck/answer_keys/view_buttons.dart';

class ViewAptitudeAnswerKey extends StatefulWidget {
  final dynamic answerKey;

  const ViewAptitudeAnswerKey({Key? key, required this.answerKey})
      : super(key: key);

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
                width: 300,
                child: ViewChipotle(answer: widget.answerKey[i].toString(), optionType: 'aptitude',),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: 750,
        child: SingleChildScrollView(
          child: Column(
            children: row,
          ),
        ),
      ),
    );
  }
}
