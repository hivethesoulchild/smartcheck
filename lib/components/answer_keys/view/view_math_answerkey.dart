import 'package:flutter/material.dart';
import 'package:smartcheck/components/answer_keys/view/view_buttons.dart';

class ViewMathAnswerKey extends StatefulWidget {
  final dynamic answerKey;
  const ViewMathAnswerKey({super.key, required this.answerKey});

  @override
  State<ViewMathAnswerKey> createState() => _ViewMathAnswerKeyState();
}

class _ViewMathAnswerKeyState extends State<ViewMathAnswerKey> {
  @override
  Widget build(BuildContext context) {

     var row = <Widget>[];
    for (int i = 0; i < 30; i++) {
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
                child: ViewChipotle(answer: widget.answerKey[i].toString(), optionType: 'math',),
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
              children: row
            ),
          ),
        )
    );
  }
}