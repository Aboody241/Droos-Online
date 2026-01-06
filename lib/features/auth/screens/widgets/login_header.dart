import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.school, size: 50, color: Colors.blue),
        const SizedBox(height: 10),
        const Text(
          "Droos Online",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "سجل دخول لحسابك الأن",
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }
}
