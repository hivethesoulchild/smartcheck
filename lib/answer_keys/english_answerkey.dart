import 'package:flutter/material.dart';
import 'package:smartcheck/answer_keys/buttons.dart';
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
                          answer: global.answer_key[0][i],
                          number: "${i + 1}",
                          subject: 'english',
                        ),
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
