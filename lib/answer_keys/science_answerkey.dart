import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartcheck/answer_keys/buttons.dart';
import '../data.dart' as global;

class ScienceAnswerKey extends StatefulWidget {
  const ScienceAnswerKey({Key? key}) : super(key: key);

  @override
  State<ScienceAnswerKey> createState() => _ScienceAnswerKeyState();
}

class _ScienceAnswerKeyState extends State<ScienceAnswerKey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
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
                          child: InputChipotle(
                            answer: global.answer_key[1][i],
                            number: "${i + 1}",
                            subject: 'science',
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
