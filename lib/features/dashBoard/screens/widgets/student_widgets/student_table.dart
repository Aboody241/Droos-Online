import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StudentTable extends StatelessWidget {
  const StudentTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Table Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: const Row(
              children: [
                Expanded(flex: 2, child: Text("الطالب", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black))),
                Expanded(flex: 3, child: Text("معلومات التواصل", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black))),
                Expanded(flex: 2, child: Text("الصف", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black))),
                Expanded(flex: 2, child: Text("تاريخ التسجيل", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black))),
                Expanded(flex: 2, child: Text("الحالة", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black))),
                Expanded(flex: 1, child: Text("الإجراءات", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black))),
              ],
            ),
          ),
          const Divider(height: 1),
          // Table Rows
          _buildStudentRow("أحمد حسن", "ahmed.hassan@school.com", "+966 50 123 4567", "الصف 11-أ", "2025/9/1", "نشط", "أح"),
          _buildStudentRow("سارة الراشد", "sarah.rashid@school.com", "+966 55 234 5678", "الصف 11-أ", "2025/9/1", "نشط", "سر"),
          _buildStudentRow("محمد علي", "mohammed.ali@school.com", "+966 50 345 6789", "الصف 11-ب", "2025/9/1", "نشط", "مع"),
          _buildStudentRow("فاطمة خالد", "fatima.khalid@school.com", "+966 55 456 7890", "الصف 11-أ", "2025/9/1", "نشط", "فك"),
        ],
      ),
    );
  }

  Widget _buildStudentRow(String name, String email, String phone, String className, String date, String status, String initials) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Student Info
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue.shade50,
                      child: Text(initials, style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14)),
                    ),
                    const Gap(12),
                    Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              // Contact Info
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.email_outlined, size: 14, color: Colors.grey),
                        const Gap(4),
                        Text(email, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.phone_outlined, size: 14, color: Colors.grey),
                        const Gap(4),
                        Text(phone, style: const TextStyle(fontSize: 13, color: Colors.grey), textDirection: TextDirection.ltr),
                      ],
                    ),
                  ],
                ),
              ),
              // Class
              Expanded(
                flex: 2,
                child: Text(className, textAlign: TextAlign.right, style: TextStyle(color: Colors.blue.shade700, fontSize: 12)),
              ),
              // Enrollment
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                    const Gap(4),
                    Text(date, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                  ],
                ),
              ),
              // Status
              Expanded(
                flex: 2,
                child: Text(status, textAlign: TextAlign.right, style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              // Actions
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Icon(Icons.edit_note_outlined, color: Colors.blue.shade700, size: 20),
                    const Gap(8),
                    Icon(Icons.delete_outline, color: Colors.red.shade400, size: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
