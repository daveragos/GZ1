// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:game_zoning/Bar_Graph/bar_graph.dart';

//input: list of games =[dstv, pool, ps, coffee, betting, vr]

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of game income
  List<double> allGamesIncome = [
    120,
    133,
    432,
    534,
    121,
    213,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Center(
        child: SizedBox(
          height: 300,
          child: MyBarGraph(allGamesIncome: allGamesIncome),
        ),
      ),
    );
  }
}
