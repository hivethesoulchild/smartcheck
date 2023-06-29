import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data.dart' as global;

class ViewChipotle extends StatefulWidget {
  final String answer;
  final String optionType;

  const ViewChipotle({Key? key, required this.answer, required this.optionType})
      : super(key: key);

  @override
  State<ViewChipotle> createState() => _ViewChipotleState();
}

class _ViewChipotleState extends State<ViewChipotle> {
<<<<<<< HEAD
  int _selectedIndex = -1;
  List<String> _options = ['A', 'B', 'C', 'D'];
=======
  var updatedIndex;
  var _selectedIndex;
  List<String> _options = ['A', 'B', 'C', 'D', 'E'];
>>>>>>> f0b42ff11aa45532680f907c8979c2c84c32148f
  List<String> _englishOptions = ['A', 'B', 'C', 'D', 'E'];

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

<<<<<<< HEAD
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
=======
    bool isFiveLetters = widget.answer.length == 5;

    if (isFiveLetters) {
      for (int i = 0; i < _englishOptions.length; i++) {
        ChoiceChip choiceChip = ChoiceChip(
          selected: _selectedIndex == i,
          label: Text(
            _englishOptions[i],
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.w700),
          ),
          elevation: 2,
          pressElevation: 5,
          shadowColor: Colors.teal,
          backgroundColor: Colors.white,
          selectedColor: Colors.lightGreenAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          disabledColor: Colors.white,
        );

        chips.add(
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
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
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.w700),
          ),
          elevation: 2,
          pressElevation: 5,
          shadowColor: Colors.teal,
          backgroundColor: Colors.white,
          selectedColor: Colors.lightGreenAccent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          disabledColor: Colors.white,
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
>>>>>>> f0b42ff11aa45532680f907c8979c2c84c32148f
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
