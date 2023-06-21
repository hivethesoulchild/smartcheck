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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("1. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][0], number: "1",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("2. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][1], number: "2",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("3. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][2], number: "3",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("4. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][3], number: "4",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("5. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][4], number: "5",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("6. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][5], number: "6",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("7. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][6], number: "7",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("8. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][7], number: "8",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("9. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][8], number: "9",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("10. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][9], number: "10",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("11. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][10], number: "11",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("12. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][11], number: "12",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("13. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][12], number: "13",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("14. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][13], number: "14",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("15. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][14], number: "15",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("16. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][15], number: "16",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("17. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][16], number: "17",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("18. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][17], number: "18",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("19. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][18], number: "19",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("20. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][19], number: "20",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("21. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][20], number: "21",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("22. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][21], number: "22",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("23. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][22], number: "23",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("24. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][23], number: "24",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("25. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][24], number: "25",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("26. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][25], number: "26",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("27. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][26], number: "27",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("28. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][27], number: "28",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("29. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][28], number: "29",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("30. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][29], number: "30",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("31. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][30], number: "31",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("32. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][31], number: "32",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("33. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][32], number: "33",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("34. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][33], number: "34",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("35. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][34], number: "35",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("36. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][35], number: "36",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("37. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][36], number: "37",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("38. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][37], number: "38",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("39. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][38], number: "39",subject: 'english',),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("40. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[0][39], number: "40",subject: 'english',),width: 300,)),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
