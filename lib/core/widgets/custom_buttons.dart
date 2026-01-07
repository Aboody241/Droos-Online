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
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        
        backgroundColor: backgroundColor,
        elevation: 2, // 🔹 نفس Container
        padding: const EdgeInsets.symmetric(
          horizontal: 52,
          vertical: 25,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: borderall.top.color, // 🔹 نفس لون الـ border
            width: borderall.top.width,
          ),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
