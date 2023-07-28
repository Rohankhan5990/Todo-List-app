import 'package:fi_a3_rohan/core/fi_a3_rohan_textfield_email.dart';
import 'package:fi_a3_rohan/core/fi_a3_rohan_textfield_password.dart';
import 'package:fi_a3_rohan/screens/fi_a3_rohan_home.dart';
import 'package:fi_a3_rohan/utlis/fi_a3_rohan_constants.dart';
import 'package:flutter/material.dart';
import '../core/fi_a3_rohan_button.dart';
import '../services/read.dart';
import '../utlis/fi_a3_rohan_images.dart';

class FiA3RohanLogin extends StatelessWidget {
  const FiA3RohanLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Center(
        child: Column(
          children: [
            FiA3RohanSizedBox.height40,
            FiA3RohanSizedBox.height40,
            FiA3RohanSizedBox.height40,
            Image.asset(
              FiA3RohanImages.clock,
              width: 80,
            ),
            const Text(
              "Login Now",
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 2),
            ),
            FiA3RohanSizedBox.height10,
            const Text(
              "Please enter the details below to continue",
              style: TextStyle(fontSize: 17, color: FiA3RohanColors.lightgrey),
            ),
            FiA3RohanSizedBox.height40,
            FiA3RohanSizedBox.height10,
            const FiA3RohanTextFieldEmail(),
            const FiA3RohanTextFieldPassword(),
            FiA3RohanSizedBox.height10,
            FiA3RohanButton(
              onPressed: () {
                UserProvider();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FiA3RohanHome()),
                );
              },
              color: Colors.red,
              child: const Text("login"),
            ),
          ],
        ),
      ),
    );
  }
}
