import 'package:flutter/foundation.dart';

class IncomeData with ChangeNotifier {
  Map<String, double> _allIncomeDataMap = {
    'bettingAmount': 0,
    'coffeeAmount': 0,
    'dstvAmount': 0,
    'poolAmount': 0,
    'psAmount': 0,
    'vrAmount': 0,
  };

  get allIncomeDataMap => _allIncomeDataMap;

  //adding value to the map
  void addIncome(String key, double value) {
    _allIncomeDataMap[key] = (_allIncomeDataMap[key] ?? 0) + value;
    notifyListeners();
  }

  double addAllIncome() {
    double totalIncome = 0;
    _allIncomeDataMap.forEach((key, value) {
      totalIncome += value;
    });
    return totalIncome;
  }

  List<double> allGamesIncome = [
    120,
    133,
    432,
    534,
    121,
    213,
  ];
}
