import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/components/custom_tag.dart';
import 'package:spark_hire_app/model/information/list_career.dart';

class CareerInfoCard extends StatelessWidget {
  final CareerInfo careerInfo;
  const CareerInfoCard({super.key, required this.careerInfo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // career logo icon
            _buildCareerImage(icon: careerInfo.careerIcon, context: context),

            18.horizontalSpace,

            // 中间文字信息
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  2.verticalSpace,

                  Text(
                    careerInfo.careerName,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    careerInfo.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),

                  4.verticalSpace,

                  // 状态标签
                  CustomTag(fontSize: 12.sp, text: careerInfo.careerTypeName),
                ],
              ),
            ),

            // 右侧箭头图标
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.black87,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCareerImage({
    required String icon,
    required BuildContext context,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30.h),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.04),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.all(12.w),
        child: CacheImage(height: 35.w, width: 35.w, imageUrl: icon),
      ),
    );
  }
}
