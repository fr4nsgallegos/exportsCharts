import 'dart:math';

import 'package:exportsandcharts/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Chart1Page extends StatefulWidget {
  @override
  State<Chart1Page> createState() => _Chart1PageState();
}

class _Chart1PageState extends State<Chart1Page> {
  late List<DataModel> lista;

  List<DataModel> _generateData(int max) {
    final random = new Random();
    return List.generate(
      31,
      (index) => DataModel(
          date: DateTime(2024, 1, index + 1), valor: random.nextDouble() * max),
    );
  }

  Widget _graph() {
    final spots = _generateData(200)
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value.valor))
        .toList();
    // spots.forEach((element) {
    // print(element);
    // });
    print(spots.length);
    final spots2 = _generateData(300)
        .asMap()
        .entries
        .map(
          (e) => FlSpot(e.key.toDouble(), e.value.valor),
        )
        .toList();
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            dotData: FlDotData(show: false),
            color: Colors.red,
          ),
          LineChartBarData(
            spots: spots2,
            dotData: FlDotData(show: false),
            color: Colors.cyan,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chart 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("GRÁFICO 1"),
            Divider(),
            Container(
              height: 300,
              child: _graph(),
            )
          ],
        ),
      ),
    );
  }
}
