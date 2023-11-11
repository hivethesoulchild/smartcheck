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
  const AptitudeAnalysis({Key? key}) : super(key: key);
  @override
  State<AptitudeAnalysis> createState() => _AptitudeAnalysisState();
}

class _AptitudeAnalysisState extends State<AptitudeAnalysis> {
  final List<Item> _data = List<Item>.generate(
    15,
    (int index) => Item(
      headerText: 'Item ${index + 1}',
      chartData: [
        charts.Series<dynamic, String>(
          id: 'Sample Data',
          domainFn: (dynamic data, _) => data['label'],
          measureFn: (dynamic data, _) => data['value'],
          data: [
            {
              'label': 'A',
              'value': global.analysisAptitudeData['aptitudeCount']['0'][index],
              'color': (global.answer_key[3][index] == 'A')
                  ? Colors.blue
                  : Colors.grey
            }, // Correct answer
            {
              'label': 'B',
              'value': global.analysisAptitudeData['aptitudeCount']['1'][index],
              'color': (global.answer_key[3][index] == 'B')
                  ? Colors.blue
                  : Colors.grey
            },
            {
              'label': 'C',
              'value': global.analysisAptitudeData['aptitudeCount']['2'][index],
              'color': (global.answer_key[3][index] == 'C')
                  ? Colors.blue
                  : Colors.grey
            },
            {
              'label': 'D',
              'value': global.analysisAptitudeData['aptitudeCount']['3'][index],
              'color': (global.answer_key[3][index] == 'D')
                  ? Colors.blue
                  : Colors.grey
            },
          ],
          colorFn: (dynamic data, _) =>
              charts.ColorUtil.fromDartColor(data['color']),
        ),
      ],
    ),
  );

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
