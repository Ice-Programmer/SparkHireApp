import 'package:flutter/material.dart';

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
  final IconData? suffixIcon;
  final double prefixGap;
  final String? defaultValue;
  final Color? borderColor;
  final VoidCallback? onSuffixTap;
  final TextInputType? inputType;
  final Color? textColor;

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
    this.suffixIcon,
    this.prefixGap = 20,
    this.defaultValue,
    this.borderColor,
    this.onSuffixTap,
    this.inputType,
    this.textColor,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool _obscureText = true;
  final _fieldKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
            color:
                widget.backgroundColor ??
                Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border:
                widget.borderColor != null
                    ? Border.all(color: widget.borderColor!, width: 1.5)
                    : null,
          ),
          child: TextFormField(
            key: _fieldKey,
            initialValue: widget.defaultValue,
            maxLines: widget.maxLines,
            obscureText: widget.isPassword ? _obscureText : false,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              fontSize: widget.fontSize,
              color: Theme.of(context).colorScheme.onSurface,
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
              suffixIcon:
                  widget.isPassword
                      ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                      : _buildSuffixButton(),
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
      ],
    );
  }

  Widget _buildSuffixButton() {
    if (widget.suffixIcon == null) {
      return SizedBox(width: widget.height * 1.5);
    }
    return Material(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(widget.borderRadius),
      ),
      child: InkWell(
        onTap: widget.onSuffixTap,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: SizedBox(
          height: widget.height,
          width: widget.height * 1.5,
          child: Icon(widget.suffixIcon, color: Colors.white),
        ),
      ),
    );
  }
}
