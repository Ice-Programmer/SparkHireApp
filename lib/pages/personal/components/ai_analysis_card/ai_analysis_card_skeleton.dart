import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spark_hire_app/theme/skeleton_theme.dart';

class AiAnalysisCardSkeleton extends StatelessWidget {
  const AiAnalysisCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SkeletonTheme>()!;
    return Shimmer.fromColors(
      baseColor: theme.baseColor,
      highlightColor: theme.highlightColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80.h,
            decoration: BoxDecoration(
              color: theme.baseColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
          ),
        ],
      ),
    );
  }
}
