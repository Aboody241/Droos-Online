
import 'package:droos_online/core/theme/app_text_style.dart';
import 'package:droos_online/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LandingAppbar extends StatelessWidget {
  const LandingAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(Icons.school, color: AppColors.primary, size: 40),
          Gap(5),
          Text("Droos Online", style: AppTextStyles.black20W500.copyWith(
            fontWeight: FontWeight.bold,
          )),
          Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.primary,
            ),
            child: Text(
              "تسجيل الدخول / Login",
              style: AppTextStyles.white16W500,
            ),
          ),
        ],
      ),
    );
  }
}
