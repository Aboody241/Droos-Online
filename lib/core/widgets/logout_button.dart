import 'package:droos_online/features/auth/service/auth_service.dart';
import 'package:flutter/material.dart';

//////////================================////////////////
class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "تسجيل الخروج",
      child: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.white,
                title: const Text(
                  "تسجيل الخروج",
                  textDirection: TextDirection.rtl,
                ),
                content: const Text(
                  "هل أنت متأكد من تسجيل الخروج؟",
                  textDirection: TextDirection.rtl,
                ),
                actionsAlignment: MainAxisAlignment.spaceEvenly,
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      backgroundColor: Colors.grey[200],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "لا",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      backgroundColor: Colors.red[600],
                    ),
                    onPressed: () async {
                      await AuthService().logout();
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: const Text(
                      "نعم",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          );
        },
        icon: Icon(Icons.logout, size: 26, color: Colors.grey[600]),
      ),
    );
  }
}
