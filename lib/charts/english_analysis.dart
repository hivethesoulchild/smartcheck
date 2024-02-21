import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:google_fonts/google_fonts.dart';
import '../models/charts.dart';
import 'package:smartcheck/data.dart' as global;

class Item {
  Item({
    required this.headerText,
    this.isExpanded = false,
    required this.chartData,
  });
  String headerText;
  bool isExpanded;
  List<charts.Series<dynamic, String>> chartData;
  Widget buildChartWidget() {
    return SizedBox(
      height: 180,
      child: ItemChart(chartData),
    );
  }
}
class EnglishAnalysis extends StatefulWidget {
  final dynamic analysisEnglishData;
  const EnglishAnalysis({Key? key, required this.analysisEnglishData}) : super(key: key);
  @override
  State<EnglishAnalysis> createState() => _EnglishAnalysisState();
}

class _EnglishAnalysisState extends State<EnglishAnalysis> {

  late List<Item> _data;

  @override
  void initState() {
    super.initState();
    _data = List<Item>.generate(
      30,
      (int index) => Item(
        headerText: 'Item ${index + 1}',
        chartData: [
          charts.Series<dynamic, String>(
            id: 'Sample Data',
            domainFn: (dynamic data, _) => data['label'],
            measureFn: (dynamic data, _) => data['value'],
            data: [
              {'label': 'A', 'value': widget.analysisEnglishData['englishCount']['0'][index], 'color': (global.answer_key[0][index] == 'A') ? Colors.blue : Colors.grey}, // Correct answer
              {'label': 'B', 'value': widget.analysisEnglishData['englishCount']['1'][index], 'color': (global.answer_key[0][index] == 'B') ? Colors.blue : Colors.grey},
              {'label': 'C', 'value': widget.analysisEnglishData['englishCount']['2'][index], 'color': (global.answer_key[0][index] == 'C') ? Colors.blue : Colors.grey},
              {'label': 'D', 'value': widget.analysisEnglishData['englishCount']['3'][index], 'color': (global.answer_key[0][index] == 'D') ? Colors.blue : Colors.grey},
              {'label': 'E', 'value': widget.analysisEnglishData['englishCount']['4'][index], 'color': (global.answer_key[0][index] == 'E') ? Colors.blue : Colors.grey},
            ],
            colorFn: (dynamic data, _) =>
                charts.ColorUtil.fromDartColor(data['color']),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: ListTile(
                  title: Text(
                    item.headerText,
                    style: GoogleFonts.poppins(),
                  ),
                ),
              );
            },
            body: Column(
              children: [
                Text('Analysis for ${item.headerText}'),
                item.buildChartWidget(),
              ],
            ),
            isExpanded: item.isExpanded,
          );
        }).toList(),
      ),
    );
  }
}