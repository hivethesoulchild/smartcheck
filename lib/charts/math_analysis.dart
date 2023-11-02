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
class MathAnalysis extends StatefulWidget {
  const MathAnalysis({Key? key}) : super(key: key);
  @override
  State<MathAnalysis> createState() => _MathAnalysisState();
}

class _MathAnalysisState extends State<MathAnalysis> {
  final List<Item> _data = List<Item>.generate(
    30,
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
              'value':  global.analysisMathData['mathCount']['0'][index],
              'color': Colors.blue
            }, // Correct answer
            {'label': 'B', 'value': global.analysisMathData['mathCount']['1'][index], 'color': Colors.blue},
            {'label': 'C', 'value': global.analysisMathData['mathCount']['2'][index], 'color': Colors.blue},
            {'label': 'D', 'value': global.analysisMathData['mathCount']['3'][index], 'color': Colors.blue},
            {'label': 'E', 'value': global.analysisMathData['mathCount']['4'][index], 'color': Colors.blue},
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