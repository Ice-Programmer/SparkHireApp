import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spark_hire_app/components/custom_divider.dart';
import 'package:spark_hire_app/theme/skeleton_theme.dart';

class CareerInfoCardSkeleton extends StatelessWidget {
  const CareerInfoCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<SkeletonTheme>()!;

    return Shimmer.fromColors(
      baseColor: theme.baseColor,
      highlightColor: theme.highlightColor,
      child: Padding(
        padding: EdgeInsets.only(top: 10.h),
        child: ListView.separated(
          separatorBuilder: (context, index) => CustomDivider(height: 40.h),
          itemCount: 10,
          itemBuilder: (context, index) => _buildCardSkeleton(theme, context),
        ),
      ),
    );
  }

  Widget _buildCardSkeleton(SkeletonTheme theme, BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 30.h),
          child: Container(
            height: 50.w,
            width: 50.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: theme.baseColor,
            ),
          ),
        ),

        16.horizontalSpace,

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 18.w,
              width: MediaQuery.of(context).size.width * 0.2,
              color: theme.baseColor,
            ),

            10.verticalSpace,

            Container(
              height: 18.w,
              width: MediaQuery.of(context).size.width * 0.6,
              color: theme.baseColor,
            ),

            10.verticalSpace,

            Container(
              height: 18.w,
              width: MediaQuery.of(context).size.width * 0.25,
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
    );
  }
}
