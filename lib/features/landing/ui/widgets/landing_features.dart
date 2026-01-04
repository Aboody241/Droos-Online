import 'package:droos_online/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FeatureModel {
  final String title;
  final String description;
  final IconData icon;

  FeatureModel({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class WebFeatures extends StatelessWidget {
  const WebFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FeatureModel> features = [
      FeatureModel(
        title: 'إدارة المهام',
        description:
            'تتبع جميع واجباتك ومواعيد التسليم في مكان واحد منظم باستخدام نظام إدارة المهام السهل لدينا.',
        icon: Icons.assignment_outlined,
      ),
      FeatureModel(
        title: 'تتبع الدرجات',
        description:
            'راقب تقدمك الأكاديمي من خلال تقارير درجات مفصلة وتحليلات للأداء.',
        icon: Icons.verified_outlined,
      ),
      FeatureModel(
        title: 'المواد التعليمية',
        description:
            'يمكنك الوصول إلى جميع المواد الدراسية وأدلة الدراسة والموارد في مكتبة مركزية.',
        icon: Icons.menu_book_outlined,
      ),
      FeatureModel(
        title: 'إدارة الطلاب',
        description:
            'يمكن للمعلمين إدارة معلومات الطلاب والواجبات وبيانات الأداء بسهولة.',
        icon: Icons.people_outline,
      ),
      FeatureModel(
        title: 'تحديثات فورية',
        description:
            'ابق على اطلاع دائم من خلال إشعارات فورية حول الواجبات الجديدة والدرجات والإعلانات.',
        icon: Icons.access_time,
      ),
      FeatureModel(
        title: 'دعم ثنائي اللغة',
        description:
            'دعم كامل لكل من اللغتين العربية والإنجليزية، مما يجعل التعليم متاحًا لجميع الطلاب.',
        icon: Icons.school_outlined,
      ),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        itemCount: features.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 230,
          crossAxisCount: 3,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          childAspectRatio: 1.3,
        ),
        itemBuilder: (context, index) {
          final feature = features[index];
          return Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    feature.icon,
                    color: AppColors.primary,
                    size: 28,
                  ),
                ),
                const Gap(20),
                Text(
                  feature.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: 'Cairo', // Assuming a suitable Arabic font might be used, but standard is fine too
                  ),
                ),
                const Gap(12),
                Text(
                  feature.description,
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
