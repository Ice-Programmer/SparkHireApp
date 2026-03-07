import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 选项模型
class SelectOption<T> {
  final String label;
  final T value;
  final IconData? icon;
  final Color? iconColor;
  final Widget? leading;
  final Widget? customDisplay;
  final Widget? customChild;

  SelectOption({
    required this.label,
    required this.value,
    this.icon,
    this.iconColor,
    this.leading,
    this.customDisplay,
    this.customChild,
  });
}

class CustomSelectInput<T> extends StatefulWidget {
  final String? title;
  final String? hintText;
  final T? value;
  final List<SelectOption<T>> options;
  final ValueChanged<T> onSelected;
  final double height;
  final double? width;
  final bool enableSearch;
  final Color? backgroundColor; // 新增：可选背景色

  const CustomSelectInput({
    super.key,
    this.title,
    this.hintText,
    this.value,
    required this.options,
    required this.onSelected,
    this.height = 50,
    this.width,
    this.enableSearch = true,
    this.backgroundColor,
  });

  @override
  State<CustomSelectInput<T>> createState() => _CustomSelectInputState<T>();
}

class _CustomSelectInputState<T> extends State<CustomSelectInput<T>> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  SelectOption<T>? get _selectedOption {
    if (widget.value == null) return null;
    try {
      return widget.options.firstWhere((opt) => opt.value == widget.value);
    } catch (_) {
      return null;
    }
  }

  Widget? _buildLeading(SelectOption<T> option, {double? iconSize}) {
    if (option.leading != null) return option.leading;
    if (option.icon != null) {
      return Icon(
        option.icon,
        color: option.iconColor ?? Colors.grey,
        size: iconSize ?? 22.sp,
      );
    }
    return null;
  }

  void _showPicker(BuildContext context) {
    _focusNode.requestFocus();
    List<SelectOption<T>> filteredOptions = widget.options;
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return SafeArea(
              child: Container(
                constraints: BoxConstraints(maxHeight: 0.6.sh),
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    12.verticalSpace,
                    Container(
                      width: 40.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                    if (widget.enableSearch)
                      Padding(
                        padding: EdgeInsets.all(16.w),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "搜索...",
                            prefixIcon: const Icon(Icons.search),
                            contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Theme.of(context)
                                .colorScheme
                                .inverseSurface
                                .withValues(alpha: 0.1),
                          ),
                          onChanged: (val) {
                            setModalState(() {
                              filteredOptions = widget.options
                                  .where((opt) => opt.label
                                      .toLowerCase()
                                      .contains(val.toLowerCase()))
                                  .toList();
                            });
                          },
                        ),
                      ),
                    Flexible(
                      child: filteredOptions.isEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(vertical: 40.h),
                              child: const Center(
                                child: Text("未找到结果",
                                    style: TextStyle(color: Colors.grey)),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: filteredOptions.length,
                              itemBuilder: (context, index) {
                                final option = filteredOptions[index];
                                bool isSelected = option.value == widget.value;
                                return InkWell(
                                  onTap: () {
                                    widget.onSelected(option.value);
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20.w,
                                      vertical: 15.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Theme.of(context)
                                              .colorScheme
                                              .primary
                                              .withValues(alpha: 0.1)
                                          : null,
                                      border: Border(
                                        bottom: BorderSide(
                                          color:
                                              Colors.grey.withValues(alpha: 0.1),
                                          width: 0.5,
                                        ),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: option.customChild ??
                                              _buildDefaultItem(
                                                  option, isSelected),
                                        ),
                                        if (isSelected)
                                          Icon(
                                            Icons.check_circle,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            size: 20.sp,
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDefaultItem(SelectOption<T> option, bool isSelected) {
    final leading = _buildLeading(option);
    return Row(
      children: [
        if (leading != null) ...[
          leading,
          12.horizontalSpace,
        ],
        Expanded(
          child: Text(
            option.label,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDefaultDisplay(SelectOption<T> option) {
    final leading = _buildLeading(option, iconSize: 18.sp);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (leading != null) ...[
          SizedBox(
            width: 22.sp,
            height: 22.sp,
            child: Center(child: leading),
          ),
          8.horizontalSpace,
        ],
        Flexible(
          child: Text(
            option.label,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16.sp),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedOption = _selectedOption;
    return SizedBox(
      width: widget.width?.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) ...[
            Text(
              widget.title!,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context)
                    .colorScheme
                    .onSurface
                    .withValues(alpha: 0.8),
              ),
            ),
            8.verticalSpace,
          ],
          Focus(
            focusNode: _focusNode,
            child: GestureDetector(
              onTap: () => _showPicker(context),
              child: Container(
                height: widget.height.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  // 使用新增的背景色变量
                  color: widget.backgroundColor ??
                      Theme.of(context)
                          .colorScheme
                          .inverseSurface
                          .withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: Colors.grey.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: selectedOption == null
                          ? Text(
                              widget.hintText ?? "请选择",
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            )
                          : (selectedOption.customDisplay ??
                              _buildDefaultDisplay(selectedOption)),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.grey,
                      size: 22.sp,
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