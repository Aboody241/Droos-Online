import 'package:droos_online/core/widgets/pages_title_and_descriptions.dart';
import 'package:droos_online/core/widgets/static_box.dart';
import 'package:droos_online/features/dashBoard/screens/grades_screen/widgets/grade_form.dart';
import 'package:droos_online/features/dashBoard/screens/grades_screen/widgets/recent_grades_list.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GradesManagementScreen extends StatelessWidget {
  const GradesManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const Gap(24),
            const PagesTitleAndDescription(
              title: "ادارة الدرجات",
              description: "تعديل و اضافة درجات الطلاب",
            ),
            const Gap(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex: 2,
                  child: GradeForm(),
                ),

                const Gap(32),                
                Expanded(
                  flex: 2,
                  child: Column(
                    children: const [
                      StaticBox(
                        title2: "المهام النشطة",
                        value2: "13",
                        valueColor: Color(0xFF2563EB),
                        title: "نسبة النجاح",
                        value: "80%",
                      ),
                      Gap(24),
                      RecentGradesList(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
