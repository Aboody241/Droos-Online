
import 'package:droos_online/core/theme/app_text_style.dart';
import 'package:droos_online/core/theme/colors.dart';
import 'package:flutter/material.dart';

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
          Image.asset("assets/appIcon.png", width: 100, height: 100),
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
