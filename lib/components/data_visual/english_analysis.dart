import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:google_fonts/google_fonts.dart';
import '../../pages/admin/charts.dart';
import 'package:smartcheck/backend/data.dart' as global;

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
  final dynamic answerKey;
  const EnglishAnalysis({Key? key, required this.analysisEnglishData, required this.answerKey}) : super(key: key);
  @override
  State<EnglishAnalysis> createState() => _EnglishAnalysisState();
}

class _EnglishAnalysisState extends State<EnglishAnalysis> {

  late List<Item> _data;

  @override
  void initState() {
    super.initState();
    _data = _generateData();
  }

  List<Item> _generateData(){
    return List<Item>.generate(
      30,
      (int index) => Item(
        headerText: 'Item ${index + 1}',
        chartData: [
          charts.Series<dynamic, String>(
            id: 'Sample Data',
            domainFn: (dynamic data, _) => data['label'],
            measureFn: (dynamic data, _) => data['value'],
            data: [
              {'label': 'A', 'value': widget.analysisEnglishData['englishCount']['0'][index], 'color': (widget.answerKey['english'][index] == 'A') ? Colors.blue : Colors.grey}, // Correct answer
              {'label': 'B', 'value': widget.analysisEnglishData['englishCount']['1'][index], 'color': (widget.answerKey['english'][index] == 'B') ? Colors.blue : Colors.grey},
              {'label': 'C', 'value': widget.analysisEnglishData['englishCount']['2'][index], 'color': (widget.answerKey['english'][index] == 'C') ? Colors.blue : Colors.grey},
              {'label': 'D', 'value': widget.analysisEnglishData['englishCount']['3'][index], 'color': (widget.answerKey['english'][index] == 'D') ? Colors.blue : Colors.grey},
              {'label': 'E', 'value': widget.analysisEnglishData['englishCount']['4'][index], 'color': (widget.answerKey['english'][index] == 'E') ? Colors.blue : Colors.grey},
              //{'label': 'Void', 'value': widget.analysisEnglishData['englishCount']['5'][index], 'color': Colors.grey},
            ],
            colorFn: (dynamic data, _) =>
                charts.ColorUtil.fromDartColor(data['color']),
          ),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant EnglishAnalysis oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.analysisEnglishData != widget.analysisEnglishData) {
      setState(() {
        _data = _generateData();
      });
    }
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