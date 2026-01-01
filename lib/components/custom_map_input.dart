import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMapInput extends StatelessWidget {
  final String? title;
  final String? defaultValue; // 显示已选的地址
  final String hintText;
  final VoidCallback? onTap;
  final double height;
  final double borderRadius;
  final Color? backgroundColor;

  const CustomMapInput({
    super.key,
    this.title,
    this.defaultValue,
    this.hintText = "请选择地理位置",
    this.onTap,
    this.height = 50,
    this.borderRadius = 10,
    this.backgroundColor,
  });

  Widget _buildTitle(BuildContext context) {
    if (title == null) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 确保标题左对齐
      children: [
        Text(
          title!,
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        8.verticalSpace,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // 判断是否有值，决定显示颜色
    bool hasValue = defaultValue != null && defaultValue!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            height: height,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: backgroundColor ?? Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: Row(
              children: [
                // 前缀：地图图标
                Icon(
                  Icons.location_on_rounded,
                  size: 20.sp,
                  color: Theme.of(context).colorScheme.primary,
                ),
                12.horizontalSpace, // 替代 prefixIconConstraints 的间距控制
                // 中间：地址文字
                Expanded(
                  child: Text(
                    hasValue ? defaultValue! : hintText,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis, // 超出长度显示省略号
                    style: TextStyle(
                      fontSize: 15.sp,
                      color:
                          hasValue
                              ? Theme.of(context).colorScheme.onSurface
                              : Colors.grey, // 无值时显示 Hint 颜色
                    ),
                  ),
                ),

                // 后缀：跳转箭头
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14.sp,
                  color: Colors.grey.withValues(alpha: 0.8),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
