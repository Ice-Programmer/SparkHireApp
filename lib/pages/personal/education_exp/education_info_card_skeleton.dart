import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spark_hire_app/pages/personal/components/profile_card/profile_card_skeleton.dart';
import 'package:spark_hire_app/theme/skeleton_theme.dart';

class EducationInfoCardSkeleton extends StatelessWidget {
  const EducationInfoCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SkeletonTheme>()!;
    return ProfileCardSkeleton(
      child: Shimmer.fromColors(
        baseColor: theme.baseColor,
        highlightColor: theme.highlightColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: theme.baseColor,
                  ),
                ),

                20.horizontalSpace,

                _buildEducationContentSkeleton(theme, context),

                Spacer(),

                Center(
                  child: Container(
                    height: 24.w,
                    width: 24.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.baseColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEducationContentSkeleton(
    SkeletonTheme theme,
    BuildContext context,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 16.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: theme.baseColor,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),

        6.verticalSpace,

        Container(
          height: 16.h,
          width: 100.w,
          decoration: BoxDecoration(
            color: theme.baseColor,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),

        6.verticalSpace,

        Container(
          height: 16.h,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            color: theme.baseColor,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ],
    );
  }
}
