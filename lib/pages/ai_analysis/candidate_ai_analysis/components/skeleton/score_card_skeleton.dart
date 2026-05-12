import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spark_hire_app/theme/skeleton_theme.dart';

class ScoreCardSkeleton extends StatelessWidget {
  const ScoreCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SkeletonTheme>()!;
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: theme.highlightColor, width: 1.w),
      ),
      child: Shimmer.fromColors(
        baseColor: theme.baseColor,
        highlightColor: theme.highlightColor,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 18.w,
                  width: MediaQuery.of(context).size.width * 0.3,
                  color: theme.baseColor,
                ),

                10.verticalSpace,

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 30.h,
                      width: 50.h,
                      color: theme.baseColor,
                    ),

                    8.horizontalSpace,

                    Container(
                      height: 15.h,
                      width: 30.h,
                      color: theme.baseColor,
                    ),
                  ],
                ),

                16.verticalSpace,

                Container(
                  height: 20.w,
                  width: MediaQuery.of(context).size.width * 0.55,
                  color: theme.baseColor,
                ),
              ],
            ),

            const Spacer(),

            Container(
              height: 78.w,
              width: 78.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: theme.baseColor, width: 8.w),
              ),
            ),

            10.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
