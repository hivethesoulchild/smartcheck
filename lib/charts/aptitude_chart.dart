import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import '../models/charts.dart';

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
      height: 150,
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
      headerText: 'Item $index',
      chartData: [
        charts.Series<dynamic, String>(
          id: 'Sample Data',
          domainFn: (dynamic data, _) => data['label'],
          measureFn: (dynamic data, _) => data['value'],
          data: [
            {
              'label': 'A',
              'value': 10,
              'color': Colors.green
            }, // Correct answer
            {'label': 'B', 'value': 20, 'color': Colors.red},
            {'label': 'C', 'value': 30, 'color': Colors.red},
            {'label': 'D', 'value': 15, 'color': Colors.red},
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
            _data[index].isExpanded = !isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((Item item) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(item.headerText),
              );
            },
            body: Column(
              children: [
                Text('Hello, ${item.headerText}'),
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
