import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyState extends StatelessWidget {
  final String title;
  final String? subTitle;
  const EmptyState({super.key, required this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          20.verticalSpace,

          Icon(
            Icons.inbox_outlined,
            size: 80.sp,
            color: Theme.of(context).colorScheme.primary,
          ),

          16.verticalSpace,

          // 主标题
          Text(title, style: TextStyle(fontSize: 16.sp)),

          4.verticalSpace,

          // 副标题
          if (subTitle != null)
            Text(
              subTitle ?? "",
              style: TextStyle(
                fontSize: 12.sp,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
        ],
      ),
    );
  }
}
