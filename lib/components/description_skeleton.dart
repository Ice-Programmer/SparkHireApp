import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spark_hire_app/theme/skeleton_theme.dart';

class DescriptionSkeleton extends StatelessWidget {
  const DescriptionSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SkeletonTheme>()!;

    return Shimmer.fromColors(
      baseColor: theme.baseColor,
      highlightColor: theme.highlightColor,
      child: Column(
        children: [
          Row(
            children: [
              Container(width: 30.w, height: 10.h, color: theme.baseColor),

              5.horizontalSpace,

              Container(width: 140.w, height: 10, color: theme.baseColor),
            ],
          ),

          6.verticalSpace,

          Row(
            children: [
              Container(width: 60.w, height: 10.h, color: theme.baseColor),

              5.horizontalSpace,

              Container(width: 180.w, height: 10, color: theme.baseColor),
            ],
          ),

          6.verticalSpace,

          Row(
            children: [
              Container(width: 50.w, height: 10.h, color: theme.baseColor),

              5.horizontalSpace,

              Container(width: 160.w, height: 10, color: theme.baseColor),
            ],
          ),
        ],
      ),
    );
  }
}
