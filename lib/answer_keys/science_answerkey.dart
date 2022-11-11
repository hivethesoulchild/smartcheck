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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("1. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][0], number: "1",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("2. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][1], number: "2",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("3. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][2], number: "3",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("4. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][3], number: "4",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("5. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][4], number: "5",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("6. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][5], number: "6",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("7. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][6], number: "7",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("8. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][7], number: "8",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("9. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][8], number: "9",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("10. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][9], number: "10",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("11. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][10], number: "11",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("12. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][11], number: "12",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("13. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][12], number: "13",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("14. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][13], number: "14",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("15. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][14], number: "15",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("16. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][15], number: "16",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("17. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][16], number: "17",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("18. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][17], number: "18",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("19. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][18], number: "19",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("20. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][19], number: "20",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("21. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][20], number: "21",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("22. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][21], number: "22",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("23. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][22], number: "23",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("24. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][23], number: "24",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("25. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][24], number: "25",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("26. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][25], number: "26",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("27. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][26], number: "27",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("28. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][27], number: "28",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("29. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][28], number: "29",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("30. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][29], number: "30",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("31. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][30], number: "31",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("32. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][31], number: "32",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("33. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][32], number: "33",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("34. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][33], number: "34",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("35. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][34], number: "35",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("36. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][35], number: "36",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("37. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][36], number: "37",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("38. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][37], number: "38",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("39. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][38], number: "39",subject: 'science',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("40. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[1][39], number: "40",subject: 'science',),width: 300,)),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
