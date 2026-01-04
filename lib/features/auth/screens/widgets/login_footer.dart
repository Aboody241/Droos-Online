import 'package:droos_online/core/theme/colors.dart';
import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'اضغط تسجيل الدخول للوصول للصفحة الرئيسية',
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.primary),
          ),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("← Back to Home"),
        ),
      ],
    );
  }
}
