import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/model/candidate/optimize_resume.dart';
import 'package:spark_hire_app/pages/ai_analysis/candidate_ai_analysis/components/skeleton/suggestion_card_skeleton.dart';

class SuggestionCardContent extends StatelessWidget {
  final OptimizeResumeResult? result;
  const SuggestionCardContent({super.key, this.result});

  @override
  Widget build(BuildContext context) {
    if (result == null) {
      return Column(
        children: [
          const SuggestionCardSkeleton(),
          10.verticalSpace,
          const SuggestionCardSkeleton(),
        ],
      );
    }
    final List<OptimizeResumeSuggestion> allSuggestions =
        result?.suggestions ?? [];

    final Map<String, OptimizeResumeSuggestion> filteredMap = {};
    for (var item in allSuggestions) {
      if (!filteredMap.containsKey(item.category)) {
        filteredMap[item.category] = item;
      }
    }

    final displayList = filteredMap.values.toList();

    if (displayList.isEmpty) {
      return const SizedBox.shrink();
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayList.length,
      itemBuilder: (context, index) {
        final item = displayList[index];
        final isLast = index == displayList.length - 1;

        // 查找该分类下总共有多少条建议（可选，用于在 header 展示）
        final totalCount =
            allSuggestions.where((s) => s.category == item.category).length;

        return Padding(
          padding: EdgeInsets.only(bottom: isLast ? 30.h : 16.h),
          child: SuggestionSection(
            icon: item.icon,
            title: item.category,
            // 这里可以展示该分类下的总建议数
            count: "$totalCount 条建议",
            suggestionTitle: item.title,
            desc: item.description,
            tag: item.tag,
            acceptCount: "已有 ${120 + index * 15} 人采纳",
          ),
        );
      },
    );
  }
}

class SuggestionSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String count;
  final String suggestionTitle;
  final String desc;
  final String tag;
  final String acceptCount;

  const SuggestionSection({
    super.key,
    required this.icon,
    required this.title,
    required this.count,
    required this.suggestionTitle,
    required this.desc,
    required this.tag,
    required this.acceptCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withAlpha(40),
        ),
      ),
      child: Column(
        children: [
          /// header
          Row(
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
                size: 24.sp,
              ),

              8.horizontalSpace,

              Text(
                title,
                style: TextStyle(
                  fontSize: 17.5.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),

              Text(
                count,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.5.sp,
                ),
              ),

              4.horizontalSpace,

              Icon(
                Icons.keyboard_arrow_up,
                color: Theme.of(context).colorScheme.primary,
                size: 20.sp,
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// suggestion
          Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inverseSurface,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "✨",
                      style: TextStyle(fontSize: 17.sp), // 22 -> 18
                    ),

                    8.horizontalSpace,

                    Expanded(
                      child: Text(
                        suggestionTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp, // 18 -> 15
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.h,
                        vertical: 4.w,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withAlpha(40),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.5.sp,
                        ),
                      ),
                    ),
                  ],
                ),

                10.verticalSpace,

                Text(
                  desc,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    height: 1.5,
                    fontSize: 12.5.sp,
                  ),
                ),

                14.verticalSpace,

                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withAlpha(25),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "去优化",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.5.sp,
                        ),
                      ),
                    ),

                    const Spacer(),

                    Icon(
                      Icons.thumb_up_alt_outlined,
                      size: 15.sp,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),

                    6.horizontalSpace,

                    Text(
                      acceptCount,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 11.5.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
