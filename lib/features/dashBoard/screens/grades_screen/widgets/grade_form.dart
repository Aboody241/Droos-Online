import 'package:droos_online/core/theme/colors.dart';
import 'package:droos_online/features/dashBoard/screens/main_screen/widgets/dashboard_common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GradeForm extends StatelessWidget {
  const GradeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "تفاصيل المهمة",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          const Gap(24),
          const DashboardLabel("عنوان المهمة *"),
          const Gap(8),
          const DashboardTextField(
            hint: "مثال: واجب الرياضيات – الفصل الخامس",
          ),
          const Gap(24),
          const DashboardLabel("المادة *"),
          const Gap(8),
          DashboardDropdown(
            hint: "اختر المادة",
            items: const [
              "رياضيات",
              "لغة إنجليزية",
              "فيزياء",
              "كيمياء",
            ],
            onChanged: (String? value) {},
          ),
          const Gap(24),
          Row(
            children: const [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DashboardLabel("الدرجة *"),
                    Gap(8),
                    DashboardTextField(hint: "مثال: 85"),
                  ],
                ),
              ),
              SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DashboardLabel("الدرجة العليا *"),
                    Gap(8),
                    DashboardTextField(hint: "مثال: 85"),
                  ],
                ),
              ),
            ],
          ),
          const Gap(16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "النسبة المئوية *",
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                const Gap(5),
                Text(
                  "100",
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const Gap(24),
          const DashboardLabel("ملاحظات (اختياري)*"),
          const Gap(8),
          const DashboardTextField(hint: "اضف ملاحظات هنا..."),
          const Gap(24),
          const DashBoardButton(
            text: 'حفظ الدرجة',
            icon: Icons.save,
          ),
        ],
      ),
    );
  }
}
