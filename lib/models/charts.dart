import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';

class APIHandler {
  static Future<List<BatchChart>> fetchBatchChartData() async {
    final response = await http.get(Uri.parse('API_URL_HERE'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<BatchChart> batchChartData = [];
      // Parse the data and create BatchChart objects
      // and add them to the batchChartData list
      // Example: 
      // for (var item in data) {
      //   batchChartData.add(BatchChart(item['batch'], item['applicants'], item['barColor']));
      // }
      return batchChartData;
    } else {
      throw Exception('Failed to fetch batch chart data');
    }
  }
}


class Chart extends StatefulWidget {
  final List<BatchChart> itemDummy;
  final List<ItemAnalysisChart> items;

  const Chart({
    Key? key,
    required this.itemDummy,
    required this.items,
  }) : super(key: key);

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
        data: widget.itemDummy,
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
                  child: Text("Sort by date"),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: Text("Sort by school"),
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
          children: List.generate(4, (index) {
            return Center(
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
            );
          }),
        ),
      ),
    );
  }
}

// TODO: API Integration
// class _ChartState extends State<Chart> {
//   double percent = 0.0;
//   late Future<List<BatchChart>> batchChartDataFuture;

//   @override
//   void initState() {
//     batchChartDataFuture = APIHandler.fetchBatchChartData();
//     Timer? timer;
//     timer = Timer.periodic(Duration(milliseconds: 1000), (_) {
//       setState(() {
//         percent += 10;
//         if (percent >= 50) {
//           timer?.cancel();
//           // percent=0;
//         }
//       });
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<BatchChart>>(
//       future: batchChartDataFuture,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           List<BatchChart> batchChartData = snapshot.data!;
//           // Build the widget using the batchChartData
//           // Example:
//           // List<charts.Series<BatchChart, String>> series = [
//           //   charts.Series(
//           //     data: batchChartData,
//           //     id: "Correct Answer",
//           //     domainFn: (BatchChart cluster, _) => cluster.batch,
//           //     measureFn: (BatchChart cluster, _) => cluster.applicants,
//           //     colorFn: (BatchChart cluster, _) =>
//           //         charts.ColorUtil.fromDartColor(cluster.barColor),
//           //   ),
//           // ];
//           // Rest of the build method...
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         }
//         return CircularProgressIndicator();
//       },
//     );
//   }
// }


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
