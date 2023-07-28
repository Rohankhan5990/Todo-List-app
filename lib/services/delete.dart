import 'package:cloud_firestore/cloud_firestore.dart';

class DataDelete {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  void deleteDataToFirestore(String id) async {
    try {
      await _usersCollection.doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }
}
