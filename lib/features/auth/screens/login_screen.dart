import 'package:droos_online/core/theme/colors.dart';
import 'package:droos_online/features/auth/screens/widgets/login_actions.dart';
import 'package:droos_online/features/auth/screens/widgets/login_footer.dart';
import 'package:droos_online/features/auth/screens/widgets/login_form.dart';
import 'package:droos_online/features/auth/screens/widgets/login_header.dart';
import 'package:droos_online/features/auth/screens/widgets/role_selection.dart';
import 'package:droos_online/features/auth/service/auth_service.dart';
import 'package:droos_online/features/auth/service/user_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  final AuthService authService = AuthService();
  final UserService userService = UserService();

  bool loading = false;
  String selectedRole = "Student";

  Future<void> login() async {
    if (emailCtrl.text.isEmpty || passCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    setState(() => loading = true);

    try {
      // 1️⃣ Auth
      final user = await authService.login(
        email: emailCtrl.text.trim(),
        password: passCtrl.text.trim(),
      );

      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
        );
        return;
      }

      // 2️⃣ Firestore user
      final userData = await userService.getUser(user.uid);

      if (userData == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User not found in database')),
        );
        return;
      }

      final role = userData['role'];

      // 3️⃣ Role check
      if (selectedRole.toLowerCase() != role.toLowerCase()) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Role mismatch: your account is $role'),
          ),
        );
        return;
      }

      // 4️⃣ Navigate
      if (role == 'admin') {
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed')),
      );
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
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
              children: [
                const LoginHeader(),
                const SizedBox(height: 30),

                RoleSelection(
                  selectedRole: selectedRole,
                  onRoleChanged: (role) =>
                      setState(() => selectedRole = role),
                ),
                const SizedBox(height: 20),

                LoginForm(
                  emailController: emailCtrl,
                  passwordController: passCtrl,
                ),
                const SizedBox(height: 15),

                const LoginActions(),
                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: loading ? null : login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: loading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          )
                        : const Text(
                            "Sign In / تسجيل الدخول",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
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
