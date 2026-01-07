import 'package:droos_online/core/widgets/pages_title_and_descriptions.dart';
import 'package:droos_online/core/widgets/static_box.dart';
import 'package:droos_online/features/dashBoard/screens/upload_screen/widgets/recent_materials_section.dart';
import 'package:droos_online/features/dashBoard/screens/upload_screen/widgets/storage_info_section.dart';
import 'package:droos_online/features/dashBoard/screens/upload_screen/widgets/upload_form_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Screen for uploading assignments and managing uploaded materials
class UploadAssignmentsScreen extends StatelessWidget {
  const UploadAssignmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: const [
            Gap(24),
            PagesTitleAndDescription(
              title: "رفع المهام",
              description: "رفع المهام للطلاب",
            ),
            Gap(24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Upload form section
                Expanded(
                  child: UploadFormSection(),
                ),
                Gap(32),
                // Sidebar with stats and recent materials
                Expanded(
                  child: Column(
                    children: [
                      StaticBox(
                        title: "المواد المرفوعة",
                        value: "28",
                        valueColor: Colors.black,
                        title2: "هذا الاسبوع",
                        value2: "6",
                      ),
                      Gap(24),
                      RecentMaterialsSection(),
                      Gap(24),
                      StorageInfoSection(),
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
