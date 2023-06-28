import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartcheck/answer_keys/buttons.dart';
import '../backend/backendpy.dart';
import '../data.dart' as global;

class EnglishAnswerKey extends StatefulWidget {
  const EnglishAnswerKey({Key? key}) : super(key: key);

  @override
  State<EnglishAnswerKey> createState() => _EnglishAnswerKeyState();
}

class _EnglishAnswerKeyState extends State<EnglishAnswerKey> {
  var answerkey;

  @override
  Widget build(BuildContext context) {
    print(global.answer_key);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: 750,
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < global.answer_key[0].length; i++)
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
                          answer: global.answer_key[0][i],
                          number: "${i + 1}",
                          subject: 'english',
                        ),
                        width: 300,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
