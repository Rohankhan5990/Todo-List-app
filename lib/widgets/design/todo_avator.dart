import 'package:flutter/material.dart';

class FiA2RohanAvator extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  const FiA2RohanAvator(
      {super.key,
      required this.child,
      required this.height,
      required this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(2),
          child: child,
        ),
      ),
    );
  }
}
