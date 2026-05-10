import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/components/custom_button.dart';
import 'package:spark_hire_app/components/custom_tag.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';

class CreatorContent extends StatelessWidget {
  final UserBasicInfo creatorInfo;
  const CreatorContent({super.key, required this.creatorInfo});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CacheImage(
          height: 46.h,
          width: 46.w,
          imageUrl: creatorInfo.userAvatar,
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
                    creatorInfo.username,
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
