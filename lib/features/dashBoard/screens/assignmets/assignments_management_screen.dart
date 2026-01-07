import 'package:droos_online/core/theme/colors.dart';
import 'package:droos_online/core/widgets/pages_title_and_descriptions.dart';
import 'package:droos_online/features/dashBoard/screens/main_screen/widgets/dashboard_common_widgets.dart';
import 'package:droos_online/features/dashBoard/screens/assignmets/widgets/assignment_widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AssignmentsManagementScreen extends StatefulWidget {
  const AssignmentsManagementScreen({super.key});

  @override
  State<AssignmentsManagementScreen> createState() =>
      _AssignmentsManagementScreenState();
}

class _AssignmentsManagementScreenState
    extends State<AssignmentsManagementScreen> {
  String selectedPriority = "عالي";
  String assignTo = "الكل";
  String? selectedSubject;

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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(24),
              const PagesTitleAndDescription(title: 'إدارة المهام', description: 'انشاء وادارة المهام للطلاب',),
              const Gap(32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// FORM SIDE
                  Expanded(
                    flex: 2,
                    child: _buildAssignmentForm(),
                  ),

                  const SizedBox(width: 32),

                  /// STATS & RECENT SIDE
                  Expanded(
                    flex: 1,
                    child: _buildStatsAndRecent(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  
  Widget _buildAssignmentForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DashboardCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "تفاصيل المهمة",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const Gap(24),
              const DashboardLabel("عنوان المهمة *"),
              const Gap(8),
              const DashboardTextField(
                hint: "مثال: واجب الرياضيات – الفصل الخامس",
              ),
              const Gap(24),
              const DashboardLabel("المادة *"),
              const Gap(8),
              DashboardDropdown(
                hint: "اختر المادة",
                value: selectedSubject,
                items: const ["رياضيات", "لغة إنجليزية", "فيزياء", "كيمياء"],
                onChanged: (val) => setState(() => selectedSubject = val),
              ),
              const Gap(24),
              const DashboardLabel("وصف المهمة *"),
              const Gap(8),
              const DashboardTextField(
                hint: "اكتب التعليمات التفصيلية للمهمة...",
                maxLines: 4,
              ),
              const Gap(24),
              const DashboardLabel("تاريخ التسليم *"),
              const Gap(8),
              const DashboardTextField(
                hint: "يوم / شهر / سنة",
                icon: Icons.calendar_today_outlined,
              ),
              const Gap(24),
              const DashboardLabel("مستوى الأولوية"),
              const Gap(12),
              PrioritySelector(
                selectedPriority: selectedPriority,
                onPriorityChanged: (val) => setState(() => selectedPriority = val),
              ),
              const Gap(24),
              const DashboardLabel("تعيين إلى"),
              const Gap(12),
              AssignOptionTile(
                value: "الكل",
                groupValue: assignTo,
                label: "جميع الطلاب",
                icon: Icons.group_outlined,
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
              const Gap(20),

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

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "إضافة المهمة",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatsAndRecent() {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(
              child: DashboardStatCard(
                title: "المهام النشطة",
                value: "12",
                valueColor: Color(0xFF2563EB),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: DashboardStatCard(
                title: "المهام المكتملة",
                value: "45",
                valueColor: Color(0xFF059669),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        DashboardCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "أحدث المهام",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  Icon(Icons.more_horiz, color: Color(0xFF9CA3AF)),
                ],
              ),
              const SizedBox(height: 20),
              const TaskItemTile(
                title: "واجب الرياضيات – الفصل الخامس",
                subtitle: "الصف 11-A • قبل ساعتين",
                active: true,
              ),
              const TaskItemTile(
                title: "مقال اللغة الإنجليزية",
                subtitle: "الصف 11-B • يوم أمس",
                active: true,
              ),
              const TaskItemTile(
                title: "تقرير معمل الفيزياء",
                subtitle: "الصف 10-C • 3 أيام مضت",
                active: false,
              ),
              const Gap(16),
              TextButton(
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("عرض الكل"),
                    Gap(4),
                    Icon(Icons.arrow_back, size: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
