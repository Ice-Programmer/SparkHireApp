import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spark_hire_app/pages/personal/components/profile_card/profile_card_skeleton.dart';
import 'package:spark_hire_app/theme/skeleton_theme.dart';

class SummaryInfoCardSkeleton extends StatelessWidget {
  const SummaryInfoCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SkeletonTheme>()!;
    return ProfileCardSkeleton(
      child: Shimmer.fromColors(
        baseColor: theme.baseColor,
        highlightColor: theme.highlightColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 300.w, height: 10.h, color: theme.baseColor),

            8.verticalSpace,

            Container(width: 300.w, height: 10.h, color: theme.baseColor),

            8.verticalSpace,

            Container(width: 260.w, height: 10.h, color: theme.baseColor),
          ],
        ),
      ),
    );
  }
}
