import 'package:droos_online/core/theme/colors.dart';
import 'package:droos_online/features/auth/screens/widgets/login_actions.dart';
import 'package:droos_online/features/auth/screens/widgets/login_footer.dart';
import 'package:droos_online/features/auth/screens/widgets/login_form.dart';
import 'package:droos_online/features/auth/screens/widgets/login_header.dart';
import 'package:droos_online/features/auth/screens/widgets/role_selection.dart';
import 'package:droos_online/features/auth/service/auth_service.dart';
import 'package:droos_online/features/auth/service/user_service.dart';
import 'package:flutter/material.dart';

import 'admin_dashboard.dart';
import 'student_dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  final authService = AuthService();
  final userService = UserService();

  bool loading = false;
  String selectedRole = "Student"; // القيمة الافتراضية

  Future<void> login() async {
    setState(() => loading = true);

    try {
      final user = await authService.login(
        emailCtrl.text.trim(),
        passCtrl.text.trim(),
      );

      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Login failed: Invalid credentials')),
        );
        setState(() => loading = false);
        return;
      }

      final role = await userService.getUserRole(user.uid);

      // تحقق من الدور المختار قبل الانتقال
      if (selectedRole.toLowerCase() == role?.toLowerCase()) {
        if (role == 'admin') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const AdminDashboard()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const StudentDashboard()),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text('Role mismatch: Please select the correct user type')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $e')),
      );
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F5FF),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 500,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const LoginHeader(),
                const SizedBox(height: 30),

                RoleSelection(
                  selectedRole: selectedRole,
                  onRoleChanged: (role) => setState(() => selectedRole = role),
                ),
                const SizedBox(height: 20),

                LoginForm(
                  emailController: emailCtrl,
                  passwordController: passCtrl,
                ),
                const SizedBox(height: 15),

                const LoginActions(),
                const SizedBox(height: 20),

                // زر تسجيل الدخول
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: loading ? null : login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: loading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Sign In / تسجيل الدخول",
                            style: TextStyle(fontSize: 16 , color: Colors.white),
                          ),
                  ),
                ),

                const SizedBox(height: 15),
                const LoginFooter(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
