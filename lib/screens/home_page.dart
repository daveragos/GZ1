// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:game_zoning/Bar_Graph/bar_graph.dart';
import 'package:game_zoning/database/db_management.dart';
import 'package:provider/provider.dart';

import '../data/income_data.dart';

//input: list of games =[dstv, pool, ps, coffee, betting, vr]

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        Provider.of<IncomeData>(context, listen: false).getDate =
            '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final incomeData = Provider.of<IncomeData>(context);
    final firestoreManager = FirestoreManager();

    Future<double> getTotalIncome() async {
      return await firestoreManager.calculateSumOfADate(incomeData.getDate);
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _selectDate(context),
        tooltip: 'Select Date',
        child: Icon(Icons.calendar_today),
      ),
      backgroundColor: Colors.blue[300],
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          FutureBuilder<double>(
            future: getTotalIncome(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text(
                  'Loading...', // Show a loading indicator while fetching data
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                );
              } else if (snapshot.hasError) {
                return Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                );
              } else {
                // Show the actual totalIncome value from the snapshot data
                double totalIncome = snapshot.data!;
                return Text(
                  "The Total Income of ${incomeData.getDate} is : $totalIncome",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                );
              }
            },
          ),
          SizedBox(
            height: 100,
          ),
          SizedBox(height: 250, child: MyBarGraph()),
        ],
      ),
    );
  }
}
