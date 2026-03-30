import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/custom_divider.dart';

class InterviewCard extends StatelessWidget {
  final String logoUrl, company, position, date, time, type;

  const InterviewCard({
    super.key,
    required this.logoUrl,
    required this.company,
    required this.position,
    required this.date,
    required this.time,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 0.2,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.1),
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Image.network(logoUrl),
                ),
              ),

              12.horizontalSpace,

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    position,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    company,
                    style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  ),
                ],
              ),
            ],
          ),

          16.verticalSpace,

          const CustomDivider(thickness: 0.8),

          8.verticalSpace,

          _infoRow(context, Icons.calendar_today_outlined, "日期", date),

          8.verticalSpace,

          _infoRow(context, Icons.access_time, "时间", time),

          8.verticalSpace,

          _infoRow(context, Icons.videocam_outlined, "面试方式", type),

          20.verticalSpace,

          // 点击进入按钮
          SizedBox(
            width: double.infinity,
            height: 40.h,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Theme.of(context).colorScheme.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                "点击进入",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      children: [
        Icon(icon, size: 18.sp, color: Theme.of(context).colorScheme.tertiary),

        8.horizontalSpace,

        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontSize: 14.sp,
          ),
        ),

        const Spacer(),

        Text(
          value,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
