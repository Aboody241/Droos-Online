
import 'package:droos_online/features/home/widgets/task_card.dart';
import 'package:flutter/material.dart';

class TaskGridView extends StatelessWidget {
  const TaskGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: GridView.count(
        childAspectRatio: 1.6,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      children: const [
        TaskCard(
          status: "قيد التنفيذ",
          title: "امتحان الرياضيات",
          description:
              "إكمال التمارين من 1 إلى 20 من الفصل الخامس",
          due: "1/10/2026",
          subject: "الرياضيات",
          buttonText: "بدء المهمة",
        ),
        TaskCard(
          status: "قيد التنفيذ",
          title: "مقال إنجليزي: أثر التكنولوجيا",
          description:
              "كتابة مقال من 500 كلمة حول أثر التكنولوجيا",
          due: "1/12/2026",
          subject: "الإنجليزية",
          buttonText: "بدء المهمة",
        ),
        TaskCard(
          status: "قيد التنفيذ",
          title: "مقال إنجليزي: أثر التكنولوجيا",
          description:
              "كتابة مقال من 500 كلمة حول أثر التكنولوجيا",
          due: "1/12/2026",
          subject: "الإنجليزية",
          buttonText: "بدء المهمة",
        ),
        TaskCard(
          status: "قيد التنفيذ",
          title: "مقال إنجليزي: أثر التكنولوجيا",
          description:
              "كتابة مقال من 500 كلمة حول أثر التكنولوجيا",
          due: "1/12/2026",
          subject: "الإنجليزية",
          buttonText: "بدء المهمة",
        ),
        TaskCard(
          status: "قيد التنفيذ",
          title: "مقال إنجليزي: أثر التكنولوجيا",
          description:
              "كتابة مقال من 500 كلمة حول أثر التكنولوجيا",
          due: "1/12/2026",
          subject: "الإنجليزية",
          buttonText: "بدء المهمة",
        ),
        TaskCard(
          status: "قيد التنفيذ",
          title: "مقال إنجليزي: أثر التكنولوجيا",
          description:
              "كتابة مقال من 500 كلمة حول أثر التكنولوجيا",
          due: "1/12/2026",
          subject: "الإنجليزية",
          buttonText: "بدء المهمة",
        ),
        TaskCard(
          status: "قيد التنفيذ",
          title: "مقال إنجليزي: أثر التكنولوجيا",
          description:
              "كتابة مقال من 500 كلمة حول أثر التكنولوجيا",
          due: "1/12/2026",
          subject: "الإنجليزية",
          buttonText: "بدء المهمة",
        ),
      ],
      ),
    );
  }
}
