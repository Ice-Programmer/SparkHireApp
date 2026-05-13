import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/model/candidate/optimize_resume.dart';
import 'package:spark_hire_app/pages/ai_analysis/candidate_ai_analysis/components/skeleton/overview_card_content_skeleton.dart';

class OverviewCardContent extends StatelessWidget {
  final OptimizeResumeResult? result;
  const OverviewCardContent({super.key, this.result});

  @override
  Widget build(BuildContext context) {
    if (result == null) {
      return OverviewCardContentSkeleton();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "优化建议概览",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        10.verticalSpace,

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: result?.overviewItems?.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.6,
          ),
          itemBuilder: (context, index) {
            final item = result?.overviewItems?[index];
            return Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: Theme.of(
                    context,
                  ).colorScheme.outline.withValues(alpha: 0.2),
                ),
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
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withAlpha(25),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          item!.icon,
                          color: Theme.of(context).colorScheme.primary,
                          size: 23.sp,
                        ),
                      ),

                      20.horizontalSpace,

                      Text(
                        item.category,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  4.verticalSpace,

                  Text(
                    item.count,
                    style: TextStyle(
                      color: Colors.orange.shade600,
                      fontWeight: FontWeight.w600,
                      fontSize: 11.5.sp,
                    ),
                  ),

                  8.verticalSpace,

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: item.progress,
                      minHeight: 4.h,
                      backgroundColor:
                          Theme.of(context).colorScheme.inverseSurface,
                      valueColor: AlwaysStoppedAnimation(
                        Colors.orange.shade400,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
