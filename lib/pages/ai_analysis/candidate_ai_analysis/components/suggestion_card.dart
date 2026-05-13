import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/model/candidate/optimize_resume.dart';

class SuggestionCard extends StatefulWidget {
  final List<OptimizeResumeSuggestion> suggestionList;

  const SuggestionCard({super.key, required this.suggestionList});

  @override
  State<SuggestionCard> createState() => _SuggestionCardState();
}

class _SuggestionCardState extends State<SuggestionCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    final first = widget.suggestionList.first;

    /// 默认显示第一条
    final displayList =
        expanded ? widget.suggestionList : [widget.suggestionList.first];

    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withAlpha(40),
        ),
      ),
      child: Column(
        children: [
          /// header
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              setState(() {
                expanded = !expanded;
              });
            },
            child: Row(
              children: [
                Icon(
                  first.icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 24.sp,
                ),

                8.horizontalSpace,

                Text(
                  first.category,
                  style: TextStyle(
                    fontSize: 17.5.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const Spacer(),

                Text(
                  "${widget.suggestionList.length} 条建议",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 13.5.sp,
                  ),
                ),

                4.horizontalSpace,

                AnimatedRotation(
                  turns: expanded ? 0.5 : 0,
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Theme.of(context).colorScheme.primary,
                    size: 20.sp,
                  ),
                ),
              ],
            ),
          ),

          16.verticalSpace,

          /// suggestions
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: Column(
              children:
                  displayList.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;

                    final isLast = index == displayList.length - 1;

                    return Padding(
                      padding: EdgeInsets.only(bottom: isLast ? 0 : 12.h),
                      child: _buildSuggestionItem(context, item),
                    );
                  }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionItem(
    BuildContext context,
    OptimizeResumeSuggestion item,
  ) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// title
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("✨", style: TextStyle(fontSize: 17.sp)),

              8.horizontalSpace,

              Expanded(
                child: Text(
                  item.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),

              10.horizontalSpace,

              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withAlpha(40),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  item.tag,
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

          /// desc
          Text(
            item.description,
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              height: 1.5,
              fontSize: 12.5.sp,
            ),
          ),

          14.verticalSpace,

          /// footer
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withAlpha(25),
                  borderRadius: BorderRadius.circular(12.r),
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
                "123",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 11.5.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
