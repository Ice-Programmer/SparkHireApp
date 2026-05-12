import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverviewCardContent extends StatelessWidget {
  const OverviewCardContent({super.key});

  @override
  Widget build(BuildContext context) {
    final overviewItems = [
      {"title": "个人信息", "icon": Icons.person, "count": "2 条待优化"},
      {"title": "教育经历", "icon": Icons.school, "count": "1 条待优化"},
      {"title": "工作经历", "icon": Icons.work, "count": "3 条待优化"},
      {"title": "技能标签", "icon": Icons.code, "count": "1 条待优化"},
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: overviewItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.6,
      ),
      itemBuilder: (context, index) {
        final item = overviewItems[index];
        return Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(
              color: Theme.of(
                context,
              ).colorScheme.outline.withValues(alpha: 0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 43.w,
                    height: 43.w,
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withAlpha(25),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      item["icon"] as IconData,
                      color: Theme.of(context).colorScheme.primary,
                      size: 23.sp,
                    ),
                  ),

                  20.horizontalSpace,

                  Text(
                    item["title"] as String,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              4.verticalSpace,

              Text(
                item["count"] as String,
                style: TextStyle(
                  color: Colors.orange.shade600,
                  fontWeight: FontWeight.w600,
                  fontSize: 11.5.sp,
                ),
              ),

              8.verticalSpace,

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: 0.45,
                  minHeight: 4.h,
                  backgroundColor: Theme.of(context).colorScheme.inverseSurface,
                  valueColor: AlwaysStoppedAnimation(Colors.orange.shade400),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
