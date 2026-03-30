import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarStrip extends StatefulWidget {
  final int selectedIndex;
  final void Function(int index, DateTime date) onDaySelected;

  const CalendarStrip({
    super.key,
    required this.selectedIndex,
    required this.onDaySelected,
  });

  @override
  State<CalendarStrip> createState() => _CalendarStripState();
}

class _CalendarStripState extends State<CalendarStrip> {
  // 1. 定义控制器
  late ScrollController _scrollController;

  // 定义固定尺寸，方便计算滚动位置
  final double _itemWidth = 55.w;
  final double _separatorWidth = 12.w;
  final double _paddingHorizontal = 20.w;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // 初始化后，如果默认选中不是第一项，可以稍作延迟滚动到初始位置
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToIndex(widget.selectedIndex);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToIndex(int index) {
    if (!_scrollController.hasClients) return;

    // 计算单个项目占据的总宽度（包括间隔）
    double itemTotalWidth = _itemWidth + _separatorWidth;
    double targetOffset =
        (index * itemTotalWidth) + _paddingHorizontal + (_itemWidth / 2);
    // 计算屏幕中心位置
    double screenCenter = MediaQuery.of(context).size.width / 2;
    // 最终滚动偏移量 = 目标中心点 - 屏幕中心点
    double finalOffset = targetOffset - screenCenter;
    // 边界处理：不能小于0，不能大于最大滚动范围
    double maxScroll = _scrollController.position.maxScrollExtent;
    double minScroll = _scrollController.position.minScrollExtent;
    finalOffset = finalOffset.clamp(minScroll, maxScroll);

    _scrollController.animateTo(
      finalOffset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final List<Map<String, dynamic>> days = List.generate(10, (index) {
      final DateTime date = now.add(Duration(days: index - 3));
      const List<String> weekDays = ["一", "二", "三", "四", "五", "六", "日"];
      return {
        "week": weekDays[date.weekday - 1],
        "day": date.day.toString(),
        "date": date,
      };
    });

    return SizedBox(
      height: 80.h,
      child: ListView.separated(
        controller: _scrollController,
        padding: EdgeInsets.symmetric(horizontal: _paddingHorizontal),
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        separatorBuilder: (_, __) => SizedBox(width: _separatorWidth),
        itemBuilder: (context, index) {
          bool isSelected = widget.selectedIndex == index;
          return GestureDetector(
            onTap: () {
              _scrollToIndex(index);
              widget.onDaySelected(index, days[index]["date"]);
            },
            child: Container(
              width: _itemWidth,
              decoration: BoxDecoration(
                color:
                    isSelected
                        ? Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.35)
                        : Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  width: 0.5.sp,
                  color:
                      isSelected
                          ? Colors.transparent
                          : Theme.of(context).colorScheme.outline,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    days[index]["week"] as String,
                    style: TextStyle(
                      color:
                          isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.tertiary,
                      fontSize: 12.sp,
                    ),
                  ),

                  4.verticalSpace,

                  Text(
                    days[index]["day"] as String,
                    style: TextStyle(
                      color:
                          isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.outline,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
