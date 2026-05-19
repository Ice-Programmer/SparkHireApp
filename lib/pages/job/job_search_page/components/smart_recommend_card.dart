import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_hire_app/common/assets.dart';
import 'package:spark_hire_app/components/custom_button.dart';

class SmartRecommendCard extends StatelessWidget {
  final VoidCallback? onTap;

  const SmartRecommendCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                Assets.assetsImageJobAnalyzeCardBg,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 文字
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "✨ 智能推荐相关岗位",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      10.verticalSpace,

                      Text(
                        "试试 AI, 发现更适合自己的岗位",
                        style: TextStyle(color: Colors.white70, fontSize: 15),
                      ),
                    ],
                  ),

                  // 新手指南
                  CustomButton(
                    textColor: Theme.of(context).colorScheme.primary,
                    btnWidth: 90.w,
                    btnHeight: 34.h,
                    fontSize: 12.sp,
                    title: "立即探索",
                    backgroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                    isShadow: false,
                    icon: Icons.arrow_forward_ios,
                    iconGap: 4.w,
                    isIconRight: true,
                    onPressed: () {
                      context.push('/job/ai/recommend');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
