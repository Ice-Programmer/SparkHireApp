import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendRecruitmentTitleCard extends StatelessWidget {
  const RecommendRecruitmentTitleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withAlpha(200),
            Theme.of(context).colorScheme.primary.withAlpha(140),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(40),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Text(
                    "AI 正在为你智能匹配",
                    style: TextStyle(color: Colors.white, fontSize: 11.sp),
                  ),
                ),
                18.verticalSpace,
                Text(
                  "最适合你的职业方向 ✨",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                10.verticalSpace,
                Text(
                  "基于你的技能、经历与兴趣综合分析",
                  style: TextStyle(color: Colors.white, fontSize: 13.sp),
                ),
              ],
            ),
          ),
          Container(
            width: 72.w,
            height: 72.w,
            decoration: BoxDecoration(
              color: Colors.white.withAlpha(50),
              borderRadius: BorderRadius.circular(22.r),
            ),
            child: Icon(Icons.auto_awesome, color: Colors.white, size: 34.sp),
          ),
        ],
      ),
    );
  }
}
