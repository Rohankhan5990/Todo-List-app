import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

import '../constants/static.dart';

class TodoFirebaseHelper {
  static final _firestore = FirebaseFirestore.instance;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  static const userCollection = AppConstants.usersCollection;
  PlatformFile? platformFile;

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

  static Future<List<Map<String, dynamic>>> getData() async {
    try {
      final users = await _firestore.collection(userCollection).get();
      return users.docs.map((user) => user.data()).toList();
    } catch (e) {
      rethrow;
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchUser() {
    try {
      return _firestore
          .collection(userCollection)
          .snapshots()
          .asBroadcastStream();
    } catch (e) {
      rethrow;
    }
  }

  void deleteDataToFirestore(String id) async {
    try {
      await _usersCollection.doc(id).delete();
    } catch (e) {
      rethrow;
    }
  }

  void updateDataToFirestore(String id, String text) async {
    try {
      await _usersCollection.doc(id).update({"task": text});
    } catch (e) {
      rethrow;
    }
  }
}
