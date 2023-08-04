import 'package:flutter/material.dart';

class TodoTextField extends StatefulWidget {
  final Widget child;
  final Widget child1;
  final TextInputType keyboard;
  final bool opscuretext;
  final String hinttext;
  final String Function(String?)? validator;
  final TextEditingController controller;
  const TodoTextField(
      {super.key,
      required this.child,
      required this.child1,
      required this.controller,
      required this.hinttext,
      required this.opscuretext,
      required this.validator,
      required this.keyboard});

  @override
  State<TodoTextField> createState() => _TodoTextFieldState();
}

class _TodoTextFieldState extends State<TodoTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        keyboardType: widget.keyboard,
        controller: widget.controller,
        obscureText: widget.opscuretext,
        decoration: InputDecoration(
          hintText: widget.hinttext,
          filled: true,
          fillColor: Colors.white,
          prefixIcon: widget.child,
          suffixIcon: widget.child1,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0xffE4E7EB),
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        validator: widget.validator,
      ),
    );
  }
}
