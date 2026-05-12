import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';

class CandidateInfoCard extends StatelessWidget {
  final UserBasicInfo userBasicInfo;
  final bool isLoading;
  const CandidateInfoCard({
    super.key,
    required this.userBasicInfo,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
      ),
      child: Row(
        children: [
          /// 左边
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CacheImage(
                      imageUrl: userBasicInfo.userAvatar,
                      height: 42.h,
                      width: 42.h,
                      borderRadius: 20.r,
                    ),

                    13.horizontalSpace,

                    /// 名字
                    Text(
                      userBasicInfo.username,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                10.verticalSpace,

                Text(
                  isLoading
                      ? "正在急速生成 ai 报告中，请耐心等待..."
                      : "根据你的资料，AI 已为你生成专属优化建议",
                  style: TextStyle(height: 1.5, fontSize: 12.sp),
                ),
              ],
            ),
          ),

          12.horizontalSpace,

          Container(
            width: 76.w,
            height: 76.h,
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.auto_awesome,
              color: Theme.of(context).colorScheme.primary,
              size: 38.sp,
            ),
          ),
        ],
      ),
    );
  }
}
