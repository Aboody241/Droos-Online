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
          onPressed: () {},
          child: const Text(
            "نسيت كلمة المرور؟",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
