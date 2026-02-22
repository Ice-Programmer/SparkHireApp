import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spark_hire_app/pages/personal/components/profile_card/profile_card_skeleton.dart';
import 'package:spark_hire_app/theme/skeleton_theme.dart';

class TagInfoCardSkeleton extends StatelessWidget {
  const TagInfoCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SkeletonTheme>()!;
    return ProfileCardSkeleton(
      child: Shimmer.fromColors(
        baseColor: theme.baseColor,
        highlightColor: theme.highlightColor,
        child: Wrap(
          spacing: 10.w,
          runSpacing: 5.h,
          children: [
            Container(
              width: 80.w,
              height: 26.h,
              decoration: BoxDecoration(
                color: theme.baseColor,
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),

            Container(
              width: 80.w,
              height: 26.h,
              decoration: BoxDecoration(
                color: theme.baseColor,
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            Container(
              width: 80.w,
              height: 26.h,
              decoration: BoxDecoration(
                color: theme.baseColor,
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
