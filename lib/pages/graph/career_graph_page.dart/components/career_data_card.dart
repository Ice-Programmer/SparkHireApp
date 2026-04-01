import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/theme/semantic_theme.dart';

class CareerDataCard extends StatelessWidget {
  const CareerDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // 在招岗位数
        Expanded(
          child: _buildDataColumn(
            context: context,
            icon: Icons.person_outline,
            iconColor: Theme.of(context).semantic.success,
            label: "在招岗位数",
            value: "174",
          ),
        ),

        Container(width: 1, height: 40.h, color: Colors.grey.shade200),

        // 薪资中位数
        Expanded(
          child: _buildDataColumn(
            context: context,
            icon: Icons.trending_up,
            iconColor: Theme.of(context).colorScheme.primary,
            label: "薪资中位数",
            value: "2.3K",
          ),
        ),

        Container(width: 1, height: 40.h, color: Colors.grey.shade200),

        // 面试热度
        Expanded(
          child: _buildDataColumn(
            context: context,
            icon: Icons.local_fire_department,
            iconColor: Colors.redAccent,
            // 紫色
            label: "面试热度",
            value: "高",
          ),
        ),
      ],
    );
  }

  Widget _buildDataColumn({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 17.sp),

            6.horizontalSpace,

            Text(
              label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontSize: 13.sp,
              ),
            ),
          ],
        ),

        8.verticalSpace,

        Text(
          value,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
