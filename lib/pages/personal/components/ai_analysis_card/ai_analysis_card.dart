import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_hire_app/common/assets.dart';
import 'package:spark_hire_app/components/custom_button.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';
import 'package:spark_hire_app/pages/personal/components/ai_analysis_card/ai_analysis_card_skeleton.dart';

class AiAnalysisCard extends StatelessWidget {
  final UserBasicInfo? userBasicInfo;
  final VoidCallback? onTap;

  const AiAnalysisCard({super.key, this.onTap, this.userBasicInfo});

  @override
  Widget build(BuildContext context) {
    if (userBasicInfo == null) {
      return const AiAnalysisCardSkeleton();
    }

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
                        "AI 智能分析 ✨",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      10.verticalSpace,

                      Text(
                        "深度分析你的资料，提供专属优化意见",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),

                  // ai 分析
                  CustomButton(
                    textColor: Theme.of(context).colorScheme.primary,
                    btnWidth: 90.w,
                    btnHeight: 34.h,
                    fontSize: 12.sp,
                    title: "立刻分析",
                    backgroundColor:
                        Theme.of(context).colorScheme.inversePrimary,
                    isShadow: false,
                    icon: Icons.arrow_forward_ios,
                    iconGap: 4.w,
                    isIconRight: true,
                    onPressed:
                        () => context.push(
                          "/personal/ai/analysis",
                          extra: userBasicInfo!,
                        ),
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
