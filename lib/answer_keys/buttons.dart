import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputChipotle extends StatefulWidget {
  const InputChipotle({Key? key}) : super(key: key);

  @override
  State<InputChipotle> createState() => InputChipotleState();
}

class InputChipotleState extends State<InputChipotle>
    with TickerProviderStateMixin {
  var _selectedIndex;
  List<String> _options = ['A', 'B', 'C', 'D'];

  Widget _buildChips() {
    List<Widget> chips = [];

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
