import 'package:droos_online/core/theme/app_text_style.dart';
import 'package:droos_online/core/theme/colors.dart';
import 'package:droos_online/core/widgets/pages_title_and_descriptions.dart';
import 'package:droos_online/features/dashBoard/screens/main_screen/widgets/dashboard_common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SettingsAdminScreen extends StatefulWidget {
  const SettingsAdminScreen({super.key});

  @override
  State<SettingsAdminScreen> createState() => _SettingsAdminScreenState();
}

class _SettingsAdminScreenState extends State<SettingsAdminScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          children: [
            const Gap(24),
            const PagesTitleAndDescription(
              title: "الإعدادات",
              description: "إدارة ومراقبة معلومات الطلاب المسجلين في المنصة",
            ),
            const Gap(32),

            // TabBar
            DashboardCard(
              child: TabBar(
                controller: _tabController,
                indicatorWeight: 2,
                labelColor: AppColors.primary,
                dividerColor: AppColors.background,
                indicatorColor: AppColors.primary,
                automaticIndicatorColorAdjustment: true,
                tabs: const [
                  Tab(text: "الملف الشخصي", icon: Icon(Icons.person_outline)),
                  Tab(text: "المستخدمين", icon: Icon(Icons.people_alt_outlined)),
                  Tab(text: "الأشعارات", icon: Icon(Icons.notifications_none_outlined)),
                  Tab(text: "الحماية", icon: Icon(Icons.shield_outlined)),
                ],
              ),
            ),

            const Gap(16),

            // TabBarView
            SizedBox(
              height: 400,
              child: TabBarView(
                controller: _tabController,
                children: const [
                  ProfileTab(),
                  UsersTab(),
                  NotificationsTab(),
                  SecurityTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DashboardCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("الملف الشخصي", style: AppTextStyles.black18Bold),
          Text("ادر معلوماتك الشخصية واعدادات حسابك ", style: AppTextStyles.black14W500),
          Gap(16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
crossAxisAlignment: CrossAxisAlignment.center,              children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: AppColors.background,
                    child: Icon(Icons.person_outline, color: AppColors.primary),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(Icons.camera_alt_outlined, color: AppColors.background, size: 16),
                    ),
                  ),
                ],
              ),
              Gap(25),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("محمد أحمد", style: AppTextStyles.black16Bold),
                  Text("mohamed.ahmed@example.com", style: AppTextStyles.black14W500),
                  Gap(5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(15),
                      
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.white , size: 12),
                        Gap(5),
                        Text("مشرف", style: TextStyle(color: Colors.white , fontSize: 12)),
                      ],
                    ),
                  )
            ,  Gap(16),
              
                ],
              ),
            ],),
          )
      , 
       Gap(16),

       Row(children: [
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),  
                    onPressed: (){}, child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.mode_edit_outlined , color: Colors.white , size: 16),
                        Gap(5),
                        Text("تعديل العلومات الشخصية" , style: AppTextStyles.white16Bold.copyWith(fontSize: 12),),
                      ],
                    ))),
                Gap(16),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    
                    style: ElevatedButton.styleFrom(
                      
                      backgroundColor: AppColors.background,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: AppColors.primary , width: 0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: (){}, child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.lock_outline , color: AppColors.primary , size: 16),
                        Gap(5),
                        Text("تغيير كلمة المرور" , style: AppTextStyles.black16Bold.copyWith(fontSize: 12 , color: AppColors.primary),),
                      ],
                    ))),
              ],)
                
        ],),
      ),
    );
  }
}

class UsersTab extends StatelessWidget {
  const UsersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SecurityTab extends StatelessWidget {
  const SecurityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
