import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/model/candidate/optimize_resume.dart';
import 'package:spark_hire_app/pages/ai_analysis/candidate_ai_analysis/components/skeleton/suggestion_card_skeleton.dart';
import 'package:spark_hire_app/pages/ai_analysis/candidate_ai_analysis/components/suggestion_card.dart';

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

    /// category 分组
    final Map<String, List<OptimizeResumeSuggestion>> groupedMap = {};

    for (var item in allSuggestions) {
      groupedMap.putIfAbsent(item.category, () => []);
      groupedMap[item.category]!.add(item);
    }

    final displayList = groupedMap.entries.toList();

    if (displayList.isEmpty) {
      return const SizedBox.shrink();
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: displayList.length,
      itemBuilder: (context, index) {
        final entry = displayList[index];
        final isLast = index == displayList.length - 1;

        return Padding(
          padding: EdgeInsets.only(bottom: isLast ? 30.h : 16.h),
          child: SuggestionCard(suggestionList: entry.value),
        );
      },
    );
  }
}
