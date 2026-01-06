import 'package:droos_online/core/theme/colors.dart';
import 'package:droos_online/core/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TaskCard extends StatelessWidget {
  final String status;
  final String title;
  final String description;
  final String due;
  final String subject;
  final String buttonText;

  const TaskCard({
    super.key,
    required this.status,
    required this.title,
    required this.description,
    required this.due,
    required this.subject,
    required this.buttonText,
  });

  Color get statusColor {
    switch (status) {
      case "مكتمل":
        return Colors.green;
      case "قيد التنفيذ":
        return Colors.blue;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentStatusColor = statusColor;
    
    return Container(
      width: 320,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000), // Black with 0.1 opacity
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: currentStatusColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              status,
              style: TextStyle(color: currentStatusColor, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
          const Gap(10),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Gap(6),
          Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(10),
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
              const Gap(4),
              Text(
                "Due: $due",
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const Gap(20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(vertical: 18),
                elevation: 0,
              ),
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }
}
