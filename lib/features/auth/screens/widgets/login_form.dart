import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email / البريد الإلكتروني ",
          style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w600),
        ),
        Gap(10),
        TextFormField(
          controller: widget.emailController,
          decoration: InputDecoration(
            hintText: "Email / البريد الإلكتروني",
            hintStyle: TextStyle(color: Colors.grey),
            labelStyle: TextStyle(color: Colors.grey),
            prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey , size: 20),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blueAccent, width: 2.5),
            ),

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Password / كلمة المرور ",
          style: TextStyle(color: Colors.grey.shade700, fontWeight: FontWeight.w600),
        ),
      Gap(10),
        TextFormField(
          controller: widget.passwordController,
          obscureText: isObscured,
          enableSuggestions: false,
          autocorrect:false,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined, 
                color: Colors.grey, 
                size: 20
              ),
              onPressed: () {
                setState(() {
                  isObscured = !isObscured;
                });
              },
            ),
            hintText: "Password / كلمة المرور",
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: const Icon(Icons.lock_outlined, color: Colors.grey , size: 20),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blueAccent, width: 2.5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
