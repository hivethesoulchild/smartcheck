import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/widgets.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  static final List<BatchChart> batch = [
    BatchChart('Batch 1', 100, Colors.red),
    BatchChart('Batch 2', 200, Colors.purple),
    BatchChart('Batch 3', 300, Colors.yellow),
  ];

  static final List<ItemAnalysisChart> items = [
    ItemAnalysisChart('English', 20, Colors.green),
    ItemAnalysisChart('Math', 40, Colors.blue),
    ItemAnalysisChart('Science', 30, Colors.orange),
    ItemAnalysisChart('Aptitude', 10, Colors.pink),
  ];

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  double percent = 0.0;

  @override
  void initState() {
    Timer? timer;
    timer = Timer.periodic(Duration(milliseconds:1000),(_){
      setState(() {
        percent+=10;
        if(percent >= 50){
          timer?.cancel();
          // percent=0;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<charts.Series<BatchChart, String>> series = [
      charts.Series(
        data: Chart.batch,
        id: "Applicants per Batch",
        domainFn: (BatchChart cluster, _) => cluster.batch,
        measureFn: (BatchChart cluster, _) => cluster.applicants,
        colorFn: (BatchChart cluster, _) =>
            charts.ColorUtil.fromDartColor(cluster.barColor),
      ),
    ];

    List<charts.Series<ItemAnalysisChart, String>> secondSeries = [
      charts.Series(
        data: Chart.items,
        id: 'Item Analysis',
        domainFn: (ItemAnalysisChart aytem, _) => aytem.subjects,
        measureFn: (ItemAnalysisChart aytem, _) => aytem.numbers,
        colorFn: (ItemAnalysisChart aytem, _) =>
            charts.ColorUtil.fromDartColor(aytem.pieColor),
      ),
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          bottom: TabBar(
            physics: BouncingScrollPhysics(),
            tabs: [
              Tab(
                icon: Icon(
                  Icons.bar_chart,
                  color: HexColor('#35408f'),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.pie_chart,
                  color: HexColor('#35408f'),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: charts.BarChart(series),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 3,
                                offset: Offset(2, 3),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: <Widget>[
                                Column(
                                  children: [
                                    Text('Question 1 - English'),
                                    Text('A'),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 30, right: 30),
                                      child: LinearPercentIndicator(
                                        animation: true,
                                        animationDuration: 1000,
                                        lineHeight: 25.0,
                                        percent: percent / 100,
                                        center: Text(
                                          percent.toString() + "%",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        backgroundColor: Colors.grey[300],
                                        progressColor: Colors.redAccent,
                                        linearStrokeCap:
                                            LinearStrokeCap.roundAll,
                                      ),
                                    ),
                                    Text('B'),
                                    Container(
                                      padding:
                                      EdgeInsets.only(left: 30, right: 30),
                                      child: LinearPercentIndicator(
                                        animation: true,
                                        animationDuration: 1000,
                                        lineHeight: 25.0,
                                        percent: percent / 100,
                                        center: Text(
                                          percent.toString() + "%",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        backgroundColor: Colors.grey[300],
                                        progressColor: Colors.redAccent,
                                        linearStrokeCap:
                                        LinearStrokeCap.roundAll,
                                      ),
                                    ),
                                    Text('C'),
                                    Container(
                                      padding:
                                      EdgeInsets.only(left: 30, right: 30),
                                      child: LinearPercentIndicator(
                                        animation: true,
                                        animationDuration: 1000,
                                        lineHeight: 25.0,
                                        percent: percent / 100,
                                        center: Text(
                                          percent.toString() + "%",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        backgroundColor: Colors.grey[300],
                                        progressColor: Colors.redAccent,
                                        linearStrokeCap:
                                        LinearStrokeCap.roundAll,
                                      ),
                                    ),
                                    Text('D'),
                                    Container(
                                      padding:
                                      EdgeInsets.only(left: 30, right: 30),
                                      child: LinearPercentIndicator(
                                        animation: true,
                                        animationDuration: 1000,
                                        lineHeight: 25.0,
                                        percent: percent / 100,
                                        center: Text(
                                          percent.toString() + "%",
                                          style: GoogleFonts.poppins(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                        backgroundColor: Colors.grey[300],
                                        progressColor: Colors.redAccent,
                                        linearStrokeCap:
                                        LinearStrokeCap.roundAll,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BatchChart {
  final String batch;
  final int applicants;
  final Color barColor;

  BatchChart(this.batch, this.applicants, this.barColor);
}

class ItemAnalysisChart {
  final String subjects;
  final int numbers;
  final Color pieColor;

  ItemAnalysisChart(this.subjects, this.numbers, this.pieColor);
}
