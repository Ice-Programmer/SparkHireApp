import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditTitle extends StatelessWidget {
  final String titleName;
  const EditTitle({super.key, required this.titleName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            context.pop();
          },
          child: Padding(
            padding: EdgeInsets.all(4.w),
            child: Icon(
              Icons.arrow_back_rounded,
              size: 22.sp,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.8),
            ),
          ),
        ),

        14.horizontalSpace,

        Text(
          titleName,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }
}
