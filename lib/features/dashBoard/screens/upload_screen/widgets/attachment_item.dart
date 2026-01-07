import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// A widget that displays an attachment item with file information
/// 
/// Shows file icon, title, subject, metadata, and action menu
class AttachmentItem extends StatelessWidget {
  const AttachmentItem({super.key});

  // Text styles as constants for better performance
  static const TextStyle _titleStyle = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle _subjectStyle = TextStyle(
    color: Color(0xFF6B7280),
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle _metadataStyle = TextStyle(
    color: Color(0xFF9CA3AF),
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          // File icon
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.file_present_outlined,
              size: 24,
              color: Colors.blue,
            ),
          ),
          const Gap(20),
          // File information
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "اللغة العربية الصف الثاني الثانوي",
                  style: _titleStyle,
                ),
                Text(
                  "اللغة العربية",
                  style: _subjectStyle,
                ),
                Text(
                  "pdf - 25 ميجابايت , 15 يناير 2026",
                  style: _metadataStyle,
                ),
              ],
            ),
          ),
          // Action menu button
          IconButton(
            onPressed: () {
              // TODO: Implement menu actions
            },
            icon: Icon(
              Icons.more_horiz_rounded,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}
