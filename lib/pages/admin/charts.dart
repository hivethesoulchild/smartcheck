import 'package:flutter/material.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;


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
