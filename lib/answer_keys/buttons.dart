import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data.dart' as global;

class InputChipotle extends StatefulWidget {
  final String answer;
  final String number;
  final String subject;
  const InputChipotle(
      {Key? key,
      required this.answer,
      required this.number,
      required this.subject})
      : super(key: key);

  @override
  State<InputChipotle> createState() => InputChipotleState();
}

class InputChipotleState extends State<InputChipotle>
    with TickerProviderStateMixin {
  var updatedIndex;
  var _selectedIndex;
  final List<String> _options = ['A', 'B', 'C', 'D', 'E'];
  final List<String> _englishOptions = ['A', 'B', 'C', 'D', 'E'];

  Widget _buildChips() {
    List<Widget> chips = [];
    bool isFiveLetters = widget.answer.length == 5;

    if (widget.answer == _options[0]) {
      _selectedIndex = 0;
    } else if (widget.answer == _options[1]) {
      _selectedIndex = 1;
    } else if (widget.answer == _options[2]) {
      _selectedIndex = 2;
    } else if (widget.answer == _options[3]) {
      _selectedIndex = 3;
    } else {
      _selectedIndex = 4;
    }

    if (widget.answer == _englishOptions[0]) {
      _selectedIndex = 0;
    } else if (widget.answer == _englishOptions[1]) {
      _selectedIndex = 1;
    } else if (widget.answer == _englishOptions[2]) {
      _selectedIndex = 2;
    } else if (widget.answer == _englishOptions[3]) {
      _selectedIndex = 3;
    } else {
      _selectedIndex = 4;
    }

    if (updatedIndex == 0) {
      _selectedIndex = 0;
    } else if (updatedIndex == 1) {
      _selectedIndex = 1;
    } else if (updatedIndex == 2) {
      _selectedIndex = 2;
    } else if (updatedIndex == 3) {
      _selectedIndex = 3;
    } else if (updatedIndex == 4) {
      _selectedIndex = 4;
    }

    if (isFiveLetters) {
      for (int i = 0; i < _englishOptions.length; i++) {
        ChoiceChip choiceChip = ChoiceChip(
          selected: _selectedIndex == i,
          label: Text(
            _englishOptions[i],
            style: GoogleFonts.poppins(color: Colors.black),
          ),
          elevation: 2,
          pressElevation: 5,
          shadowColor: Colors.teal,
          backgroundColor: Colors.white,
          selectedColor: Colors.lightGreenAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _selectedIndex = i;
                updatedIndex = i;
                global.updateAnswerKeyCache(
                    widget.subject,
                    _englishOptions[_selectedIndex],
                    int.parse(widget.number) - 1);
              }
            });
          },
        );

        chips.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: choiceChip,
          ),
        );
      }
    } else {
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _selectedIndex = i;
                updatedIndex = i;
                global.updateAnswerKeyCache(widget.subject,
                    _options[_selectedIndex], int.parse(widget.number) - 1);
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
    }

    return ListView(
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
