import 'package:flutter/material.dart';
import 'buttons.dart';
import '../../../backend/data.dart' as global;

class MathAnswerKey extends StatefulWidget {
  const MathAnswerKey({Key? key}) : super(key: key);

  @override
  State<MathAnswerKey> createState() => _MathAnswerKeyState();
}

class _MathAnswerKeyState extends State<MathAnswerKey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          height: 750,
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < 30; i++)
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
                          child: InputChipotle(
                            answer: global.answer_key_temp[2][i],
                            number: "${i + 1}",
                            subject: 'mathematics',
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ));
  }
}
