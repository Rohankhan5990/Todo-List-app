import 'package:fi_a3_rohan/screens/fi_a3_rohan_home.dart';
import 'package:fi_a3_rohan/screens/fi_a3_rohan_login.dart';
import 'package:fi_a3_rohan/screens/fi_a3_rohan_splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/fi_a3_rohan_textfield_email.dart';
import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FiA3RohanToDoList());
}

class FiA3RohanToDoList extends StatelessWidget {
  const FiA3RohanToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FiA3RohanHome(),
    );
  }
}
