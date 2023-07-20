import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final List allGamesIncome;
  const MyBarGraph({super.key, required this.allGamesIncome});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      bettingAmount: allGamesIncome[0],
      coffeeAmount: allGamesIncome[1],
      dstvAmount: allGamesIncome[2],
      poolAmount: allGamesIncome[3],
      psAmount: allGamesIncome[4],
      vrAmount: allGamesIncome[5],
    );
    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
        maxY: 600,
        minY: 0,
        gridData: FlGridData(
          show: false,
        ),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                  showTitles: true, getTitlesWidget: getBottomTitles)),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        barGroups: myBarData.barData
            .map((data) => BarChartGroupData(
                  x: data.x,
                  barRods: [
                    BarChartRodData(
                      toY: data.y,
                      color: Colors.grey[800],
                      width: 25,
                      borderRadius: BorderRadius.circular(4),
                      backDrawRodData: BackgroundBarChartRodData(
                          show: true, toY: 600, color: Colors.grey[100]),
                    ),
                  ],
                ))
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14);

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Betting', style: style);
      break;
    case 1:
      text = const Text('Coffee', style: style);
      break;
    case 2:
      text = const Text('DSTV', style: style);
      break;
    case 3:
      text = const Text('Pool', style: style);
      break;
    case 4:
      text = const Text('PS', style: style);
      break;
    case 5:
      text = const Text('VR', style: style);
      break;
    default:
      text = const Text('', style: style);
      break;
  }

  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
