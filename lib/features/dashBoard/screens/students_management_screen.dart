import 'package:droos_online/features/dashBoard/screens/widgets/student_widgets/student_search_bar.dart';
import 'package:droos_online/features/dashBoard/screens/widgets/student_widgets/student_stats_row.dart';
import 'package:droos_online/features/dashBoard/screens/widgets/student_widgets/student_table.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StudentsManagementScreen extends StatelessWidget {
  const StudentsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(24),
              const Text(
                "إدارة الطلاب",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const Text(
                "إدارة ومراقبة معلومات الطلاب",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6B7280),
                ),
              ),
              const Gap(24),

              /// ✅ Stats Row
              const StudentStatsRow(),
              const Gap(24),

              /// ✅ Search and Add Student Row
              const StudentSearchBar(),
              const Gap(24),

              /// ✅ Student Table Contents
              const StudentTable(),
              const Gap(24),
            ],
          ),
        ),
      ),
    );
  }
}
