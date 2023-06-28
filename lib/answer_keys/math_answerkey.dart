import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'buttons.dart';
import '../data.dart' as global;

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
        body: Container(
          height: 750,
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < global.answer_key[2].length; i++)
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${i + 1}. "),
                      ),
                      Center(
                        child: SizedBox(
                          height: 50,
                          child: InputChipotle(
                            answer: global.answer_key[2][i],
                            number: "${i + 1}",
                            subject: 'mathematics',
                          ),
                          width: 300,
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
