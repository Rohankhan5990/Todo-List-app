import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fi_a3_rohan/widgets/design/todo_home_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../constants/static.dart';

class TodoFirebaseHelper {
  final CollectionReference _usersCollection = FirebaseFirestore.instance
      .collection("users")
      .doc(TodoFirebaseHelper.uid)
      .collection('userdata');

  void addDataToFirestore(String task, String url) async {
    try {
      final payload = {'task': task, 'url': url};
      await _usersCollection
          .doc(DateTime.now().microsecondsSinceEpoch.toString())
          .set(payload);
    } catch (e) {
      rethrow;
    }
  }

  static const userCollection = AppConstants.usersCollection;
  static final _firestore = FirebaseFirestore.instance;
  static String uid = '';
  final users = _firestore.collection(userCollection).doc(uid).get();
  static Stream<QuerySnapshot<Map<String, dynamic>>> fetchUser() {
    try {
      return _firestore
          .collection(userCollection)
          .doc(uid)
          .collection('userdata')
          .snapshots()
          .asBroadcastStream();
    } catch (e) {
      debugPrint(e.toString());
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

  void updateDataToFirestore(String id, String text, String url) async {
    try {
      await _usersCollection.doc(id).update({"task": text, "url": url});
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
