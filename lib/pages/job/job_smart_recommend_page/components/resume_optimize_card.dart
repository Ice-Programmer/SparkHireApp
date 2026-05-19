import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_hire_app/components/custom_button.dart';

class ResumeOptimizeCard extends StatelessWidget {
  const ResumeOptimizeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withAlpha(50),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        children: [
          Container(
            width: 52.w,
            height: 52.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Icon(
              Icons.fact_check_outlined,
              color: Theme.of(context).colorScheme.primary,
              size: 26.sp,
            ),
          ),

          14.horizontalSpace,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "想获得更精准的推荐？",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),

                6.verticalSpace,

                Text(
                  "完善简历信息，提升推荐准确度",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),

          CustomButton(
            textColor: Theme.of(context).colorScheme.onPrimary,
            btnWidth: 80.w,
            btnHeight: 40.h,
            fontSize: 13.sp,
            title: "完善简历",
            backgroundColor: Theme.of(context).colorScheme.primary,
            isShadow: false,
            onPressed: () => context.go('/personal'),
          ),
        ],
      ),
    );
  }
}
