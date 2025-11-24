import 'package:flutter/material.dart';
class KeyboardDismissWrapper extends StatelessWidget {
  final Widget child;

  const KeyboardDismissWrapper({super.key, required this.child});

  void _unfocus(BuildContext context) {
    if (FocusScope.of(context).hasFocus) {
      // 移除焦点，从而关闭键盘
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _unfocus(context),
      child: child,
    );
  }
}
