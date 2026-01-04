import 'package:flutter/material.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({super.key, required this.backgroundColor, required this.textColor, required this.title,});

  final String title;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: backgroundColor ,),
      
      child: Text(title , style: TextStyle(
        color: textColor
      ),),
    );
  }
}
