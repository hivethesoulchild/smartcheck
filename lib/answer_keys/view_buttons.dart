import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data.dart' as global;

class ViewChipotle extends StatefulWidget {
  final String answer;
  const ViewChipotle({super.key, required this.answer});

  @override
  State<ViewChipotle> createState() => _ViewChipotleState();
}

class _ViewChipotleState extends State<ViewChipotle> {
  var updatedIndex;
  var _selectedIndex;
  List<String> _options = ['A', 'B', 'C', 'D'];
  List<String> _englishOptions = ['A', 'B', 'C', 'D', 'E'];

  Widget _buildChips() {
    List<Widget> chips = [];

    if (widget.answer == '0') {
      _selectedIndex = 0;
    } else if (widget.answer == '1') {
      _selectedIndex = 1;
    } else if (widget.answer == '2') {
      _selectedIndex = 2;
    } else if (widget.answer == '3') {
      _selectedIndex = 3;
    } else if (widget.answer == '4') {
      _selectedIndex = 4;
    } else {
      _selectedIndex = null;
    }

    // if (updatedIndex == 0) {
    //   _selectedIndex = 0;
    // } else if (updatedIndex == 1) {
    //   _selectedIndex = 1;
    // } else if (updatedIndex == 2) {
    //   _selectedIndex = 2;
    // } else if (updatedIndex == 3) {
    //   _selectedIndex = 3;
    // }

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        label: Text(
          _options[i],
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w700),
        ),
        elevation: 2,
        pressElevation: 5,
        shadowColor: Colors.teal,
        backgroundColor: Colors.white,
        selectedColor: Colors.lightGreenAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        disabledColor: Colors.white,
      );

      chips.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: choiceChip,
        ),
      );
    }

    for (int i = 0; i < _englishOptions.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        label: Text(
          _options[i],
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w700),
        ),
        elevation: 2,
        pressElevation: 5,
        shadowColor: Colors.teal,
        backgroundColor: Colors.white,
        selectedColor: Colors.lightGreenAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        disabledColor: Colors.white,
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
