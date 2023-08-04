// ignore_for_file: prefer_const_constructors

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:game_zoning/database/db_management.dart';
import 'package:provider/provider.dart';
import '../data/income_data.dart';
import 'bar_data.dart';

class MyBarGraph extends StatefulWidget {
  const MyBarGraph({super.key});

  @override
  State<MyBarGraph> createState() => _MyBarGraphState();
}

class _MyBarGraphState extends State<MyBarGraph> {
  @override
  Widget build(BuildContext context) {
    final incomeData = Provider.of<IncomeData>(context);

    final firestoreManager = FirestoreManager();

    return FutureBuilder<Map<String, double?>>(
      future: firestoreManager.getDataFromFirestore(incomeData.getDate),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for data, you can show a loading indicator
          return Center(
            child: CircularProgressIndicator(
              value:
                  null, // If value is null or not provided, the indicator will spin continuously.
              strokeWidth: 4, // Thickness of the circle.
              backgroundColor:
                  Colors.grey[200], // Background color of the circle.
              valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.blue), // Color of the progress indicator.
            ),
          );
        } else if (snapshot.hasError) {
          // If an error occurred while fetching data, handle it here
          print('Error: ${snapshot.error}');
          return Text('Error loading data');
        } else {
          // If data is available, return the BarChart widget
          Map<String, double?> dataMap = snapshot.data!;
          //maxY
          double? getMaximumValue() {
            double? maxValue = double
                .negativeInfinity; // Start with the smallest possible value
            // Iterate through the map to find the maximum value
            dataMap.forEach((key, value) {
              if (value != null && value > maxValue!) {
                maxValue = value;
              }
            });

            if (maxValue == double.negativeInfinity) {
              return 600; // If all values are null, return null as the maximum value
            }

            return maxValue! + 50;
          }

          BarData myBarData = BarData(
            bettingAmount: dataMap['betting'],
            coffeeAmount: dataMap['coffee'],
            dstvAmount: dataMap['dstv'],
            poolAmount: dataMap['pool'],
            psAmount: dataMap['ps'],
            vrAmount: dataMap['vr'],
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
                    getTitlesWidget: getBottomTitles,
                  ),
                ), // ... (titles configuration)
              ),
              borderData: FlBorderData(
                show: false,
              ),
              barGroups: myBarData.barData
                  .map(
                    (data) => BarChartGroupData(
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
                    ),
                  )
                  .toList(),
            ),
          );
        }
      },
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

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
