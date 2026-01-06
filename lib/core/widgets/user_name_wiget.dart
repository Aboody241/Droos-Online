
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droos_online/features/auth/service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserNameText extends StatelessWidget {
  const UserNameText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      stream: UserService().getUserStream(
        FirebaseAuth.instance.currentUser!.uid,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }
    
        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Text("مرحبا");
        }
    
        final name = snapshot.data!.data()!['name'];
    
        return Text(
          "مرحبا  $name 👋",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        );
      },
    );
  }
}
