import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInput extends StatefulWidget {
  final double? width;
  final double height;
  final double borderRadius;
  final String? hintText;
  final double horizontalPadding;
  final double fontSize;
  final Color? backgroundColor;
  final int maxLines;
  final bool isPassword;
  final ValueChanged<String>? onChanged;
  final double prefixGap;
  final String? defaultValue;
  final Color? borderColor;
  final TextInputType? inputType;
  final Color? textColor;
  final String? title;
  final bool enabled;

  const CustomInput({
    super.key,
    this.width,
    required this.height,
    this.borderRadius = 10,
    this.hintText,
    this.horizontalPadding = 20,
    this.fontSize = 16,
    this.maxLines = 1,
    this.isPassword = false,
    this.onChanged,
    this.backgroundColor,
    this.prefixGap = 20,
    this.defaultValue,
    this.borderColor,
    this.inputType,
    this.textColor,
    this.title,
    this.enabled = true,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _obscureText = true;
  final _fieldKey = GlobalKey<FormFieldState<String>>();

  Widget _buildTitle(BuildContext context) {
    if (widget.title == null) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        Text(
          widget.title!,
          style: TextStyle(
            fontSize: widget.fontSize,
            color: Theme.of(context).colorScheme.onSurface.withValues(
              alpha: widget.enabled ? 0.9 : 0.2,
            ),
          ),
        ),
        8.verticalSpace,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color bgColor =
        widget.backgroundColor ??
        (widget.enabled
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.5));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        Container(
          alignment: Alignment.center,
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: widget.borderColor != null
                ? Border.all(
                    color: widget.enabled
                        ? widget.borderColor!
                        : widget.borderColor!.withValues(alpha: 0.3),
                    width: 1.5,
                  )
                : null,
          ),
          child: Opacity(
            opacity: widget.enabled ? 1.0 : 0.6,
            child: TextFormField(
              key: _fieldKey,
              enabled: widget.enabled,
              initialValue: widget.defaultValue,
              maxLines: widget.maxLines,
              obscureText: widget.isPassword ? _obscureText : false,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                fontSize: widget.fontSize,
                color: widget.textColor ?? Theme.of(context).colorScheme.onSurface,
                height: 1.0,
              ),
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: widget.horizontalPadding,
                ),
                border: InputBorder.none,
                hintText: widget.hintText,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: widget.enabled
                            ? () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              }
                            : null,
                      )
                    : null,
                hintStyle: TextStyle(
                  fontSize: widget.fontSize,
                  color: Colors.grey,
                ),
                errorStyle: const TextStyle(height: 0, fontSize: 0),
              ),
              onChanged: (value) {
                widget.onChanged?.call(value);
              },
              keyboardType: widget.inputType,
            ),
          ),
        ),
      ],
    );
  }
}