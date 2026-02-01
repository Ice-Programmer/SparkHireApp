import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 选项模型
class SelectOption<T> {
  final String label;
  final T value;
  final IconData? icon;
  final Color? iconColor;
  final Widget? customDisplay;
  final Widget? customChild;

  SelectOption({
    required this.label,
    required this.value,
    this.icon,
    this.iconColor,
    this.customDisplay,
    this.customChild,
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
  final bool enableSearch;

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
  });

  // 获取当前选中的选项对象
  SelectOption<T>? get _selectedOption {
    if (value == null) return null;
    try {
      return options.firstWhere((opt) => opt.value == value);
    } catch (_) {
      return null;
    }
  }

  void _showPicker(BuildContext context) {
  List<SelectOption<T>> filteredOptions = options;

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
                      color: Colors.grey.withAlpha(80),
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                  
                  if (enableSearch)
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
                          fillColor: Theme.of(context).colorScheme.inverseSurface.withAlpha(80),
                        ),
                        onChanged: (val) {
                          setModalState(() {
                            filteredOptions = options
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
                            child: Center(child: Text("未找到结果", style: TextStyle(color: Colors.grey))),
                          )
                        : ListView.builder(
                            // 关键 4：让列表包裹内容，不强制撑开
                            shrinkWrap: true, 
                            padding: EdgeInsets.zero,
                            itemCount: filteredOptions.length,
                            itemBuilder: (context, index) {
                              final option = filteredOptions[index];
                              bool isSelected = option.value == value;

                              return InkWell(
                                onTap: () {
                                  onSelected(option.value);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                                  decoration: BoxDecoration(
                                    color: isSelected ? Theme.of(context).colorScheme.primary.withAlpha(20) : null,
                                    border: Border(bottom: BorderSide(color: Colors.grey.withAlpha(20), width: 0.5)),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(child: option.customChild ?? _buildDefaultItem(option, isSelected)),
                                      if (isSelected)
                                        Icon(Icons.check_circle, color: Theme.of(context).colorScheme.primary, size: 20.sp),
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
    return Row(
      children: [
        if (option.icon != null) ...[
          Icon(
            option.icon,
            color: option.iconColor ?? Colors.grey,
            size: 22.sp,
          ),
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

  @override
  Widget build(BuildContext context) {
    final selectedOption = _selectedOption;

    return SizedBox(
      width: width?.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(
              title!,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSurface.withAlpha(200),
              ),
            ),
            8.verticalSpace,
          ],
          GestureDetector(
            onTap: () => _showPicker(context),
            child: Container(
              height: height.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inverseSurface,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child:
                        selectedOption == null
                            ? Text(
                              hintText ?? "请选择",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.sp,
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
        ],
      ),
    );
  }

  // 输入框默认显示样式
  Widget _buildDefaultDisplay(SelectOption<T> option) {
    return Text(
      option.label,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16.sp),
    );
  }
}
