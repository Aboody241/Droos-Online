import 'package:droos_online/features/home/widgets/stat_card.dart';
import 'package:flutter/material.dart';

class StudentStatsRow extends StatelessWidget {
  const StudentStatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        StatCard(
          title: "إجمالي الطلاب",
          value: "8",
          color: Colors.black,
        ),
        StatCard(
          title: "الصف",
          value: "5",
          color: Colors.black,
        ),
        StatCard(
          title: "الطلاب النشطون",
          value: "8",
          color: Colors.green,
        ),
      ],
    );
  }
}
