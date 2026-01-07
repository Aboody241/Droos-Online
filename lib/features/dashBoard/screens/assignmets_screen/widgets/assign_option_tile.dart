import 'package:droos_online/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AssignOptionTile extends StatelessWidget {
  final String value;
  final String groupValue;
  final String label;
  final IconData icon;
  final ValueChanged<String?> onChanged;

  const AssignOptionTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    required this.icon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool selected = groupValue == value;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          // ignore: deprecated_member_use
          color: selected ? AppColors.primary.withOpacity(0.02) : Colors.white,
          border: Border.all(
            color: selected ? AppColors.primary : Colors.grey.shade200,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              groupValue: groupValue,
              activeColor: AppColors.primary,
              onChanged: onChanged,
              visualDensity: VisualDensity.compact,
            ),
            Icon(icon, color: selected ? AppColors.primary : Colors.grey, size: 20),
            const Gap(12),
            Text(
              label,
              style: TextStyle(
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                color: selected ? AppColors.primary : const Color(0xFF374151),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
