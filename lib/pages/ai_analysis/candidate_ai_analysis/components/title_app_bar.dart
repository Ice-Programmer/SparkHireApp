import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        "AI 优化建议",
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
      ),
      actions: [
        Row(
          children: [
            Icon(
              Icons.history,
              size: 16.sp,
              color: Theme.of(context).colorScheme.primary,
            ),

            4.horizontalSpace,

            Text(
              "历史建议",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w600,
                fontSize: 13.sp,
              ),
            ),

            20.horizontalSpace,
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
