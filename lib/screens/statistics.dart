import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                minY: 0,
                maxY: 11,
                barGroups: [
                  BarChartGroupData(x: 25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
