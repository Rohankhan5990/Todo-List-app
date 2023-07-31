import 'package:fi_a3_rohan/widgets/core/todo_textfield_email.dart';
import 'package:fi_a3_rohan/widgets/core/todo_textfield_password.dart';
import 'package:fi_a3_rohan/screens/home/todo_home.dart';
import 'package:fi_a3_rohan/constants/static.dart';
import 'package:flutter/material.dart';
import '../../widgets/core/todo_button.dart';

class FiA3RohanLogin extends StatelessWidget {
  const FiA3RohanLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            FiA3RohanSizedBox.height40,
            FiA3RohanSizedBox.height40,
            FiA3RohanSizedBox.height20,
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
                // UserProvider();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FiA3RohanHome()),
                );
              },
              color: Color.fromARGB(255, 33, 172, 182),
              child: const Text("login"),
            ),
          ],
        ),
      ),
    );
  }
}
