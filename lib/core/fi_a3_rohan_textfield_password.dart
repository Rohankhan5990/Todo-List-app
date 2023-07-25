import 'package:flutter/material.dart';

class FiA3RohanTextFieldPassword extends StatefulWidget {
  const FiA3RohanTextFieldPassword({super.key});

  @override
  State<FiA3RohanTextFieldPassword> createState() =>
      _FiA3RohanTextFieldPasswordState();
}

class _FiA3RohanTextFieldPasswordState
    extends State<FiA3RohanTextFieldPassword> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: SizedBox(
        width: 350,
        height: 90,
        child: TextFormField(
          obscureText: passwordVisible,
          decoration: InputDecoration(
            fillColor: Color(0xffF8F9FA),
            filled: true,
            hintText: 'password',
            prefixIcon: const Icon(
              Icons.lock_open,
              color: Color(0xff323F4B),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                  passwordVisible ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(
                  () {
                    passwordVisible = !passwordVisible;
                  },
                );
              },
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE4E7EB)),
              borderRadius: BorderRadius.circular(20),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE4E7EB)),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
