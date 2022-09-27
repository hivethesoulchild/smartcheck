import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smartcheck/routes/analysis_per_subject_button.dart';

class ItemAnalysis extends StatefulWidget {
  const ItemAnalysis({Key? key}) : super(key: key);

  @override
  State<ItemAnalysis> createState() => _ItemAnalysisState();
}

class _ItemAnalysisState extends State<ItemAnalysis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: HexColor('#35408f')),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: HexColor('#ffffff'),
        title: Text(
          'Item Analysis',
          style: GoogleFonts.poppins(
            color: HexColor('#35408F'),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Flexible(
          flex: 2,
          fit: FlexFit.tight,
          child: Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: GridView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(5.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 150,
                    mainAxisSpacing: 5.0,
                    crossAxisSpacing: 5.0,
                  ),
                  children: [
                    buildEnglishButton(context),
                    buildScienceButton(context),
                    buildMathematicsButton(context),
                    buildAptitudeButton(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
