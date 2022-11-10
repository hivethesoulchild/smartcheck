import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/widgets.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  static final List<BatchChart> itemdummy = [
    BatchChart('Item 1', 100, HexColor('35408F')),
    BatchChart('Item 2', 200, HexColor('35408F')),
    BatchChart('Item 3', 300, HexColor('35408F')),
    BatchChart('Item 4', 250, HexColor('35408F')),
    BatchChart('Item 5', 150, HexColor('35408F')),
    BatchChart('Item 6', 400, HexColor('35408F')),
    BatchChart('Item 7', 100, HexColor('35408F')),
    BatchChart('Item 8', 360, HexColor('35408F')),
    BatchChart('Item 9', 240, HexColor('35408F')),
    BatchChart('Item 10', 210, HexColor('35408F')),
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
    timer = Timer.periodic(Duration(milliseconds: 1000), (_) {
      setState(() {
        percent += 10;
        if (percent >= 50) {
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
        data: Chart.itemdummy,
        id: "Correct Answer",
        domainFn: (BatchChart cluster, _) => cluster.batch,
        measureFn: (BatchChart cluster, _) => cluster.applicants,
        colorFn: (BatchChart cluster, _) =>
            charts.ColorUtil.fromDartColor(cluster.barColor),
      ),
    ];


    return DefaultTabController(
      length: 4,
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
          actions: [
            PopupMenuButton(
              icon: Icon(
                Icons.sort,
                color: Colors.grey,
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("Sort by number"),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: Text("Sort by items"),
                  onTap: () {},
                ),
              ],
            ),
          ],
          bottom: TabBar(
            physics: BouncingScrollPhysics(),
            labelColor: HexColor('#35408f'),
            indicatorColor: HexColor('#35408f'),
            labelStyle: GoogleFonts.poppins(fontSize: 17,),
            unselectedLabelStyle: GoogleFonts.poppins(fontSize: 17,),
            tabs: [
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
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      'Item Analysis',
                      style: GoogleFonts.poppins(),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: charts.BarChart(
                        series,
                        behaviors: [new charts.SeriesLegend()],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      'Item Analysis',
                      style: GoogleFonts.poppins(),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: charts.BarChart(
                        series,
                        behaviors: [new charts.SeriesLegend()],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      'Item Analysis',
                      style: GoogleFonts.poppins(),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: charts.BarChart(
                        series,
                        behaviors: [new charts.SeriesLegend()],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      'Item Analysis',
                      style: GoogleFonts.poppins(),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: charts.BarChart(
                        series,
                        behaviors: [new charts.SeriesLegend()],
                      ),
                    ),
                  ],
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
