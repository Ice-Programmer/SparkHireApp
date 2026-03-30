import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spark_hire_app/theme/skeleton_theme.dart';

class CompanyBenefitContentSkeleton extends StatelessWidget {
  const CompanyBenefitContentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SkeletonTheme>()!;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: theme.baseColor.withValues(alpha: 0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Shimmer.fromColors(
          baseColor: theme.baseColor,
          highlightColor: theme.highlightColor,
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 16.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                        color: theme.baseColor,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),

                    const Spacer(),

                    Container(
                      height: 24.w,
                      width: 24.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.baseColor,
                      ),
                    ),
                  ],
                ),

                16.verticalSpace,

                _buildBenefitContent(theme),

                10.verticalSpace,

                _buildBenefitContent(theme),

                10.verticalSpace,

                _buildBenefitContent(theme),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBenefitContent(SkeletonTheme theme) {
    return Row(
      children: [
        Container(
          height: 20.w,
          width: 20.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.baseColor,
          ),
        ),

        10.horizontalSpace,

        Container(
          height: 16.h,
          width: 150.w,
          decoration: BoxDecoration(
            color: theme.baseColor,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
      ],
    );
  }
}
