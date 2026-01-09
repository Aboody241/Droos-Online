import 'package:droos_online/features/auth/service/auth_service.dart';
import 'package:droos_online/features/auth/service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  final authService = AuthService();
  final userService = UserService();

  bool loading = false;

  Future<void> addStudent() async {
    if (nameCtrl.text.isEmpty ||
        emailCtrl.text.isEmpty ||
        passwordCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('الرجاء ملء جميع الحقول المطلوبة')),
      );
      return;
    }

    if (passwordCtrl.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('كلمة المرور يجب أن تحتوي على الأقل على 6 أحرف')),
      );
      return;
    }

    setState(() => loading = true);

    try {
      // Register student using AuthService
      await authService.registerStudent(
        email: emailCtrl.text.trim(),
        password: passwordCtrl.text.trim(),
        name: nameCtrl.text.trim(),
      );

      // Clear form
      nameCtrl.clear();
      emailCtrl.clear();
      passwordCtrl.clear();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم تسجيل الطالب بنجاح')),
        );
        // Optionally navigate back or clear the form
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'حدث خطأ أثناء تسجيل الطالب';
      
      if (e.code == 'email-already-in-use') {
        errorMessage = 'البريد الإلكتروني مستخدم مسبقاً';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'البريد الإلكتروني غير صالح';
      } else if (e.code == 'weak-password') {
        errorMessage = 'كلمة المرور ضعيفة جداً';
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('حدث خطأ غير متوقع')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => loading = false);
      }
    }
}

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة طالب جديد'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(labelText: 'الاسم'),
            ),
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(labelText: 'البريد الإلكتروني'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordCtrl,
              decoration: const InputDecoration(labelText: 'كلمة المرور'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: loading ? null : addStudent,
                child: loading
                    ? const CircularProgressIndicator()
                    : const Text('تسجيل الطالب'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
