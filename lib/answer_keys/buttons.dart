import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data.dart' as global;

class InputChipotle extends StatefulWidget {
  final String answer;
  final String number;
  final String subject;

  const InputChipotle({
    Key? key,
    required this.answer,
    required this.number,
    required this.subject,
  }) : super(key: key);

  @override
  State<InputChipotle> createState() => InputChipotleState();
}

class InputChipotleState extends State<InputChipotle>
    with TickerProviderStateMixin {
  var _selectedIndex;
  List<String> _options = ['A', 'B', 'C', 'D'];
  List<String> _englishOptions = ['A', 'B', 'C', 'D', 'E'];

  @override
  void initState() {
    super.initState();
    _selectedIndex = getSelectedIndex(widget.answer);
  }

  int getSelectedIndex(String answer) {
    if (_options.contains(answer)) {
      return _options.indexOf(answer);
    } else {
      return _englishOptions.indexOf(answer);
    }
  }

  List<String> getOptions() {
    return widget.subject == 'english' ? _englishOptions : _options;
  }

  Widget _buildChips() {
    List<Widget> chips = [];
    List<String> options = getOptions();

    for (int i = 0; i < options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        label: Text(
          options[i],
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
              global.updateAnswerKeyCache(
                  widget.subject, options[_selectedIndex], int.parse(widget.number) - 1);
            }
          });
        },
      );

      chips.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 1),
          child: choiceChip,
        ),
      );
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
        padding: const EdgeInsets.all(1.0),
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
