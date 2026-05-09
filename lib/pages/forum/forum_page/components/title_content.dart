import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/custom_button.dart';

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
            // 「就业论坛」
            Text(
              "就业论坛",
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),

            2.verticalSpace,

            // 「交流经验 · 解决问题 · 共同成长」
            Text(
              "交流经验 · 解决问题 · 共同成长",
              style: TextStyle(
                fontSize: 13.sp,
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ],
        ),

        /// 发布按钮
        CustomButton(
          textColor: Theme.of(context).colorScheme.onPrimary,
          btnWidth: 100.w,
          btnHeight: 40.h,
          fontSize: 13.sp,
          title: "发布帖子",
          backgroundColor: Theme.of(context).colorScheme.primary,
          isShadow: false,
          icon: Icons.edit_outlined,
          iconGap: 4.w,
        ),
      ],
    );
  }
}
