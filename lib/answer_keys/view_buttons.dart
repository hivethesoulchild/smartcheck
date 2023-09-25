import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewChipotle extends StatefulWidget {
  final String answer;
  final String optionType;

  const ViewChipotle({Key? key, required this.answer, required this.optionType})
      : super(key: key);

  @override
  State<ViewChipotle> createState() => _ViewChipotleState();
}

class _ViewChipotleState extends State<ViewChipotle> {
  int _selectedIndex = -1;
  final List<String> _options = ['A', 'B', 'C', 'D'];
  final List<String> _englishOptions = ['A', 'B', 'C', 'D', 'E'];

  @override
  void initState() {
    super.initState();
    _selectedIndex = getSelectedIndex(widget.answer);
  }

  int getSelectedIndex(String answer) {
    switch (answer) {
      case '0':
        return 0;
      case '1':
        return 1;
      case '2':
        return 2;
      case '3':
        return 3;
      case '4':
        return 4;
      default:
        return -1;
    }
  }

  List<String> getOptions() {
    return widget.optionType == 'english' ? _englishOptions : _options;
  }

  Widget _buildChips() {
    List<Widget> chips = [];
    List<String> options = getOptions();

    for (int i = 0; i < options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: _selectedIndex == i,
        label: Text(
          options[i],
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 2,
        pressElevation: 5,
        shadowColor: Colors.teal,
        backgroundColor: Colors.white,
        selectedColor: Colors.lightGreenAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        disabledColor: Colors.white,
        onSelected: null, // Disable editing
      );

      chips.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: choiceChip,
        ),
      );
    }

    return Wrap(
      spacing: 2,
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
            Expanded(
              child: _buildChips(),
            ),
          ],
        ),
      ),
    );
  }
}
