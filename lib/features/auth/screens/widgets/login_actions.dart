import 'package:droos_online/app/routes.dart';
import 'package:flutter/material.dart';

class LoginActions extends StatelessWidget {
  const LoginActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(value: false, onChanged: (val) {}),
            const Text("تذكرني"),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.forgetPassword);
          },
          child: const Text(
            "نسيت كلمة المرور؟",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
