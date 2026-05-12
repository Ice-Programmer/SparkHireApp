import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/model/candidate/optimize_resume.dart';
import 'package:spark_hire_app/pages/ai_analysis/candidate_ai_analysis/components/skeleton/score_card_skeleton.dart';

class ScoreCard extends StatelessWidget {
  final OptimizeResumeResult? result;
  const ScoreCard({super.key, this.result});

  @override
  Widget build(BuildContext context) {
    if (result == null) {
      return const ScoreCardSkeleton();
    }
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withAlpha(60),
        ),
      ),
      child: Row(
        children: [
          /// 左边
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "综合优化评分",
                  style: TextStyle(
                    fontSize: 16.sp, // 20 -> 16
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "78",
                      style: TextStyle(
                        fontSize: 40.sp, // 64 -> 48
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 8.h),
                      child: Text(
                        "/100",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ],
                ),

                5.verticalSpace,

                Row(
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      size: 14.sp,
                      color: Theme.of(context).colorScheme.primary,
                    ),

                    4.horizontalSpace,

                    Expanded(
                      child: Text(
                        "比同类用户高出 32%，继续优化可冲击 90+",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.tertiary,
                          height: 1.4,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// 圆形分数
          SizedBox(
            width: 72.w,
            height: 72.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 72.w,
                  height: 72.h,
                  child: CircularProgressIndicator(
                    value: 0.78,
                    strokeWidth: 8,
                    backgroundColor: Colors.deepPurple.shade50,
                    valueColor: AlwaysStoppedAnimation(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "78",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "优秀",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 11.5.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
