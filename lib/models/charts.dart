import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';

// class APIHandler {
//   static Future<List<BatchChart>> fetchBatchChartData() async {
//     final response = await http.get(Uri.parse('API_URL_HERE'));
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       List<BatchChart> batchChartData = [];
//       // Parse the data and create BatchChart objects
//       // and add them to the batchChartData list
//       // Example:
//       // for (var item in data) {
//       //   batchChartData.add(BatchChart(item['batch'], item['applicants'], item['barColor']));
//       // }
//       return batchChartData;
//     } else {
//       throw Exception('Failed to fetch batch chart data');
//     }
//   }
// }

class ItemChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;

  ItemChart(this.seriesList);

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: false,
    );
  }
}
