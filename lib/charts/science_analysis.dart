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

class ScienceAnalysis extends StatefulWidget {
  const ScienceAnalysis({Key? key}) : super(key: key);

  @override
  State<ScienceAnalysis> createState() => _ScienceAnalysisState();
}

class _ScienceAnalysisState extends State<ScienceAnalysis> {
  late Map<String, dynamic> api;
  late List<Item> _data;

  @override
  void initState() {
    super.initState();
    // Fetch data from the API when the widget initializes.
    _fetchScienceData();
  }

  Future<void> _fetchScienceData() async {
    api = await BackEndPy.getAnalysisDataScience();

    _data = List<Item>.generate(
      15,
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
                'value': api['scienceCount']['A'][index],
                'color': Colors.blue
              }, // Correct answer
              {
                'label': 'B',
                'value': api['scienceCount']['B'][index],
                'color': Colors.blue
              },
              {
                'label': 'C',
                'value': api['scienceCount']['C'][index],
                'color': Colors.blue
              },
              {
                'label': 'D',
                'value': api['scienceCount']['D'][index],
                'color': Colors.blue
              },
            ],
            colorFn: (dynamic data, _) =>
                charts.ColorUtil.fromDartColor(data['color']),
          ),
        ],
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return api == null
        ? CircularProgressIndicator() // Show a loading indicator while data is being fetched.
        : SingleChildScrollView(
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
