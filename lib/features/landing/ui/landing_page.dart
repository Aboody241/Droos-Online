import 'package:droos_online/core/theme/app_text_style.dart';
import 'package:droos_online/features/landing/ui/widgets/footer_landing.dart';
import 'package:droos_online/features/landing/ui/widgets/head_landing.dart';
import 'package:droos_online/features/landing/ui/widgets/landing_appbar.dart';
import 'package:droos_online/features/landing/ui/widgets/landing_features.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(20),
            LandingAppbar(),
            Gap(20),
            HeadLanding(),
            Gap(35),
            Text("لدينا كل ما تحتاجه للنجاح", style: AppTextStyles.black38Bold),
            Gap(10),
            Text(
              "ميزات قوية مصممة للتعليم الحديث",
              style: AppTextStyles.black20W500.copyWith(
                color: Colors.grey.shade700,
              ),
            ),
            Gap(30),
            WebFeatures(),
            Gap(40),
            FooterLanding(),
          ],
        ),
      ),
    );
  }
}
