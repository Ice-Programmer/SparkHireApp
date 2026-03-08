import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/custom_icon_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class TitleContent extends StatelessWidget {
  const TitleContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 「欢迎回来👋」
            Text(
              AppLocalizations.of(context)!.welcomeBackText,
              style: TextStyle(
                fontSize: 16.sp,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),

            2.verticalSpace,

            // 「来找个好工作吧！」
            Text(
              AppLocalizations.of(context)!.welcomeBackSecondText,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        // 消息 Icon
        CustomIconButton(
          icon: Icons.notifications_outlined,
          size: 45.w,
          borderRadius: 13.r,
          onPressed: () {},
        ),
      ],
    );
  }
}