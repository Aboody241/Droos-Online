import 'package:droos_online/core/theme/app_text_style.dart';
import 'package:droos_online/core/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FooterLanding extends StatelessWidget {
  const FooterLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 25),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 0, 94, 255)
          ),
        child: Column(
          children: [
            Gap(30),
            Text("جاهز للبدئ؟", style: AppTextStyles.black38Bold.copyWith(
              color: Colors.white,
              fontSize: 34
            ),),
            Gap(10),
            Text("انضم إلى آلاف الطلاب والمعلمين الذين يستخدمون منصتنا بالفعل", style: AppTextStyles.black20W500.copyWith(
              color: Colors.white
            ),),
            Gap(30),
            CustomButton1(backgroundColor: Colors.white, textColor: Color.fromARGB(255, 0, 94, 255), title: "انضم الآن", borderall: Border.all(color: Colors.white),),
            Gap(50)
          ],
        ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 25),
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 2, 20, 52)
          ),
          child: Center(child: Text("© 2026 EduPlatform. All rights reserved.", style: AppTextStyles.black20W500.copyWith(
            
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 16
          ),),),
        )
      ],
    );
  }
}