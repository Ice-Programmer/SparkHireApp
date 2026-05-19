import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spark_hire_app/theme/skeleton_theme.dart';

class RecommendRecruitmentCardSkeleton extends StatelessWidget {
  const RecommendRecruitmentCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SkeletonTheme>()!;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: theme.highlightColor, width: 1.w),
      ),
      child: Shimmer.fromColors(
        baseColor: theme.baseColor,
        highlightColor: theme.highlightColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 38.w,
                  height: 38.w,
                  decoration: BoxDecoration(
                    color: theme.baseColor,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
                16.horizontalSpace,
                Container(
                  height: 16.h,
                  width: MediaQuery.of(context).size.width * 0.35,
                  color: theme.baseColor,
                ),
                const Spacer(),
                Container(
                  height: 18.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: theme.baseColor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ],
            ),
            10.verticalSpace,
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: [
                _buildTag(theme, 70.w),
                _buildTag(theme, 60.w),
                _buildTag(theme, 90.w),
              ],
            ),
            12.verticalSpace,
            Container(height: 12.h, color: theme.baseColor),
            8.verticalSpace,
            Container(height: 12.h, color: theme.baseColor),
            8.verticalSpace,
            Container(
              height: 12.h,
              width: MediaQuery.of(context).size.width * 0.55,
              color: theme.baseColor,
            ),
            12.verticalSpace,
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 12.h,
                width: 90.w,
                color: theme.baseColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTag(SkeletonTheme theme, double width) {
  return Container(
    height: 18.h,
    width: width,
    decoration: BoxDecoration(
      color: theme.baseColor,
      borderRadius: BorderRadius.circular(10.r),
    ),
  );
}
