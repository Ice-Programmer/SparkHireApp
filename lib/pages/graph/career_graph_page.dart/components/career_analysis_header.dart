import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/components/custom_tag.dart';
import 'package:spark_hire_app/model/information/list_career.dart';

class CareerAnalysisHeader extends StatelessWidget {
  final CareerInfo careerInfo;

  const CareerAnalysisHeader({super.key, required this.careerInfo});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // icon
        _buildCareerImage(icon: careerInfo.careerIcon, context: context),

        20.horizontalSpace,

        // basic info
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  // 职业名称
                  Text(
                    careerInfo.careerName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),

                  10.horizontalSpace,

                  // career type 标签
                  CustomTag(
                    fontSize: 12.sp,
                    text: careerInfo.careerTypeName,
                  ),
                ],
              ),

              4.verticalSpace,

              // 职业描述
              Text(
                careerInfo.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCareerImage({required String icon, required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.04),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(12.w),
      child: CacheImage(height: 50.w, width: 50.w, imageUrl: icon),
    );
  }
}
