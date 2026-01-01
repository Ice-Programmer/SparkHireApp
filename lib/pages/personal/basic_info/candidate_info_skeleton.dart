import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spark_hire_app/theme/skeleton_theme.dart';

class CandidateInfoSkeleton extends StatelessWidget {
  const CandidateInfoSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SkeletonTheme>()!;

    return Shimmer.fromColors(
      baseColor: theme.baseColor,
      highlightColor: theme.highlightColor,
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 64.w,
              width: 64.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.r),
                color: theme.baseColor,
              ),
            ),

            16.horizontalSpace,

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 24.w,
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: theme.baseColor,
                ),
                10.verticalSpace,
                Container(
                  height: 20.w,
                  width: MediaQuery.of(context).size.width * 0.55,
                  color: theme.baseColor,
                ),
              ],
            ),

            Spacer(),

            Container(
              height: 26.w,
              width: 26.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.r),
                color: theme.baseColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
