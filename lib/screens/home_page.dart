// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:game_zoning/Bar_Graph/bar_graph.dart';
import 'package:provider/provider.dart';

import '../data/income_data.dart';

//input: list of games =[dstv, pool, ps, coffee, betting, vr]

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of game income

  @override
  Widget build(BuildContext context) {
    final incomeData = Provider.of<IncomeData>(context);
    double totalIncome = incomeData.addAllIncome();

    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text(
            '$totalIncome',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          MyBarGraph(),
        ],
      ),
    );
  }
}
