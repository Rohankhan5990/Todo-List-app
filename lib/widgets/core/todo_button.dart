import 'package:flutter/material.dart';

class FiA3RohanButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final Widget child;
  const FiA3RohanButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(12.0),
        width: 250,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(
            width: 2,
            color: const Color(0xFF9e9898),
          ),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
