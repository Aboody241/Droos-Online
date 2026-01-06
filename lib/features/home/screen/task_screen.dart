import 'package:droos_online/core/theme/app_text_style.dart';
import 'package:droos_online/features/home/widgets/stat_card.dart';
import 'package:droos_online/features/home/widgets/task_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              const Text(
                "المهام",
                style: AppTextStyles.black34Bold,
              ),
              const SizedBox(height: 6),
              const Text(
                "لديك 5 مهام معلقة",
                textAlign: TextAlign.right,
                style: AppTextStyles.black18Normal,
              ),
              const SizedBox(height: 20),

              /// ✅ Stats Cards
              const Row(
                children: [
                   StatCard(
                    title: "المهام الكلية",
                    value: "6",
                    color: Colors.blue,
                  ),
                  Gap(16),
                   StatCard(
                    title: "قيد التنفيذ",
                    value: "2",
                    color: Colors.orange,
                  ),
                  Gap(16),
                   StatCard(
                    title: "مكتمل",
                    value: "1",
                    color: Colors.green,
                  ),
                ],
              ),
              const SizedBox(height: 24),

              /// ✅ Task Grid
              const TaskGridView(),
              const Gap(20)
            ],
          ),
        ),
      ),
    );
  }
}
