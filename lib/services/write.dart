import 'package:cloud_firestore/cloud_firestore.dart';

class DataWrite {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  void addDataToFirestore(String task) async {
    try {
      await _usersCollection.add(
        {
          'task': task,
        },
      );
      print('Data added successfully!');
    } catch (e) {
      print('Error adding data: $e');
    }
  }
}
