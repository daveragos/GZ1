// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/income_data.dart';
import 'bar_data.dart';

class MyBarGraph extends StatelessWidget {
  final DateTime selectedDate;
  const MyBarGraph({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    final incomeData = Provider.of<IncomeData>(context, listen: false);

    var axisTitlesFalse = AxisTitles(sideTitles: SideTitles(showTitles: false));
    BarData myBarData = BarData(
      bettingAmount: 231,
      coffeeAmount: 231,
      dstvAmount: 231,
      poolAmount: 231,
      psAmount: 321,
      vrAmount: 123,
    );
    myBarData.initializeBarData();
    return SizedBox(
      height: 300,
      child: BarChart(
        BarChartData(
          maxY: 500,
          minY: 0,
          gridData: FlGridData(
            show: false,
          ),
          titlesData: FlTitlesData(
            show: true,
            topTitles: axisTitlesFalse,
            leftTitles: axisTitlesFalse,
            rightTitles: axisTitlesFalse,
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
