import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:smartcheck/answer_keys/view_buttons.dart';
import '../data.dart' as global;

class ViewScienceAnswerKey extends StatefulWidget {
  final List answerKey;
  const ViewScienceAnswerKey({super.key, required this.answerKey});

  @override
  State<ViewScienceAnswerKey> createState() => _ViewScienceAnswerKeyState();
}

class _ViewScienceAnswerKeyState extends State<ViewScienceAnswerKey> {
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
