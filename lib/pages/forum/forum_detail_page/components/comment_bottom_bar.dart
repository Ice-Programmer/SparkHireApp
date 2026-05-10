import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentBottomBar extends StatelessWidget {
  const CommentBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.outline,
            width: 0.15,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inverseSurface,
                borderRadius: BorderRadius.circular(30.r),
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                "写下你的评论...",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 15,
                ),
              ),
            ),
          ),

          14.horizontalSpace,

          Icon(Icons.emoji_emotions_outlined, size: 28.sp),

          14.horizontalSpace,

          Icon(Icons.image_outlined, size: 28.sp),
        ],
      ),
    );
  }
}
