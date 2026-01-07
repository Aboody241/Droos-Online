import 'package:droos_online/features/dashBoard/screens/assignmets/assignments_management_screen.dart';
import 'package:droos_online/features/dashBoard/screens/grades/grades_management_screen.dart';
import 'package:droos_online/features/dashBoard/screens/student_management/students_management_screen.dart';
import 'package:droos_online/features/dashBoard/screens/upload_screen/upload_assignments_screen.dart';
import 'package:droos_online/features/dashBoard/screens/main_screen/widgets/side_menue_dashboard.dart';
import 'package:droos_online/core/widgets/home_page_appbar.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    StudentsManagementScreen(),
    AssignmentsManagementScreen(),
    GradesManagementScreen(),
    UploadAssignmentsScreen(),
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
                  SideMenuDashboard(
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
