import 'package:flutter/material.dart';

class FiA3RohanTextFieldEmail extends StatelessWidget {
  const FiA3RohanTextFieldEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 318,
      height: 80,
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: const Color(0xffF8F9FA),
          filled: true,
          hintText: 'email',
          prefixIcon: const Icon(
            Icons.alternate_email,
            color: Color(0xff323F4B),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE4E7EB)),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffE4E7EB)),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
