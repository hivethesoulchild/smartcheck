import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartcheck/answer_keys/buttons.dart';
import '../data.dart' as global;

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
      body: Container(
        height: 750,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("1. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[3][0], number: "1", subject: 'aptitude',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("2. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[3][1], number: "2",subject: 'aptitude',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("3. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[3][2], number: "3",subject: 'aptitude',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("4. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[3][3], number: "4",subject: 'aptitude',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("5. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[3][4], number: "5",subject: 'aptitude',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("6. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[3][5], number: "6",subject: 'aptitude',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("7. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[3][6], number: "7",subject: 'aptitude',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("8. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[3][7], number: "8",subject: 'aptitude',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("9. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[3][8], number: "9",subject: 'aptitude',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("10. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[3][9], number: "10",subject: 'aptitude',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("11. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[3][10], number: "11",subject: 'aptitude',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("12. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[3][11], number: "12",subject: 'aptitude',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("13. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[3][12], number: "13",subject: 'aptitude',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("14. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[3][13], number: "14",subject: 'aptitude',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("15. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[3][14], number: "15",subject: 'aptitude',),width: 300,)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
