import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectOption<T> {
  final String label;
  final T value;
  final IconData? icon;
  final Color? iconColor;
  final Widget? customDisplay;

  SelectOption({
    required this.label,
    required this.value,
    this.icon,
    this.iconColor,
    this.customDisplay,
  });
}

class CustomSelectInput<T> extends StatelessWidget {
  final String? title;
  final String? hintText;
  final T? value;
  final List<SelectOption<T>> options;
  final ValueChanged<T> onSelected;
  final double height;
  final double? width;

  const CustomSelectInput({
    super.key,
    this.title,
    this.hintText,
    this.value,
    required this.options,
    required this.onSelected,
    this.height = 50,
    this.width,
  });

  // 修改：获取匹配的整个 Option 对象
  SelectOption<T>? get _selectedOption {
    if (value == null) return null;
    try {
      return options.firstWhere((opt) => opt.value == value);
    } catch (_) {
      return null;
    }
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              12.verticalSpace,
              Container(
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(80),
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              10.verticalSpace,
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: options.map((option) {
                      bool isSelected = option.value == value;
                      return ListTile(
                        leading: option.icon != null
                            ? Icon(option.icon, color: option.iconColor)
                            : null,
                        title: Text(
                          option.label,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            color: isSelected ? Theme.of(context).colorScheme.primary : null,
                          ),
                        ),
                        trailing: isSelected
                            ? Icon(Icons.check, color: Theme.of(context).colorScheme.primary, size: 20.sp)
                            : null,
                        onTap: () {
                          onSelected(option.value);
                          Navigator.pop(context);
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              10.verticalSpace,
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedOption = _selectedOption;

    return SizedBox(
      width: width?.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: TextStyle(
                fontSize: 16.sp,
                color: Theme.of(context).colorScheme.onSurface.withAlpha(230),
              ),
            ),
            8.verticalSpace,
          ],
          GestureDetector(
            onTap: () => _showPicker(context),
            child: Container(
              height: height.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inverseSurface,
                borderRadius: BorderRadius.circular(10.r),
              ),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 核心修改逻辑：优先显示 customDisplay
                  Expanded(
                    child: selectedOption == null
                        ? Text(
                            hintText ?? "",
                            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                          )
                        : (selectedOption.customDisplay ??
                            Text(
                              selectedOption.label,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            )),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 20.sp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}