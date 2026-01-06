import 'package:droos_online/features/home/screen/materials_screen.dart';
import 'package:droos_online/features/home/screen/grade_screen.dart';
import 'package:droos_online/features/home/screen/settings_screen.dart';
import 'package:droos_online/features/home/screen/task_screen.dart';
import 'package:droos_online/features/home/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> pages = const [
    TaskScreen(),
    GradeScreen(),
    MaterialsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideMenu(
            selectedIndex: _selectedIndex,
            onItemSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: IndexedStack(
              index: _selectedIndex,
              children: pages,
            ),
          ),
        ],
      ),
    );
  }
}
