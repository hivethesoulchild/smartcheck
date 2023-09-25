import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class BatchChart {
  final String batch;
  final int applicants;
  final Color barColor;

  BatchChart(this.batch, this.applicants, this.barColor);
}

class MathAnalysis extends StatefulWidget {
  const MathAnalysis({Key? key}) : super(key: key);

  static final List<BatchChart> itemdummy = [
    BatchChart('1', 100, HexColor('35408F')),
    BatchChart('2', 200, HexColor('35408F')),
    BatchChart('3', 300, HexColor('35408F')),
    BatchChart('4', 250, HexColor('35408F')),
    BatchChart('5', 150, HexColor('35408F')),
    BatchChart('6', 400, HexColor('35408F')),
    BatchChart('7', 100, HexColor('35408F')),
    BatchChart('8', 360, HexColor('35408F')),
    BatchChart('9', 240, HexColor('35408F')),
    BatchChart('10', 210, HexColor('35408F')),
  ];

  static final List<BatchChart> item1120 = [
    BatchChart('11', 100, HexColor('35408F')),
    BatchChart('12', 200, HexColor('35408F')),
    BatchChart('13', 300, HexColor('35408F')),
    BatchChart('14', 250, HexColor('35408F')),
    BatchChart('15', 150, HexColor('35408F')),
    BatchChart('16', 400, HexColor('35408F')),
    BatchChart('17', 100, HexColor('35408F')),
    BatchChart('18', 360, HexColor('35408F')),
    BatchChart('19', 240, HexColor('35408F')),
    BatchChart('20', 210, HexColor('35408F')),
  ];

  static final List<BatchChart> item2130 = [
    BatchChart('21', 100, HexColor('35408F')),
    BatchChart('22', 200, HexColor('35408F')),
    BatchChart('23', 300, HexColor('35408F')),
    BatchChart('24', 250, HexColor('35408F')),
    BatchChart('25', 150, HexColor('35408F')),
    BatchChart('26', 400, HexColor('35408F')),
    BatchChart('27', 100, HexColor('35408F')),
    BatchChart('28', 360, HexColor('35408F')),
    BatchChart('29', 240, HexColor('35408F')),
    BatchChart('30', 210, HexColor('35408F')),
  ];

  static final List<BatchChart> item3140 = [
    BatchChart('31', 100, HexColor('35408F')),
    BatchChart('32', 200, HexColor('35408F')),
    BatchChart('33', 300, HexColor('35408F')),
    BatchChart('34', 250, HexColor('35408F')),
    BatchChart('35', 150, HexColor('35408F')),
    BatchChart('36', 400, HexColor('35408F')),
    BatchChart('37', 100, HexColor('35408F')),
    BatchChart('38', 360, HexColor('35408F')),
    BatchChart('39', 240, HexColor('35408F')),
    BatchChart('40', 210, HexColor('35408F')),
  ];

  @override
  State<MathAnalysis> createState() => _MathAnalysisState();
}

class _MathAnalysisState extends State<MathAnalysis> {
  List<String> datee = [
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
    '2029',
    '2030',
    '2031',
    '2032',
    '2033',
    '2034'
  ];
  var selectedValue = '2022';
  @override
  Widget build(BuildContext context) {
    List<charts.Series<BatchChart, String>> series = [
      charts.Series(
        data: MathAnalysis.itemdummy,
        id: "Correct Answer",
        domainFn: (BatchChart cluster, _) => cluster.batch,
        measureFn: (BatchChart cluster, _) => cluster.applicants,
        colorFn: (BatchChart cluster, _) =>
            charts.ColorUtil.fromDartColor(cluster.barColor),
      ),
    ];
    List<charts.Series<BatchChart, String>> series2 = [
      charts.Series(
        data: MathAnalysis.item1120,
        id: "Correct Answer",
        domainFn: (BatchChart cluster, _) => cluster.batch,
        measureFn: (BatchChart cluster, _) => cluster.applicants,
        colorFn: (BatchChart cluster, _) =>
            charts.ColorUtil.fromDartColor(cluster.barColor),
      ),
    ];
    List<charts.Series<BatchChart, String>> series3 = [
      charts.Series(
        data: MathAnalysis.item2130,
        id: "Correct Answer",
        domainFn: (BatchChart cluster, _) => cluster.batch,
        measureFn: (BatchChart cluster, _) => cluster.applicants,
        colorFn: (BatchChart cluster, _) =>
            charts.ColorUtil.fromDartColor(cluster.barColor),
      ),
    ];
    List<charts.Series<BatchChart, String>> series4 = [
      charts.Series(
        data: MathAnalysis.item3140,
        id: "Correct Answer",
        domainFn: (BatchChart cluster, _) => cluster.batch,
        measureFn: (BatchChart cluster, _) => cluster.applicants,
        colorFn: (BatchChart cluster, _) =>
            charts.ColorUtil.fromDartColor(cluster.barColor),
      ),
    ];
    return DefaultTabController(
      length: 4,
      child: StatefulBuilder(builder: (context, setStateSB) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: HexColor('#35408f')),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: HexColor('#ffffff'),
            title: Text(
              'Charts',
              style: GoogleFonts.poppins(color: HexColor('#35408f')),
            ),
            actions: [
              PopupMenuButton(
                icon: const Icon(
                  Icons.sort,
                  color: Colors.grey,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: const Text("Sort by date"),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                    child: const Text("Sort by school"),
                    onTap: () {},
                  ),
                ],
              ),
            ],
            bottom: TabBar(
              physics: const BouncingScrollPhysics(),
              labelColor: HexColor('#35408f'),
              indicatorColor: HexColor('#35408f'),
              labelStyle: GoogleFonts.poppins(
                fontSize: 17,
              ),
              unselectedLabelStyle: GoogleFonts.poppins(
                fontSize: 17,
              ),
              tabs: const [
                Tab(
                  text: "1-10",
                ),
                Tab(
                  text: "11-20",
                ),
                Tab(
                  text: "21-30",
                ),
                Tab(
                  text: "31-40",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 70,
                        child: Row(
                          children: [
                            DropdownButton(
                                value: selectedValue,
                                items: datee
                                    .map<DropdownMenuItem<String>>(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setStateSB(() {
                                    selectedValue = value!;
                                  });
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: charts.BarChart(
                          series,
                          behaviors: [charts.SeriesLegend()],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 70,
                        child: Row(
                          children: [
                            DropdownButton(
                                value: selectedValue,
                                items: datee
                                    .map<DropdownMenuItem<String>>(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setStateSB(() {
                                    selectedValue = value!;
                                  });
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: charts.BarChart(
                          series2,
                          behaviors: [charts.SeriesLegend()],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 70,
                        child: Row(
                          children: [
                            DropdownButton(
                                value: selectedValue,
                                items: datee
                                    .map<DropdownMenuItem<String>>(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setStateSB(() {
                                    selectedValue = value!;
                                  });
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: charts.BarChart(
                          series3,
                          behaviors: [charts.SeriesLegend()],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 70,
                        child: Row(
                          children: [
                            DropdownButton(
                                value: selectedValue,
                                items: datee
                                    .map<DropdownMenuItem<String>>(
                                        (String value) =>
                                            DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setStateSB(() {
                                    selectedValue = value!;
                                  });
                                }),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: charts.BarChart(
                          series4,
                          behaviors: [charts.SeriesLegend()],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
