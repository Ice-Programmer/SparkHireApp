import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClickableSearchButton extends StatelessWidget {
  final VoidCallback onTap;
  final String hintText;

  const ClickableSearchButton({
    super.key,
    required this.onTap,
    this.hintText = "搜索",
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap, // 点击直接跳转
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 58.h,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: theme.colorScheme.outline.withValues(alpha: 0.3),
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                hintText,
                style: TextStyle(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              width: 1,
              height: 24,
              color: theme.colorScheme.outline.withValues(alpha: 0.3),
              margin: const EdgeInsets.symmetric(horizontal: 12),
            ),
            Icon(Icons.tune, color: theme.colorScheme.onSurfaceVariant),
          ],
        ),
      ),
    );
  }
}
