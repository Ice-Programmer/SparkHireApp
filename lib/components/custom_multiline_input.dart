import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMultilineInput extends StatefulWidget {
  final double? width;
  final double? height;
  final String? hintText;
  final String? initialValue;
  final int maxLines;
  final int? maxLength;
  final double borderRadius;
  final Color? backgroundColor;
  final ValueChanged<String>? onChanged;
  final bool enabled;
  final String? title;
  final double fontSize;

  const CustomMultilineInput({
    super.key,
    this.width,
    this.height,
    this.hintText,
    this.initialValue,
    this.maxLines = 100,
    this.maxLength,
    this.borderRadius = 12,
    this.backgroundColor,
    this.onChanged,
    this.enabled = true,
    this.title,
    this.fontSize = 16,
  });

  @override
  State<CustomMultilineInput> createState() => _CustomMultilineInputState();
}

class _CustomMultilineInputState extends State<CustomMultilineInput> {
  late TextEditingController _controller;
  int _currentLength = 0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
    _currentLength = _controller.text.length;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildTitle(BuildContext context) {
    if (widget.title == null) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.title!,
            style: TextStyle(
              fontSize: widget.fontSize,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: widget.enabled ? 0.7 : 0.2),
            ),
          ),
        ),
        8.verticalSpace,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // 判断是否超过限制颜色
    bool isOverLimit = widget.maxLength != null && _currentLength >= widget.maxLength!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        Container(
          width: widget.width,
          height: widget.height,
          padding: EdgeInsets.fromLTRB(14.w, 14.w, 14.w, 8.w), // 底部留点空间给计数器
          decoration: BoxDecoration(
            color: widget.backgroundColor ??
                Theme.of(context).colorScheme.inverseSurface,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Column(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _controller,
                  enabled: widget.enabled,
                  maxLines: widget.maxLines,
                  maxLength: widget.maxLength, // 框架层限制输入
                  keyboardType: TextInputType.multiline,
                  textAlignVertical: TextAlignVertical.top,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    counterText: '', // 隐藏原生计数器
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withValues(alpha: 0.4),
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _currentLength = val.length;
                    });
                    if (widget.onChanged != null) {
                      widget.onChanged!(val);
                    }
                  },
                ),
              ),
              // 自定义计数器显示
              if (widget.maxLength != null)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '$_currentLength/${widget.maxLength}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: isOverLimit 
                          ? Colors.red 
                          : Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}