import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/pages/job/job_smart_recommend_page/components/skeleton/recommend_recruitment_card_skeleton.dart';

class RecommendRecruitmentListSkeleton extends StatelessWidget {
  final int itemCount;
  const RecommendRecruitmentListSkeleton({super.key, this.itemCount = 3});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        itemCount,
        (_) => Padding(
          padding: EdgeInsets.only(bottom: 10.h),
          child: const RecommendRecruitmentCardSkeleton(),
        ),
      ),
    );
  }
}
