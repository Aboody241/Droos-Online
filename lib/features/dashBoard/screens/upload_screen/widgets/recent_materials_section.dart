import 'package:droos_online/features/dashBoard/screens/main_screen/widgets/dashboard_common_widgets.dart';
import 'package:droos_online/features/dashBoard/screens/upload_screen/widgets/attachment_item.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Widget that displays a list of recently uploaded materials
class RecentMaterialsSection extends StatelessWidget {
  const RecentMaterialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "احدث المواد المرفوعة",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          const Gap(24),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return const AttachmentItem();
            },
          ),
        ],
      ),
    );
  }
}
