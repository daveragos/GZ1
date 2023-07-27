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
      final DocumentReference docRef = FirebaseFirestore.instance
          .collection('all_income_records')
          .doc(documentId);

      // Use SetOptions(merge: true) to add the document if it doesn't exist
      // or update the existing document with the new data
      await docRef.set(newData, SetOptions(merge: true));
    } catch (e) {
      print(
          '@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ Error fetching data: $e @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
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

  Future<double> calculateSumOfADate(String pickedDate) async {
    DocumentReference<Map<String, dynamic>> documentRef = FirebaseFirestore
        .instance
        .collection('all_income_records')
        .doc(pickedDate);

    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await documentRef.get();
      if (snapshot.exists) {
        double sum = 0.0;
        Map<String, dynamic> data = snapshot.data()!;
        data.forEach((key, value) {
          if (value is num) {
            // Only add numeric values
            sum += value.toDouble();
          }
        });
        return sum;
      } else {
        print('@@@@@@@@@@@@@@@@@@ Document does not exist @@@@@@@@@@@@@@@@@');
        return 0.0;
      }
    } catch (e) {
      print(
          '######################### Error calculating sum: $e #########################');
      return 0.0;
    }
  }
}
