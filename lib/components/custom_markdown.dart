import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMarkdown extends StatelessWidget {
  final String text;

  const CustomMarkdown({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: text,
      selectable: true,
      styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
        p: TextStyle(
          fontSize: 14.sp,
          color: Theme.of(context).colorScheme.outline,
        ),
        h1: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      ),
    );
  }
}
