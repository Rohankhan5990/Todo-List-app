import 'package:cloud_firestore/cloud_firestore.dart';

class DataWrite {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  void addDataToFirestore(String task) async {
    try {
      final payload = {'task': task};
      await _usersCollection
          .doc(DateTime.now().microsecondsSinceEpoch.toString())
          .set(payload);
    } catch (e) {
      rethrow;
    }
  }
}
