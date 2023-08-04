// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LineCharter extends StatelessWidget {
  final List<Color> lineColors = [
    Colors.deepPurple,
    Colors.brown,
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              TabBar(
                tabs: [
                  for (var icon in [
                    FontAwesomeIcons.dice,
                    FontAwesomeIcons.mugSaucer,
                    FontAwesomeIcons.tv,
                    FontAwesomeIcons.eight,
                    FontAwesomeIcons.playstation,
                    FontAwesomeIcons.vrCardboard,
                  ])
                    Tab(
                      icon: FaIcon(
                        icon,
                        color: Colors.deepPurple,
                      ),
                    ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    for (var spots in [
                      randomData(),
                      randomData(),
                      randomData(),
                      randomData(),
                      randomData(),
                      randomData(),
                    ])
                      FractionallySizedBox(
                        heightFactor: 0.5,
                        widthFactor: 1,
                        alignment: Alignment.topCenter,
                        child: AspectRatio(
                          aspectRatio: 1.5,
                          child: LineChart(
                            LineChartData(
                              lineTouchData: LineTouchData(
                                touchCallback: (p0, p1) {},
                                touchTooltipData: LineTouchTooltipData(),
                              ),
                              minX: 0,
                              minY: 0,
                              maxX: 6,
                              maxY: 6,
                              gridData: FlGridData(
                                show: true,
                                getDrawingHorizontalLine: (value) {
                                  return FlLine(
                                    color: Colors.blueAccent,
                                    strokeWidth: 1,
                                  );
                                },
                                getDrawingVerticalLine: (value) {
                                  return FlLine(
                                    color: Colors.blueAccent,
                                    strokeWidth: 1,
                                  );
                                },
                              ),
                              titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                      showTitles: true,
                                      getTitlesWidget: getBottomTitles),
                                ), // ... (titles configuration)
                              ),
                              lineBarsData: [
                                LineChartBarData(
                                  spots: spots,
                                  isCurved: true,
                                  dotData: FlDotData(show: false),
                                  barWidth: 4,
                                  color: lineColors[
                                      random.nextInt(lineColors.length)],
                                  belowBarData: BarAreaData(
                                    show: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final Random random = Random();

  List<FlSpot> randomData() {
    return [
      for (int i = 0; i < 8; i++)
        FlSpot(i.toDouble(), random.nextDouble() * 5 + 1),
    ];
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 7);

  String formatDate() {
    DateTime date = DateTime.now();
    final day = date.day.toString().padLeft(2, '0');
    return '$day';
  }

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

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
