import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spark_hire_app/theme/skeleton_theme.dart';

class SuggestionCardSkeleton extends StatelessWidget {
  const SuggestionCardSkeleton({super.key});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 28.w,
                  width: 28.h,
                  decoration: BoxDecoration(
                    color: theme.baseColor,
                    borderRadius: BorderRadius.circular(14.w),
                  ),
                ),

                10.horizontalSpace,

                Container(height: 20.w, width: 80.w, color: theme.baseColor),

                Spacer(),

                Container(height: 20.w, width: 60.w, color: theme.baseColor),

                10.horizontalSpace,

                Container(
                  height: 20.w,
                  width: 20.h,
                  decoration: BoxDecoration(
                    color: theme.baseColor,
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                ),
              ],
            ),

            16.verticalSpace,

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 20.w,
                        width: 20.h,
                        decoration: BoxDecoration(
                          color: theme.baseColor,
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                      ),

                      8.horizontalSpace,

                      Container(
                        height: 18.h,
                        width: MediaQuery.of(context).size.width * 0.45,
                        color: theme.baseColor,
                      ),

                      const Spacer(),

                      Container(
                        height: 18.h,
                        width: 30.w,
                        color: theme.baseColor,
                      ),
                    ],
                  ),

                  8.verticalSpace,

                  Container(height: 18.w, color: theme.baseColor),

                  8.verticalSpace,

                  Container(height: 18.w, color: theme.baseColor),

                  8.verticalSpace,

                  Container(height: 18.w, color: theme.baseColor),

                  10.verticalSpace,

                  Row(
                    children: [
                      Container(
                        height: 30.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                          color: theme.baseColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),

                      const Spacer(),

                      Container(
                        height: 18.h,
                        width: 18.w,
                        decoration: BoxDecoration(
                          color: theme.baseColor,
                          borderRadius: BorderRadius.circular(9.r),
                        ),
                      ),

                      10.horizontalSpace,

                      Container(
                        height: 18.h,
                        width: 100.w,
                        color: theme.baseColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
