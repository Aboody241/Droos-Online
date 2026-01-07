import 'package:droos_online/core/theme/colors.dart';
import 'package:flutter/material.dart';

class RoleSelection extends StatelessWidget {
  final String selectedRole;
  final ValueChanged<String> onRoleChanged;

  const RoleSelection({
    super.key,
    required this.selectedRole,
    required this.onRoleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildRoleButton("Student", "Student / طالب"),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildRoleButton("Admin", "Admin / مشرف"),
        ),
      ],
    );
  }

Widget _buildRoleButton(String role, String label) {
  final isSelected = selectedRole == role;
  return OutlinedButton(
    onPressed: () => onRoleChanged(role),
    style: OutlinedButton.styleFrom(
      // ignore: deprecated_member_use
      backgroundColor: isSelected ? Colors.blue.withOpacity(0.2) : Colors.white,
      side: BorderSide(
        color: isSelected ? AppColors.primary : Colors.grey.shade300,
        width: isSelected ? 1.5 : 1,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(20),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          role == "Student" ? Icons.person : Icons.school,
          color: isSelected ? AppColors.primary : Colors.black,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.primary : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

}
