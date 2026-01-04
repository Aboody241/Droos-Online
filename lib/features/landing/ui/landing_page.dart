import 'package:droos_online/features/landing/ui/widgets/footer_landing.dart';
import 'package:droos_online/features/landing/ui/widgets/head_landing.dart';
import 'package:droos_online/features/landing/ui/widgets/web_features.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.cast_for_education),
            Text("EduPlatform", style: TextStyle()),
            Spacer(),
            Container(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Text(
                "تسجيل الدخول / Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      //==============
      body: Column(
        children: [
          HeadLanding(),
          Text("Everything You Need to Succeed"),
          Text("Powerful features designed for modern education"),
          Expanded(child: WebFeatures()),
          FooterLanding()

        ],
      ),
    );
  }
}
