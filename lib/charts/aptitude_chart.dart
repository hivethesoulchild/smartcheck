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

class AptitudeAnalysis extends StatefulWidget {
  final dynamic analysisAptitudeData;
  final dynamic answerKey;
  const AptitudeAnalysis({Key? key, required this.analysisAptitudeData, required this.answerKey}) : super(key: key);
  @override
  State<AptitudeAnalysis> createState() => _AptitudeAnalysisState();
}

class _AptitudeAnalysisState extends State<AptitudeAnalysis> {
  
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
              {'label': 'A', 'value': widget.analysisAptitudeData['aptitudeCount']['0'][index], 'color': (widget.answerKey['aptitude'][index] == 'A') ? Colors.blue : Colors.grey}, // Correct answer
              {'label': 'B', 'value': widget.analysisAptitudeData['aptitudeCount']['1'][index], 'color': (widget.answerKey['aptitude'][index] == 'B') ? Colors.blue : Colors.grey},
              {'label': 'C', 'value': widget.analysisAptitudeData['aptitudeCount']['2'][index], 'color': (widget.answerKey['aptitude'][index] == 'C') ? Colors.blue : Colors.grey},
              {'label': 'D', 'value': widget.analysisAptitudeData['aptitudeCount']['3'][index], 'color': (widget.answerKey['aptitude'][index] == 'D') ? Colors.blue : Colors.grey},
              {'label': 'Void', 'value': widget.analysisAptitudeData['aptitudeCount']['4'][index], 'color': Colors.grey},
            ],
            colorFn: (dynamic data, _) =>
                charts.ColorUtil.fromDartColor(data['color']),
          ),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant AptitudeAnalysis oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.analysisAptitudeData != widget.analysisAptitudeData) {
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
