import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chart 3"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("CHART 3"),
            Divider(),
            Container(
              height: 300,
              child: PieChart(
                swapAnimationCurve: Curves.easeInOut,
                swapAnimationDuration: Duration(microseconds: 800),
                PieChartData(
                  // sectionsSpace: 50,
                  centerSpaceRadius: 10,
                  sections: [
                    PieChartSectionData(
                      value: 50,
                      color: Colors.red,
                    ),
                    PieChartSectionData(
                        value: 25,
                        color: Colors.cyan,
                        title: "Aprobados",
                        showTitle: true,
                        titlePositionPercentageOffset: 2),
                    PieChartSectionData(
                        value: 25,
                        color: Colors.yellow,
                        // title: "Aprobados",
                        showTitle: true,
                        titlePositionPercentageOffset: 2),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
