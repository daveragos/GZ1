import 'package:cloud_firestore/cloud_firestore.dart';

class ManageData {
//create
  Future<void> addIncomeData2DB(
      DateTime date, Map<String, double> incomeData) async {
    String formattedDate = '${date.year}-${date.month}-${date.day}';
    await FirebaseFirestore.instance
        .collection('game_income_records')
        .doc(formattedDate)
        .set(incomeData);
  }

//read
  Future<Map<String, double>?> getIncomeDataFromDB(DateTime date) async {
    String formattedDate = '${date.year}-${date.month}-${date.day}';
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('game_income_records')
        .doc(formattedDate)
        .get();
    if (snapshot.exists) {
      return snapshot.data() as Map<String, double>;
    } else {
      return null;
    }
  }

//update
  Future<void> updateIncomeDataFromDB(
      DateTime date, Map<String, double> updatedIncomeData) async {
    String formattedDate = '${date.year}-${date.month}-${date.day}';
    await FirebaseFirestore.instance
        .collection('game_income_records')
        .doc(formattedDate)
        .update(updatedIncomeData);
  }

//delete
  Future<void> deleteIncomeDataFromDB(DateTime date) async {
    String formattedDate = '${date.year}-${date.month}-${date.day}';
    await FirebaseFirestore.instance
        .collection('game_income_records')
        .doc(formattedDate)
        .delete();
  }
}
