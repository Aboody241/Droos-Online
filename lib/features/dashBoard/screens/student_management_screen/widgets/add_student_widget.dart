import 'package:droos_online/core/theme/colors.dart';
import 'package:droos_online/features/auth/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddStudentDialog extends StatefulWidget {
  const AddStudentDialog({super.key});

  @override
  State<AddStudentDialog> createState() => _AddStudentDialogState();
}

class _AddStudentDialogState extends State<AddStudentDialog> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  final authService = AuthService();
  bool loading = false;

  Future<void> addStudent() async {
    if (nameCtrl.text.isEmpty ||
        emailCtrl.text.isEmpty ||
        passwordCtrl.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('الرجاء ملء جميع الحقول')));
      return;
    }

    setState(() => loading = true);

    try {
      await authService.registerStudent(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
        name: nameCtrl.text.trim(),
      );

      if (mounted) {
        Navigator.pop(context); // إغلاق الديالوج
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('تم تسجيل الطالب بنجاح')));
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('حدث خطأ أثناء التسجيل')));
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // insetPadding: const EdgeInsets.symmetric(horizontal: 50 , vertical: 50),
      backgroundColor: Colors.white,
      title: const Text('إضافة طالب جديد', textAlign: TextAlign.center),
      content: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  prefixIcon: Icon(Icons.person, size: 15),
                  labelText: 'الاسم',
                ),
              ),
              Gap(16),
              TextField(
                controller: emailCtrl,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  prefixIcon: Icon(Icons.email, size: 15),
                  labelText: 'البريد الإلكتروني',
                ),
              ),
              Gap(16),
              TextField(
                controller: passwordCtrl,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock, size: 15),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  labelText: 'كلمة المرور',
                ),
                obscureText: false,
              ),
            ],
          ),
        ),
      ),
      actions: [
        Column(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: loading ? null : addStudent,
              child: loading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [const Text('إضافة')],
                    ),
            ),

            Gap(10),

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('إلغاء', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
