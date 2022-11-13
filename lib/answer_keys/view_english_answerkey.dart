import 'package:flutter/material.dart';
import 'package:smartcheck/answer_keys/view_buttons.dart';
import '../data.dart' as global;

class ViewEnglishAnswerKey extends StatefulWidget {
  final dynamic answerKey;
  const ViewEnglishAnswerKey({super.key, required this.answerKey});

  @override
  State<ViewEnglishAnswerKey> createState() => _ViewEnglishAnswerKeyState();
}

class _ViewEnglishAnswerKeyState extends State<ViewEnglishAnswerKey> {
  @override
  Widget build(BuildContext context) {
    print(widget.answerKey);
    var row = <Widget>[];
    for (int i = 0; i < 40; i++) {
      row.add(
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${i + 1}. "),
            ),
            Center(
              child: SizedBox(
                height: 50,
                child: ViewChipotle(answer: widget.answerKey[i]['${i + 1}'].toString()),
                width: 300,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: 750,
        child: SingleChildScrollView(
          child: Column(
            children: row,
          ),
        ),
      ),
    );
  }
}

// Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("1. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0]['1']),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("2. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[1]['2']),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("3. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey['3']),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("4. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey['0][3']),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("5. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][4]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("6. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][5]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("7. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][6]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("8. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][7]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("9. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][8]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("10. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][9]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("11. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][10]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("12. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][11]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("13. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][12]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("14. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][13]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("15. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][14]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("16. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][15]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("17. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][16]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("18. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][17]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("19. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][18]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("20. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][19]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("21. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][20]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("22. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][21]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("23. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][22]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("24. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][23]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("25. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][24]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("26. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][25]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("27. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][26]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("28. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][27]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("29. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][28]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("30. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][29]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("31. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][30]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("32. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][31]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("33. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][32]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("34. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][33]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("35. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][34]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("36. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][35]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("37. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][36]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("38. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][37]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("39. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][38]),width: 300,)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text("40. "),
//                   ),
//                   Center(child: SizedBox(height: 50, child: ViewChipotle(answer: widget.answerKey[0][39]),width: 300,)),
//                 ],
//               ),