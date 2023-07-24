import 'package:flutter/foundation.dart';

class IncomeData with ChangeNotifier {
  Map<DateTime, Map<String, double>> _allIncomeDataMap = {};

  // Adding value to the map for a specific date
  void addIncomeForDate(DateTime date, Map<String, double> incomeDataMap) {
    _allIncomeDataMap[date] ??= {};

    incomeDataMap.forEach((key, value) {
      _allIncomeDataMap[date]![key] =
          (_allIncomeDataMap[date]![key] ?? 0) + value;
    });

    notifyListeners();
  }

  // Get the total income for a specific date
  double getTotalIncomeForDate(DateTime date) {
    double totalIncome = 0;
    _allIncomeDataMap[date]?.forEach((key, value) {
      totalIncome += value;
    });
    return totalIncome;
  }

  // Max getter method for all dates
  double get max {
    if (_allIncomeDataMap.isEmpty) {
      return 0.0; // Return 0.0 if the map is empty
    }

    double maxValue = _allIncomeDataMap.values
        .map((dateData) => dateData.values
            .reduce((value, element) => value > element ? value : element))
        .reduce((value, element) => value > element ? value : element);
    return maxValue;
  }
}
