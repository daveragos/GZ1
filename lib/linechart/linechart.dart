// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatefulWidget {
  List<FlSpot> spots;
  LineChartWidget({required this.spots});

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      chartData,
    );
  }

  LineChartData get chartData => LineChartData(
        gridData: gridData,
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: lineBarsData,
        minX: 0,
        minY: 0,
        maxX: 14,
        maxY: 4,
      );

  FlTitlesData get titlesData => FlTitlesData(
      bottomTitles: AxisTitles(sideTitles: bottomTitles()),
      leftTitles: AxisTitles(sideTitles: leftTitles()),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)));

  Widget leftTitlesWidget(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    );
    String text;
    switch (value.toInt()) {
      case 1:
        text = '1m';
        break;
      case 2:
        text = '2m';
        break;
      case 3:
        text = '3m';
        break;
      case 4:
        text = '4m';
        break;
      case 5:
        text = '5m';
        break;
      default:
        return Container();
    }
    return Text(
      text,
      style: style,
      textAlign: TextAlign.center,
    );
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitlesWidget,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitlesWidget(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    );

    Widget text;

    switch (value.toInt()) {
      case 1:
        text = Text(
          '2020',
          style: style,
        );
        break;
      case 7:
        text = Text(
          '2021',
          style: style,
        );
        break;
      case 11:
        text = Text(
          '2023',
          style: style,
        );
        break;
      default:
        text = const Text('');
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles bottomTitles() => SideTitles(
        getTitlesWidget: bottomTitlesWidget,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 4,
          ),
          left: BorderSide(color: Colors.grey),
          top: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData1 => LineChartBarData(
        isCurved: true,
        color: Colors.purple,
        barWidth: 6,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: widget.spots,
      );

  List<LineChartBarData> get lineBarsData => [lineChartBarData1];
}
