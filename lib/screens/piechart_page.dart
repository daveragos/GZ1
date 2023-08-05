import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class InteractivePieChart extends StatefulWidget {
  @override
  _InteractivePieChartState createState() => _InteractivePieChartState();
}

class _InteractivePieChartState extends State<InteractivePieChart> {
  late PieChartData _pieChartData;

  @override
  void initState() {
    super.initState();
    _pieChartData = preparePieChartData();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: PieChart(
        _pieChartData,
        swapAnimationDuration: Duration(milliseconds: 800),
      ),
    );
  }
}

PieChartData preparePieChartData() {
  List<PieChartSectionData> sections = [
    PieChartSectionData(
      color: Colors.blue,
      value: 25,
      title: '25%',
      radius: 50,
      titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    PieChartSectionData(
      color: Colors.green,
      value: 30,
      title: '30%',
      radius: 45,
      titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    PieChartSectionData(
      color: Colors.red,
      value: 45,
      title: '45%',
      radius: 40,
      titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ];

  return PieChartData(
      sections: sections,
      centerSpaceRadius: 30,
      sectionsSpace: 0,
      startDegreeOffset: -90,
      pieTouchData: PieTouchData(
        enabled: true, // Enable touch interactions
        touchCallback: (event, response) {
          // Custom logic to handle the touch event
          if (event is FlLongPressEnd || event is FlPanEndEvent) {
            // User has released the touch, update the chart data here
          }
        },
        mouseCursorResolver: (event, response) {
          // Custom logic to determine the mouse cursor for web platforms
          return SystemMouseCursors.click; // For example, use a click cursor
        },
        longPressDuration:
            Duration(milliseconds: 500), // Customize long-press duration
      ));
}
