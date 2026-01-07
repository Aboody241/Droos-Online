
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PagesTitleAndDescription extends StatelessWidget {
  final String title;
  final String description;
  const PagesTitleAndDescription({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
            Gap(4),
            Text(
              description,
              style: TextStyle(fontSize: 15, color: Color(0xFF6B7280)),
            ),
          ],
        );
  }
}
