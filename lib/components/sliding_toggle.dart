import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlidingToggle extends StatelessWidget {
  final List<String> options;
  final int selectedIndex;
  final ValueChanged<int> onChange;

  const SlidingToggle({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        children: [
          // 背景滑块动画
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            // 计算滑块位置：如果是 2 个选项，位置就在 -1.0 到 1.0 之间
            alignment: Alignment(
              (selectedIndex / (options.length - 1) * 2) - 1,
              0,
            ),
            child: FractionallySizedBox(
              widthFactor: 1 / options.length, // 根据选项数量自动平分宽度
              child: Container(
                margin: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
          ),

          // 文字层
          Row(
            children: List.generate(options.length, (index) {
              bool isSelected = selectedIndex == index;
              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onChange(index),
                  child: Center(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 250),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                      ),
                      child: Text(options[index]),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
