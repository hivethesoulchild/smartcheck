import 'package:flutter/material.dart';
import 'package:smartcheck/components/answer_keys/edit/buttons.dart';
import '../../../backend/data.dart' as global;

class AptitudeAnserKey extends StatefulWidget {
  const AptitudeAnserKey({Key? key}) : super(key: key);

  @override
  State<AptitudeAnserKey> createState() => _AptitudeAnserKeyState();
}

class _AptitudeAnserKeyState extends State<AptitudeAnserKey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: 750,
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < 15; i++)
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
                          answer: global.answer_key_temp[3][i],
                          number: "${i + 1}",
                          subject: 'aptitude',
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
