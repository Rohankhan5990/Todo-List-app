import 'dart:async';

import 'package:fi_a3_rohan/screens/home/todo_home.dart';
import 'package:fi_a3_rohan/screens/login/todo_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void login(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FiA3RohanHome()));
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FiA3RohanLogin()));
      });
    }
  }
}
