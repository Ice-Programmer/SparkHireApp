import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/components/custom_button.dart';
import 'package:spark_hire_app/components/custom_tag.dart';

class CreatorContent extends StatelessWidget {
  const CreatorContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CacheImage(
          height: 46.h,
          width: 46.w,
          imageUrl:
              "https://ice-man-1316749988.cos.ap-shanghai.myqcloud.com/imgs/%E5%85%AB%E5%A5%88%E8%A6%8B.jpg",
          borderRadius: 20.r,
        ),

        12.horizontalSpace,

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "设计小助手",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ),

                  10.horizontalSpace,

                  CustomTag(
                    fontSize: 11.sp,
                    text: "官方",
                    horizontalPadding: 8.w,
                    verticalPadding: 3.h,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),

              6.verticalSpace,

              Text(
                "产品设计师 · 5年经验",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),

        /// 关注按钮
        CustomButton(
          textColor: Theme.of(context).colorScheme.onPrimary,
          btnWidth: 80.w,
          btnHeight: 35.h,
          fontSize: 12.sp,
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: "关注",
          icon: Icons.add,
          iconGap: 4.w,
          borderRadius: 20.r,
          isShadow: false,
        ),
      ],
    );
  }
}
