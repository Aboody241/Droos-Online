import 'package:droos_online/core/theme/colors.dart';
import 'package:droos_online/features/dashBoard/screens/main_screen/widgets/dashboard_common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Widget that displays storage usage information
class StorageInfoSection extends StatelessWidget {
  const StorageInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "مساحة التخزين",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          const Gap(24),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "المساحة المستخدمة",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "2 جيجابايت / 10 جيجابايت",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Gap(15),
          LinearProgressIndicator(
            minHeight: 7,
            backgroundColor: Colors.grey[200],
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(50),
            value: 0.2,
          ),
          const Gap(15),
          const Text(
            "المساحة المتبقية: 8 جيجابايت",
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
