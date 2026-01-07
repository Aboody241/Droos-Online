import 'package:droos_online/core/widgets/pages_title_and_descriptions.dart';
import 'package:droos_online/features/dashBoard/screens/student_management_screen/widgets/student_search_bar.dart';
import 'package:droos_online/features/dashBoard/screens/student_management_screen/widgets/student_stats_row.dart';
import 'package:droos_online/features/dashBoard/screens/student_management_screen/widgets/student_table.dart';
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
        child: ListView(
          children: [
            const Gap(24),
            const PagesTitleAndDescription(
              title: 'إدارة الطلاب',
              description: 'إدارة ومراقبة معلومات الطلاب المسجلين في المنصة',
            ),
            Gap(32),

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
    );
  }
}
