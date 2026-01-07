import 'package:droos_online/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PrioritySelector extends StatelessWidget {
  final String selectedPriority;
  final ValueChanged<String> onPriorityChanged;

  const PrioritySelector({
    super.key,
    required this.selectedPriority,
    required this.onPriorityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildPriorityButton("منخفض"),
        const Gap(12),
        _buildPriorityButton("متوسط"),
        const Gap(12),
        _buildPriorityButton("عالي"),
      ],
    );
  }

  Widget _buildPriorityButton(String text) {
    final bool isSelected = selectedPriority == text;
    return Expanded(
      child: GestureDetector(
        onTap: () => onPriorityChanged(text),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? AppColors.primary : Colors.grey.shade300,
              width: 1.5,
            ),
            color: isSelected ? AppColors.primary.withOpacity(0.08) : Colors.white,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isSelected ? AppColors.primary : const Color(0xFF4B5563),
            ),
          ),
        ),
      ),
    );
  }
}
