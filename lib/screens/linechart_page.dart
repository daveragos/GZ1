// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game_zoning/linechart/linechart.dart';

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
                        color: Color.fromARGB(255, 98, 0, 255),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              AspectRatio(
                aspectRatio: 1,
                // Use Expanded to make sure TabBarView takes remaining space
                child: TabBarView(
                  children: [
                    Container(
                      color: Colors.blueGrey,
                      height: 400,
                      width: 400,
                      child: LineChartWidget(
                        spots: [
                          FlSpot(1, 1),
                          FlSpot(3, 1.5),
                          FlSpot(5, 1.6),
                          FlSpot(7, 3.4),
                          FlSpot(10, 2),
                          FlSpot(12, 2.5),
                          FlSpot(13, 1.6),
                        ],
                      ),
                    ),
                    // Add other containers/widgets for other tabs if needed
                    Container(
                      color: Colors.amber,
                      height: 400,
                      width: 400,
                      child: LineChartWidget(
                        spots: [
                          FlSpot(1, 1),
                          FlSpot(2, 1),
                          FlSpot(4, 1.4),
                          FlSpot(5, 3),
                          FlSpot(7, 2.4),
                          FlSpot(10, 3.4),
                          FlSpot(13, 3),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.blueGrey,
                      height: 400,
                      width: 400,
                      child: LineChartWidget(
                        spots: [
                          FlSpot(1, 1),
                          FlSpot(3, 1.5),
                          FlSpot(5, 1.6),
                          FlSpot(7, 3.4),
                          FlSpot(10, 2),
                          FlSpot(12, 2.5),
                          FlSpot(13, 1.6),
                        ],
                      ),
                    ),
                    // Add other containers/widgets for other tabs if needed
                    Container(
                      color: Colors.amber,
                      height: 400,
                      width: 400,
                      child: LineChartWidget(
                        spots: [
                          FlSpot(1, 1),
                          FlSpot(2, 1),
                          FlSpot(4, 1.4),
                          FlSpot(5, 3),
                          FlSpot(7, 2.4),
                          FlSpot(10, 3.4),
                          FlSpot(13, 3),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.blueGrey,
                      height: 400,
                      width: 400,
                      child: LineChartWidget(
                        spots: [
                          FlSpot(1, 1),
                          FlSpot(3, 1.5),
                          FlSpot(5, 1.6),
                          FlSpot(7, 3.4),
                          FlSpot(10, 2),
                          FlSpot(12, 2.5),
                          FlSpot(13, 1.6),
                        ],
                      ),
                    ),
                    // Add other containers/widgets for other tabs if needed
                    Container(
                      color: Colors.amber,
                      height: 400,
                      width: 400,
                      child: LineChartWidget(
                        spots: [
                          FlSpot(1, 1),
                          FlSpot(2, 1),
                          FlSpot(4, 1.4),
                          FlSpot(5, 3),
                          FlSpot(7, 2.4),
                          FlSpot(10, 3.4),
                          FlSpot(13, 3),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
