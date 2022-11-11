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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("1. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][0], number: "1",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("2. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][1], number: "2",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("3. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][2], number: "3",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("4. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][3], number: "4",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("5. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][4], number: "5",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("6. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][5], number: "6",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("7. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][6], number: "7",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("8. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][7], number: "8",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("9. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][8], number: "9",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("10. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][9], number: "10",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("11. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][10], number: "11",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("12. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][11], number: "12",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("13. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][12], number: "13",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("14. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][13], number: "14",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("15. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][14], number: "15",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("16. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][15], number: "16",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("17. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][16], number: "17",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("18. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][17], number: "18",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("19. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][18], number: "19",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("20. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][19], number: "20",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("21. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][20], number: "21",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("22. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][21], number: "22",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("23. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][22], number: "23",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("24. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][23], number: "24",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("25. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][24], number: "25",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("26. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][25], number: "26",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("27. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][26], number: "27",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("28. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][27], number: "28",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("29. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][28], number: "29",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("30. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][29], number: "30",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("31. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][30], number: "31",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("32. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][31], number: "32",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("33. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][32], number: "33",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("34. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][33], number: "34",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("35. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][34], number: "35",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("36. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][35], number: "36",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("37. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][36], number: "37",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("38. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][37], number: "38",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("39. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][38], number: "39",subject: 'mathematics',),width: 300,)),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("40. "),
                    ),
                    Center(child: SizedBox(height: 50, child: InputChipotle(answer: global.answer_key[2][39], number: "40",subject: 'mathematics',),width: 300,)),
                  ],
                ),
              ],
            ),
          ),
        )
    );
  }
}
