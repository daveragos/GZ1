import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreManager {
  Future<Map<String, double>> getDataFromFirestore(String documentId) async {
    try {
      final DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('all_income_records')
          .doc(documentId)
          .get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        print('Received data from Firestore: $data');

        // Map the data to a new Map<String, double>
        Map<String, double> dataMap = {};
        data.forEach((key, value) {
          if (value is int) {
            // Convert int values to double
            dataMap[key] = value.toDouble();
          } else if (value is double) {
            dataMap[key] = value;
          }
        });

        return dataMap;
      } else {
        print(
            '@@@@@@@@@@@@@@@@@@@@@@@@@@@ Document does not exist in Firestore. @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
        return {};
      }
    } catch (e) {
      print(
          '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Error fetching data: $e @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
      return {};
    }
  }

  Future<void> updateDataInFirestore(
      String documentId, Map<String, double> newData) async {
    try {
      await FirebaseFirestore.instance
          .collection('all_income_records')
          .doc(documentId)
          .update(newData);
    } catch (e) {
      print('Error updating data: $e');
    }
  }

  Future<void> deleteDataFromFirestore(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('all_income_records')
          .doc(documentId)
          .delete();
    } catch (e) {
      print('Error deleting data: $e');
    }
  }
}
