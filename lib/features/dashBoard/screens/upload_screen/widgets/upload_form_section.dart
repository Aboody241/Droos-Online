import 'package:droos_online/features/dashBoard/screens/assignmets_screen/widgets/assign_option_tile.dart';
import 'package:droos_online/features/dashBoard/screens/assignmets_screen/widgets/student_selection_widget.dart';
import 'package:droos_online/features/dashBoard/screens/main_screen/widgets/dashboard_common_widgets.dart';
import 'package:droos_online/features/dashBoard/screens/upload_screen/widgets/upload_file_box.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

/// Widget for the upload form section that handles file uploads and assignment details
class UploadFormSection extends StatefulWidget {
  const UploadFormSection({super.key});

  @override
  State<UploadFormSection> createState() => _UploadFormSectionState();
}

class _UploadFormSectionState extends State<UploadFormSection> {
  String assignTo = "كل الطلاب";

  // --- Student Selection ---
  final List<String> allStudents = [
    "أحمد علي",
    "سارة محمد",
    "محمود حسن",
    "ليلى سمير",
    "علي يوسف",
    "ريم فؤاد",
    "كريم جمال",
  ];
  List<String> filteredStudents = [];
  List<String> selectedStudents = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredStudents = List.from(allStudents);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterStudents(String query) {
    setState(() {
      filteredStudents = allStudents
          .where((student) => student.contains(query))
          .toList();
    });
  }

  void toggleSelectAll(bool? value) {
    setState(() {
      if (value == true) {
        selectedStudents = List.from(filteredStudents);
      } else {
        selectedStudents.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "ارفع مستندات جديدة*",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
          const Gap(24),
          const DashboardLabel("ارفع المستندات هنا"),
          const Gap(8),
          const UploadFileBox(),
          const Gap(24),
          const DashboardLabel("العنوان*"),
          const Gap(8),
          const DashboardTextField(hint: "اكتب عنوان المستند"),
          const Gap(24),
          const DashboardLabel("المادة*"),
          const Gap(8),
          DashboardDropdown(
            hint: "اختر المادة",
            items: const [
              "الرياضيات",
              "اللغة العربية",
              "العلوم",
              "الدراسات الاجتماعية",
              "الدراسات الاقتصادية",
            ],
            onChanged: (String? value) {},
          ),
          const Gap(24),
          const DashboardLabel("الوصف*"),
          const Gap(8),
          const DashboardTextField(hint: "اكتب وصف المستند"),
          const Gap(24),
          const DashboardLabel("تعيين إلى*"),
          const Gap(8),
          AssignOptionTile(
            value: "كل الطلاب",
            groupValue: assignTo,
            label: "كل الطلاب",
            icon: Icons.people_outline,
            onChanged: (val) => setState(() => assignTo = val!),
          ),
          const Gap(12),
          AssignOptionTile(
            value: "فصل",
            groupValue: assignTo,
            label: "طلاب محددين",
            icon: Icons.person_search_outlined,
            onChanged: (val) => setState(() => assignTo = val!),
          ),
          const Gap(24),
          if (assignTo == "فصل") ...[
            StudentSelectionWidget(
              searchController: searchController,
              filteredStudents: filteredStudents,
              selectedStudents: selectedStudents,
              onFilterChanged: filterStudents,
              onToggleSelectAll: toggleSelectAll,
              onStudentToggled: (student, isSelected) {
                setState(() {
                  if (isSelected) {
                    selectedStudents.add(student);
                  } else {
                    selectedStudents.remove(student);
                  }
                });
              },
            ),
            const Gap(24),
          ],
          const DashBoardButton(
            text: 'ارفع المستند',
            icon: Icons.upload,
          ),
        ],
      ),
    );
  }
}
