import 'package:flutter/material.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.title,
    required this.borderall,
    this.onTap,
  });

  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Border borderall;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: borderall,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
