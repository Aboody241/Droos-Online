import 'package:droos_online/core/theme/colors.dart';
import 'package:droos_online/features/dashBoard/screens/main_screen/widgets/dashboard_common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StudentSelectionWidget extends StatelessWidget {
  final TextEditingController searchController;
  final List<String> filteredStudents;
  final List<String> selectedStudents;
  final ValueChanged<String> onFilterChanged;
  final ValueChanged<bool?> onToggleSelectAll;
  final Function(String, bool) onStudentToggled;

  const StudentSelectionWidget({
    super.key,
    required this.searchController,
    required this.filteredStudents,
    required this.selectedStudents,
    required this.onFilterChanged,
    required this.onToggleSelectAll,
    required this.onStudentToggled,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DashboardLabel("ابحث عن طالب"),
          const Gap(8),
          DashboardTextField(
            controller: searchController,
            hint: "اكتب اسم الطالب",
            icon: Icons.search,
            onChanged: onFilterChanged,
          ),
          const Gap(12),
          Row(
            children: [
              Checkbox(
                value: selectedStudents.length == filteredStudents.length &&
                    filteredStudents.isNotEmpty,
                onChanged: onToggleSelectAll,
                activeColor: AppColors.primary,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              const Text(
                "اختر الكل",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              )
            ],
          ),
          const Gap(12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: filteredStudents.map((student) {
              final isSelected = selectedStudents.contains(student);
              return FilterChip(
                label: Text(student),
                selected: isSelected,
                onSelected: (selected) => onStudentToggled(student, selected),
                backgroundColor: Colors.white,
                selectedColor: AppColors.primary.withOpacity(0.1),
                checkmarkColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: isSelected ? AppColors.primary : Colors.grey.shade300,
                  ),
                ),
                labelStyle: TextStyle(
                  color: isSelected ? AppColors.primary : Colors.black87,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 13,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
