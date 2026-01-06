import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:droos_online/core/theme/colors.dart';
import 'package:droos_online/core/widgets/logout_button.dart';
import 'package:droos_online/core/widgets/user_name_wiget.dart';
import 'package:droos_online/features/auth/service/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PagesAppBar extends StatelessWidget {
  const PagesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            UserNameText(),

            Spacer(),

            Text(
              "Droos Online",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.school_outlined, size: 40, color: AppColors.primary),
                                    LogoutButton(),

          ],
        ),
      ),
    );
  }
}
