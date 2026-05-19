import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/custom_tag.dart';
import 'package:spark_hire_app/model/user_search_history/user_history_info.dart';

class SearchHistoryContent extends StatefulWidget {
  final ValueChanged<String>? onTagTap;
  final List<UserHistoryInfo>? historyList;
  const SearchHistoryContent({super.key, this.onTagTap, this.historyList});

  @override
  State<SearchHistoryContent> createState() => _SearchHistoryContentState();
}

class _SearchHistoryContentState extends State<SearchHistoryContent> {
  bool _isHistoryExpanded = false;

  @override
  Widget build(BuildContext context) {
    if (widget.historyList case null || []) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        // 动态计算第一行究竟能放下几个 Tag
        int firstLineCount = 0;
        double currentWidth = 0;

        for (int i = 0; i < widget.historyList!.length; i++) {
          final item = widget.historyList![i];

          // 使用 TextPainter 预估文字宽度
          final tp = TextPainter(
            text: TextSpan(
              text: item.content,
              style: TextStyle(fontSize: 12.sp),
            ),
            textDirection: TextDirection.ltr,
          )..layout();

          // 预估单个 Tag 总宽度 = 文字宽度 + 左右内边距(12.w * 2) + 安全边距(2.w)
          final tagWidth = tp.width + 24.w + 2.w;

          if (currentWidth + tagWidth > maxWidth) {
            // 如果连第一个都放不下（极端情况），至少保证展示 1 个
            if (firstLineCount == 0) firstLineCount = 1;
            break; // 宽度超出，说明到了第二行，结束计算
          }

          firstLineCount++;
          currentWidth += tagWidth + 8.w;
        }

        final needsExpand = widget.historyList!.length > firstLineCount;

        final displayHistory =
            _isHistoryExpanded
                ? widget.historyList
                : widget.historyList!.take(firstLineCount).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '历史搜索',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),

                // 只有当历史记录超过一行时才显示按钮
                if (needsExpand)
                  GestureDetector(
                    // behavior 确保即使点击在图标的空白处也能触发
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      setState(() {
                        _isHistoryExpanded = !_isHistoryExpanded;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(4.w),
                      child: AnimatedRotation(
                        turns: _isHistoryExpanded ? 0.5 : 0.0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: Icon(
                          Icons.expand_more,
                          color: Theme.of(context).colorScheme.outline,
                          size: 25.sp,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            10.verticalSpace,

            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              alignment: Alignment.topLeft,
              child: Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children:
                    displayHistory!.map((item) {
                      return GestureDetector(
                        onTap: () {
                          widget.onTagTap?.call(item.content);
                        },
                        child: CustomTag(
                          fontSize: 12.sp,
                          text: item.content,
                          color: Theme.of(context).colorScheme.outline,
                          horizontalPadding: 12.w,
                          verticalPadding: 4.h,
                          borderRadius: 10.r,
                        ),
                      );
                    }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
