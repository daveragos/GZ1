// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:game_zoning/data/income_data.dart';
import 'package:game_zoning/database/data_management.dart';
import 'package:provider/provider.dart';

import '../data/date_data.dart';

class AddingPage extends StatelessWidget {
  final List<String> dropdownItems = [
    'betting',
    'coffee',
    'dstv',
    'pool',
    'ps',
    'vr',
  ];

  @override
  Widget build(BuildContext context) {
    String dropdownValue = dropdownItems[0];
    ManageData dBase = ManageData();
    double? textFormFieldValue;
    Map<String, double> incomeDataMap = {
      '${dropdownValue}Amount': textFormFieldValue!
    };
    final dateProvider = Provider.of<DateProvider>(context);
    final incomeData = Provider.of<IncomeData>(context);

    DateTime selectedDate = dateProvider.selectedDate;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: dropdownValue,
              items: dropdownItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(item.toUpperCase()),
                      ))
                  .toList(),
              onChanged: (newValue) {
                dropdownValue = newValue!;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a double value',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                textFormFieldValue = double.tryParse(value) ?? 0.0;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                dBase.addIncomeData2DB(selectedDate, incomeDataMap);
                incomeData.addIncomeForDate(selectedDate, incomeDataMap);
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
