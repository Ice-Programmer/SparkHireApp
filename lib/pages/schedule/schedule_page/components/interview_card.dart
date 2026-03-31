import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/components/custom_divider.dart';
import 'package:spark_hire_app/model/interview/interview_info.dart';

class InterviewCard extends StatelessWidget {
  final InterviewInfo interviewInfo;

  const InterviewCard({super.key, required this.interviewInfo});

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
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.primary.withValues(alpha: 0.04),
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).colorScheme.primary.withValues(alpha: 0.1),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(39.r),
                ),
                padding: EdgeInsets.all(8.r),
                child: CacheImage(
                  height: 26.h,
                  width: 26.w,
                  imageUrl: interviewInfo.companyLink,
                  borderRadius: 6.r,
                ),
              ),

              12.horizontalSpace,

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    interviewInfo.recruitmentName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),

                  Text(
                    interviewInfo.companyName,
                    style: TextStyle(color: Colors.grey, fontSize: 12.sp),
                  ),
                ],
              ),
            ],
          ),

          16.verticalSpace,

          const CustomDivider(thickness: 0.8),

          8.verticalSpace,

          _infoRow(
            context,
            Icons.calendar_today_outlined,
            "日期",
            formatUnixTimestampDate(interviewInfo.interviewTs),
          ),

          8.verticalSpace,

          _infoRow(
            context,
            Icons.access_time,
            "时间",
            formatTo24Hour(interviewInfo.interviewTs),
          ),

          8.verticalSpace,

          _infoRow(
            context,
            Icons.videocam_outlined,
            "面试时长",
            '${interviewInfo.duration} 分钟',
          ),

          8.verticalSpace,

          _infoRow(
            context,
            Icons.videocam_outlined,
            "面试方式",
            interviewInfo.type.getLocalizedName(context),
          ),

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

  String formatUnixTimestampDate(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('yyyy-MM-dd').format(date);
  }

  String formatTo24Hour(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('HH:mm').format(date);
  }
}
