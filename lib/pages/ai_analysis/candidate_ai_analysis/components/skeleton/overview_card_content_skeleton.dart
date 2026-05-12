import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spark_hire_app/theme/skeleton_theme.dart';

class OverviewCardContentSkeleton extends StatelessWidget {
  const OverviewCardContentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.6,
      ),
      itemBuilder: (_, _) {
        return _buildSkeletonCard(context);
      },
    );
  }
}

Widget _buildSkeletonCard(BuildContext context) {
  final theme = Theme.of(context).extension<SkeletonTheme>()!;

  return Shimmer.fromColors(
    baseColor: theme.baseColor,
    highlightColor: theme.highlightColor,
    child: Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: theme.baseColor, width: 0.5.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 43.w,
                height: 43.w,
                decoration: BoxDecoration(
                  color: theme.baseColor,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),

              20.horizontalSpace,

              Container(height: 18.h, width: 60.w, color: theme.baseColor),
            ],
          ),

          const Spacer(),

          4.verticalSpace,

          Container(height: 10.w, width: 80.w, color: theme.baseColor),

          8.verticalSpace,

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: 0.45,
              minHeight: 4.h,
              backgroundColor: Theme.of(context).colorScheme.inverseSurface,
              valueColor: AlwaysStoppedAnimation(Colors.orange.shade400),
            ),
          ),
        ],
      ),
    ),
  );
}
