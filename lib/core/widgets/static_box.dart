import 'package:droos_online/features/dashBoard/screens/main_screen/widgets/dashboard_common_widgets.dart';
import 'package:flutter/material.dart';

class StaticBox extends StatelessWidget {
  final String title;
  final String value;
  final String title2;
  final String value2;
  final Color valueColor;

  const StaticBox({
    super.key,
    required this.title,
    required this.value,
    required this.valueColor,
    required this.title2,
    required this.value2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DashboardStatCard(
            title: title,
            value: value,
            valueColor: valueColor,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: DashboardStatCard(
            title: title2,
            value: value2,
            valueColor: valueColor,
          ),
        ),
      ],
    );
  }
}