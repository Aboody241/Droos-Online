import 'package:droos_online/app/routes.dart';
import 'package:droos_online/core/theme/app_text_style.dart';
import 'package:droos_online/core/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HeadLanding extends StatelessWidget {
  const HeadLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // color: const Color.fromARGB(255, 234, 242, 251),
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 228, 237, 248),
            const Color.fromARGB(255, 255, 255, 255),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: Image.asset(
              "assets/landing/landing_image.png",
              width: 600,
              height: 600,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "أجعل تجربة تعلمك افضل",
                style: AppTextStyles.black42Bold,
                textAlign: TextAlign.right,
              ),
              Gap(15),
              Text(
                "منصة تعليمية حديثة مصممة لطلاب ومعلمي الثانوية\nإدارة المهام، تتبع الدرجات، والوصول إلى المواد التعليمية كلها في مكان واحد.",
                textAlign: TextAlign.right,
                style: AppTextStyles.black20W500.copyWith(
                  color: Colors.grey.shade700
                ),
              ),
              Gap(45),

              Row(
                children: [
                  CustomButton1(
                    backgroundColor: Colors.white,
                    textColor: Color.fromARGB(255, 0, 94, 255),
                    title: "المزيد",
                    borderall: Border.all(color: Color.fromARGB(255, 0, 94, 255), width: 1.5),
                  ),
                  Gap(20),
                  CustomButton1(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.login);
                    },
                    backgroundColor: Color.fromARGB(255, 0, 94, 255),
                    textColor: Colors.white,
                    title: "ابدأ الان",
                    borderall: Border.all(color: Colors.white, width: 1.5),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
