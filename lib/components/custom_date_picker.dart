import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// 定义日期选择的粒度
enum CustomDatePickerMode {
  year, // 仅年份 (如: 2024)
  yearMonth, // 年-月 (如: 2024-05)
  date, // 年-月-日 (如: 2024-05-20)
}

class CustomDatePicker extends StatefulWidget {
  final String? title;
  final String? hintText;
  final DateTime? defaultValue;
  final double height;
  final double? width; // 可选宽度
  final ValueChanged<DateTime>? onChanged;
  final bool enabled;
  final CustomDatePickerMode mode;

  const CustomDatePicker({
    super.key,
    this.title,
    this.hintText,
    this.defaultValue,
    required this.height,
    this.width,
    this.onChanged,
    this.enabled = true,
    this.mode = CustomDatePickerMode.year,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _selectedDate;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.defaultValue;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  // 根据当前模式格式化显示的文本内容
  String _getDisplayText(DateTime date) {
    final l10n = AppLocalizations.of(context)!;
    final y = date.year.toString();
    final m = date.month.toString().padLeft(2, '0');
    final d = date.day.toString().padLeft(2, '0');

    switch (widget.mode) {
      case CustomDatePickerMode.year:
        return '$y ${l10n.yearText}';
      case CustomDatePickerMode.yearMonth:
        return '$y-$m';
      case CustomDatePickerMode.date:
        return '$y-$m-$d';
    }
  }

  void _showPicker(BuildContext context) {
    if (!widget.enabled) return;

    // 弹出前请求焦点，强制收起页面上其他输入框的键盘
    _focusNode.requestFocus();

    DateTime tempDate = _selectedDate ?? DateTime.now();
    final l10n = AppLocalizations.of(context)!;

    showCupertinoModalPopup(
      context: context,
      builder:
          (context) => Container(
            height: 300.h,
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: Column(
              children: [
                // 顶部操作栏
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: CupertinoColors.separator,
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoButton(
                        child: Text(l10n.cancelText),
                        onPressed: () => Navigator.pop(context),
                      ),
                      CupertinoButton(
                        child: Text(l10n.confirmText),
                        onPressed: () {
                          setState(() => _selectedDate = tempDate);
                          widget.onChanged?.call(_selectedDate!);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                // 滚轮内容
                Expanded(
                  child: _buildPickerContent(
                    initialDate: tempDate,
                    onChanged: (date) => tempDate = date,
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildPickerContent({
    required DateTime initialDate,
    required ValueChanged<DateTime> onChanged,
  }) {
    final l10n = AppLocalizations.of(context)!;

    if (widget.mode == CustomDatePickerMode.year) {
      final List<int> years = List.generate(
        2099 - 1950 + 1,
        (i) => 1950 + i,
      );
      final initialIndex =
          years.contains(initialDate.year)
              ? years.indexOf(initialDate.year)
              : years.length - 1;

      return CupertinoPicker(
        scrollController: FixedExtentScrollController(
          initialItem: initialIndex,
        ),
        itemExtent: 40.h,
        onSelectedItemChanged: (index) {
          onChanged(DateTime(years[index], 1, 1));
        },
        children:
            years
                .map(
                  (y) => Center(
                    child: Text(
                      '$y ${l10n.yearText}',
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
                )
                .toList(),
      );
    }

    // 2. 年月/年月日模式：直接使用官方封装好的组件
    return CupertinoDatePicker(
      mode:
          widget.mode == CustomDatePickerMode.yearMonth
              ? CupertinoDatePickerMode.monthYear
              : CupertinoDatePickerMode.date,
      initialDateTime: initialDate,
      onDateTimeChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SizedBox(
      width: widget.width, // 支持指定宽度
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) ...[
            Text(
              widget.title!,
              style: TextStyle(
                fontSize: 16.sp,
                color:
                    widget.enabled
                        ? Theme.of(
                          context,
                        ).colorScheme.onSurface.withValues(alpha: 0.7)
                        : Colors.grey,
              ),
            ),
            8.verticalSpace,
          ],
          Focus(
            focusNode: _focusNode,
            child: GestureDetector(
              onTap: () => _showPicker(context),
              child: Container(
                alignment: Alignment.centerLeft,
                height: widget.height,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  color:
                      widget.enabled
                          ? Theme.of(context).colorScheme.inverseSurface
                          : Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate != null
                            ? _getDisplayText(_selectedDate!)
                            : (widget.hintText ?? l10n.selectDateText),
                        style: TextStyle(
                          fontSize: 16.sp,
                          color:
                              _selectedDate == null
                                  ? Colors.grey
                                  : Colors.black,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.calendar_month_rounded, // 右侧日历图标
                      color: Colors.grey,
                      size: 18.sp,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
