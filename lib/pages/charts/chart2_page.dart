import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gráfico de barras"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("GRÁFICO 2"),
            Divider(),
            Container(
              height: 300,
              // child: BarChart(),
            )
          ],
        ),
      ),
    );
  }
}
