import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartcheck/answer_keys/buttons.dart';
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
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: "A", number: "1",),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("2. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: "B", number: "2",),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("3. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: "A", number: "1",),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("4. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: "A", number: "1",),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("5. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: "A", number: "1",),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("6. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: "A", number: "1",),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("7. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: "A", number: "1",),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("8. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: "A", number: "1",),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("9. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: "A", number: "1",),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("10. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: "A", number: "1",),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("11. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: "A", number: "1",),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("12. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: "A", number: "1",),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("13. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: "A", number: "1",),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("14. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: "A", number: "1",),width: 300,)),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("15. "),
                  ),
                  Center(child: SizedBox(height: 50, child: InputChipotle(answer: "A", number: "1",),width: 300,)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
