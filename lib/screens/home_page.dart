// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:game_zoning/Bar_Graph/bar_graph.dart';
import 'package:provider/provider.dart';

import '../data/date_data.dart';
import '../data/income_data.dart';

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
      firstDate: DateTime(2023),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // Do something with the selected date if needed
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateProvider = Provider.of<DateProvider>(context);
    final incomeData = Provider.of<IncomeData>(context);

    DateTime selectedDate = dateProvider.selectedDate;
    double totalIncome = incomeData.getTotalIncomeForDate(selectedDate);

    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          // Show the total income value in a Card at the top
          Card(
            margin: EdgeInsets.all(8.0),
            color: Colors.white,
            shadowColor: Colors.grey[800],
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total Income: \$${totalIncome.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          MyBarGraph(
            selectedDate: selectedDate,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _selectDate(context),
        tooltip: 'Select Date',
        child: Icon(Icons.calendar_today),
      ),
    );
  }
}
