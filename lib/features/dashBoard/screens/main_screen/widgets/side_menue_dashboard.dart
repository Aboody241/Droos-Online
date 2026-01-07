import 'package:droos_online/core/theme/colors.dart';
import 'package:flutter/material.dart';

class SideMenuDashboard extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const SideMenuDashboard({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Column(
        children: [
          _menuItem(0, Icons.people_alt_outlined, "Students / الطلاب"),
          _menuItem(1, Icons.task_alt_rounded, "Assignments / تعيين المهام"),
          _menuItem(2, Icons.grade_rounded, "Grades / ادارة الدرجات"),
          _menuItem(3, Icons.upload_file_rounded, "Upload Assignment / رفع المهام"),
          _menuItem(4, Icons.settings, "Settings / الإعدادات"),
        ],
      ),
    );
  }

  Widget _menuItem(int index, IconData icon, String title) {
    final bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () => onItemSelected(index),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected
              // ignore: deprecated_member_use
              ? AppColors.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color:
                  isSelected ? AppColors.primary : Colors.grey.shade600,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: isSelected
                      ? AppColors.primary
                      : Colors.grey.shade800,
                  fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
