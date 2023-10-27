import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:google_fonts/google_fonts.dart';
import '../models/charts.dart';
import 'package:smartcheck/backend/backendpy.dart';

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

class EnglishAnalysis extends StatefulWidget {
  const EnglishAnalysis({Key? key}) : super(key: key);

  @override
  State<EnglishAnalysis> createState() => _EnglishAnalysisState();
}

class _EnglishAnalysisState extends State<EnglishAnalysis> {
  late Map<String, dynamic> api;
  late List<Item> _data;

  Future<void> _fetchEnglishData() async {
    api = await BackEndPy.getAnalysisDataEnglish();

    _data = List<Item>.generate(
      30,
      (index) => Item(
        headerText: 'Item ${index + 1}',
        chartData: [
          charts.Series<dynamic, String>(
            id: 'Sample Data',
            domainFn: (dynamic data, _) => data['label'],
            measureFn: (dynamic data, _) => data['value'],
            data: [
              {
                'label': 'A',
                'value': api['englishCount']['A'][index],
                'color': Colors.blue,
              },
              {
                'label': 'B',
                'value': api['englishCount']['B'][index],
                'color': Colors.blue,
              },
              {
                'label': 'C',
                'value': api['englishCount']['C'][index],
                'color': Colors.blue,
              },
              {
                'label': 'D',
                'value': api['englishCount']['D'][index],
                'color': Colors.blue,
              },
              {
                'label': 'E',
                'value': api['englishCount']['E'][index],
                'color': Colors.blue,
              },
            ],
            colorFn: (dynamic data, _) =>
                charts.ColorUtil.fromDartColor(data['color']),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _fetchEnglishData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a loading indicator while data is being fetched.
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
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
      },
    );
  }
}
