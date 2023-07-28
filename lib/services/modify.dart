import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateData {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  void updateDataToFirestore(String id, String text) async {
    try {
      await _usersCollection.doc(id).update({"task": text});
    } catch (e) {
      rethrow;
    }
  }
}
