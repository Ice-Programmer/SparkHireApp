import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/custom_tag.dart';

class RecommendRecruitmentCard extends StatelessWidget {
  final String index;
  final String title;
  final String match;
  final String reason;
  final List<String> tags;

  const RecommendRecruitmentCard({
    super.key,
    required this.index,
    required this.title,
    required this.match,
    required this.reason,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // 序号
              Container(
                width: 38.w,
                height: 38.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withAlpha(30),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  index,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                  ),
                ),
              ),

              16.horizontalSpace,

              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),

              const Spacer(),

              CustomTag(
                fontSize: 12.sp,
                text: "推荐度 $match",
                color: Theme.of(context).colorScheme.primary,
                horizontalPadding: 8.w,
                verticalPadding: 2.h,
              ),
            ],
          ),

          10.verticalSpace,

          Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children:
                tags
                    .map(
                      (e) => CustomTag(
                        fontSize: 11.sp,
                        text: e,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    )
                    .toList(),
          ),

          10.verticalSpace,

          Text(
            reason,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 13.sp,
              height: 1.7,
            ),
          ),

          10.verticalSpace,

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "查看详情  >",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
