

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data.dart' as global;

class InputChipotle extends StatefulWidget {
  final String answer;
  final String number;
  final String subject;
  const InputChipotle({Key? key, required this.answer, required this.number, required this.subject})
      : super(key: key);

  @override
  State<InputChipotle> createState() => InputChipotleState();
}

class InputChipotleState extends State<InputChipotle>
    with TickerProviderStateMixin {
  var updatedIndex;
  var _selectedIndex;
  List<String> _options = ['A', 'B', 'C', 'D'];

  Widget _buildChips() {
    List<Widget> chips = [];

    if (widget.answer == _options[0]) {
      _selectedIndex = 0;
    } else if (widget.answer == _options[1]) {
      _selectedIndex = 1;
    } else if (widget.answer == _options[2]) {
      _selectedIndex = 2;
    } else {
      _selectedIndex = 3;
    }

    if (updatedIndex == 0) {
      _selectedIndex = 0;
    } else if (updatedIndex == 1) {
      _selectedIndex = 1;
    } else if (updatedIndex == 2) {
      _selectedIndex = 2;
    } else if (updatedIndex == 3) {
      _selectedIndex = 3;
    }


    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        label: Text(
          _options[i],
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        elevation: 2,
        pressElevation: 5,
        shadowColor: Colors.teal,
        backgroundColor: Colors.white,
        selectedColor: Colors.lightGreenAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              _selectedIndex = i;
              print(_options[_selectedIndex]);
              print(widget.number);
              print(widget.subject);
              updatedIndex = i;
              global.updateAnswerKeyCache(widget.subject, _options[_selectedIndex], int.parse(widget.number) - 1);
            }
          });
        },
      );

      chips.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: choiceChip,
        ),
      );
    }

    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 30,
              child: _buildChips(),
            ),
          ],
        ),
      ),
    );
  }
}
