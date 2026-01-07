import 'package:droos_online/features/home/screen/grade_screen.dart';
import 'package:droos_online/features/home/screen/materials_screen.dart';
import 'package:droos_online/features/home/screen/settings_screen_students.dart';
import 'package:droos_online/features/home/screen/task_screen.dart';
import 'package:droos_online/core/widgets/home_page_appbar.dart';
import 'package:droos_online/features/home/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    TaskScreen(),       // المهام
    GradeScreen(),      // الدرجات
    MaterialsScreen(),   // المواد
    SettingsStudentScreen(),    // الإعدادات
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9FAFB),
      body: SafeArea(
        child: Column(
          children: [
            const PagesAppBar(),
            Expanded(
              child: Row(
                children: [
                  SideMenu(
                    selectedIndex: _currentIndex,
                    onItemSelected: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                  Expanded(
                    child: IndexedStack(
                      index: _currentIndex,
                      children: _pages,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
