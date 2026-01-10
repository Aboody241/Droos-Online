import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droos_online/features/auth/service/user_service.dart';
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
                Expanded(
                  flex: 2,
                  child: Text(
                    "الطالب",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    "معلومات التواصل",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "الصف",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "تاريخ التسجيل",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "الحالة",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    "الإجراءات",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Table Rows
          StreamBuilder<List<Map<String, dynamic>>>(
            stream: UserService().getStudents(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(child: Text('حدث خطأ: ${snapshot.error}')),
                );
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(child: Text('لا يوجد طلاب حالياً')),
                );
              }

              final students = snapshot.data!;

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: students.length,
                itemBuilder: (context, index) {
                  final student = students[index];
                  final name = student['name'] ?? 'غير معروف';
                  final email = student['email'] ?? 'لا يوجد بريد';
                  final phone = student['phone'] ?? '---';
                  final className =
                      student['className'] ?? '---'; // Placeholder

                  // Handle Timestamp
                  final createdAt = student['createdAt'];
                  String dateStr = '---';
                  if (createdAt != null && createdAt is Timestamp) {
                    final date = createdAt.toDate();
                    dateStr = "${date.year}/${date.month}/${date.day}";
                  }

                  final status = student['status'] ?? 'نشط'; // Placeholder
                  final initials = name.isNotEmpty
                      ? name.substring(0, min(2, name.length))
                      : '??';

                  return _buildStudentRow(
                    context,
                    student['uid'],
                    name,
                    email,
                    phone,
                    className,
                    dateStr,
                    status,
                    initials,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  int min(int a, int b) {
    return a < b ? a : b;
  }

  Widget _buildStudentRow(
    BuildContext context,
    String? uid,
    String name,
    String email,
    String phone,
    String className,
    String date,
    String status,
    String initials,
  ) {
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
                      child: Text(
                        initials,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Gap(12),
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
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
                        const Icon(
                          Icons.email_outlined,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const Gap(4),
                        Expanded(
                          child: Text(
                            email,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.phone_outlined,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const Gap(4),
                        Text(
                          phone,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                          textDirection: TextDirection.ltr,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Class
              Expanded(
                flex: 2,
                child: Text(
                  className,
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.blue.shade700, fontSize: 12),
                ),
              ),
              // Enrollment
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const Gap(4),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              // Status
              Expanded(
                flex: 2,
                child: Text(
                  status,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Actions
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        if (uid != null) {
                          try {
                            await UserService().toggleStudentStatus(
                              uid: uid,
                              isActive: status == 'active',
                            );
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(e.toString()),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        }
                      },
                      icon:  Icon(
    status == 'active'
        ? Icons.block
        : Icons.check_circle,
    color: status == 'active'
        ? Colors.orange
        : Colors.green,),
                    ),
                    const Gap(8),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () async {
                        final confirm = await showDialog<bool>(
                          context: context,
                          builder: (context) {
                            String inputValue = '';
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: const Text('حذف الطالب'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'هذا الإجراء لا يمكن التراجع عنه.\nيرجى كتابة كلمة "حذف" للتأكيد:',
                                      ),
                                      const Gap(16),
                                      TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            inputValue = value;
                                          });
                                        },
                                        decoration: const InputDecoration(
                                          hintText: 'اكتب "حذف" هنا',
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 8,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: const Text('إلغاء'),
                                    ),
                                    ElevatedButton(
                                      onPressed: inputValue == 'حذف'
                                          ? () => Navigator.pop(context, true)
                                          : null,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red,
                                        disabledBackgroundColor:
                                            Colors.red.withOpacity(0.3),
                                      ),
                                      child: const Text(
                                        'حذف نهائي',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );

                        if (confirm == true && uid != null) {
                          try {
                            await UserService().deleteStudent(uid);
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'تم حذف الطالب بنجاح',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'خطأ: $e',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        }
                      },
                    ),
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
