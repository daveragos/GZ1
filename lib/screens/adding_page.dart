// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/income_data.dart';

class AddingPage extends StatefulWidget {
  const AddingPage({super.key});

  @override
  State<AddingPage> createState() => _AddingPageState();
}

class _AddingPageState extends State<AddingPage> {
  String selectedValue = dropdownItems[0].value!;
  double enteredValue = 0.0;

  final _dropdownFormKey = GlobalKey<FormState>();

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
        // Do something with the selected date if needed
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final incomeData = Provider.of<IncomeData>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => _selectDate(context),
        tooltip: 'Select Date',
        child: Icon(Icons.calendar_today),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(25.0),
              child: Text(
                'checking the container',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Form(
                key: _dropdownFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        filled: true,
                        fillColor: Colors.grey,
                      ),
                      validator: (value) =>
                          value == null ? "Select a country" : null,
                      dropdownColor: Colors.grey,
                      value: selectedValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: dropdownItems,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: (value) =>
                          value == null ? "enter a value" : null,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      onChanged: (newValue) {
                        setState(() {
                          // If newValue is not null, try to parse it as a double
                          double? parsedValue =
                              double.tryParse(newValue.toString());

                          if (parsedValue != null) {
                            // If parsing is successful, update the selectedValue
                            enteredValue = parsedValue;
                          } else {
                            // If parsing fails, handle the error (e.g., show a message to the user)
                            print('Error: Invalid double value selected.');
                          }
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_dropdownFormKey.currentState!.validate()) {
                          //valid flow
                          Map<String, double> incomeMap = {
                            selectedValue: enteredValue,
                          };
                          incomeData.getDate =
                              '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}';
                          incomeData.addIncome(
                            incomeMap,
                            '${selectedDate.year}-${selectedDate.month}-${selectedDate.day}',
                          );
                        }
                      },
                      child: Text("Submit"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
      value: "betting",
      child: Text("BETTING"),
    ),
    DropdownMenuItem(
      value: "coffee",
      child: Text("COFFEE"),
    ),
    DropdownMenuItem(
      value: "dstv",
      child: Text("DSTV"),
    ),
    DropdownMenuItem(
      value: "pool",
      child: Text("POOL"),
    ),
    DropdownMenuItem(
      value: "ps",
      child: Text("PS"),
    ),
    DropdownMenuItem(
      value: "vr",
      child: Text("VR"),
    ),
  ];
  return menuItems;
}
