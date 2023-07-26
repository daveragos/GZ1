import 'package:flutter/foundation.dart';
import 'package:game_zoning/database/db_management.dart';

class IncomeData with ChangeNotifier {
  DateTime dateTime = DateTime.now();
  String _getDate = '';

  String get getDate => _getDate;

  set getDate(String value) {
    _getDate = value;
  }

  IncomeData() {
    getDate = '${dateTime.year}-${dateTime.month}-${dateTime.day}';
  }

  final firestoreManager = FirestoreManager();
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
  void addIncome(Map<String, double> incomeMap, String pickedDate) {
    // _allIncomeDataMap[key] = (_allIncomeDataMap[key] ?? 0) + value;
    print(
        '@@@@@@@@@@@@@@@@ $pickedDate ##################### $incomeMap @@@@@@@@@@@@@@@@@@@@@@@');
    firestoreManager.updateDataInFirestore(pickedDate, incomeMap);
    print(
        '################## $pickedDate @@@@@@@@@@@@@@@@@@@@@@@@ $incomeMap #######################');

    notifyListeners();
  }

  double addAllIncome() {
    double totalIncome = 0;
    _allIncomeDataMap.forEach((key, value) {
      totalIncome += value;
    });
    return totalIncome;
  }
}
