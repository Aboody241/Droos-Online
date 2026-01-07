import 'package:droos_online/core/theme/app_text_style.dart';
import 'package:droos_online/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LandingAppbar extends StatelessWidget {
  const LandingAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25 , ),
      child: Row(
        children: [
          Icon(Icons.school, color: AppColors.primary, size: 40),
          Gap(5),
          Text(
            "Droos Online",
            style: AppTextStyles.black20W500.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            
            style: ButtonStyle(
            padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16, vertical: 16)),  
              backgroundColor: WidgetStatePropertyAll(AppColors.primary),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ))
            ),
            child: Text(
              " Login / تسجيل الدخول ",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
