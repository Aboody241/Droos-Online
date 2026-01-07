import 'package:droos_online/features/dashBoard/screens/grades_screen/widgets/recent_grade_tile.dart';
import 'package:droos_online/features/dashBoard/screens/main_screen/widgets/dashboard_common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RecentGradesList extends StatelessWidget {
  const RecentGradesList({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "أحدث الدرجات المضافة",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return const RecentGradeTile(
                studentName: "احمد حسن",
                grade: "85/100",
                subject: "الكيمياء",
                date: "15/1/2026 - 10:00 م",
              );
            },
          ),
        ],
      ),
    );
  }
}
