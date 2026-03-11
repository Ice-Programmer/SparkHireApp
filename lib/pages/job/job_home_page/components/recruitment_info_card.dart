import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/model/recruitment/recruitment_info.dart';
import 'package:spark_hire_app/model/wish_career/salary_frequency_type.dart';
import 'package:spark_hire_app/utils/salary_util.dart';

class RecruitmentInfoCard extends StatelessWidget {
  final RecruitmentInfo recruitmentInfo;
  const RecruitmentInfoCard({super.key, required this.recruitmentInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/job/detail', extra: recruitmentInfo);
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.6),
            width: 0.4,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 第一行：头像、标题和收藏按钮
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 公司头像
                _buildCompanyImage(
                  context: context,
                  icon: recruitmentInfo.companyInfo.companyLogo,
                ),

                12.horizontalSpace,

                // 职位信息
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 职位名称
                      Text(
                        recruitmentInfo.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      4.verticalSpace,

                      // 公司名称
                      Text(
                        recruitmentInfo.companyInfo.companyName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ),

                // 收藏图标
                Icon(
                  Icons.bookmarks_outlined,
                  color: Colors.grey[400],
                  size: 22.r,
                ),
              ],
            ),

            // 第二行：标签列表
            buildTagRow(
              context,
              recruitmentInfo.tagInfoList.map((tag) => tag.tagName).toList(),
            ),

            10.verticalSpace,

            // 第三行：职位描述
            Text(
              recruitmentInfo.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),

            16.verticalSpace,

            // 第四行：地点和薪资
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 地点
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16.r,
                        color: Colors.grey,
                      ),

                      4.horizontalSpace,

                      Expanded(
                        child: Text(
                          '${recruitmentInfo.geoInfo.thirdGeoLevelName} ${recruitmentInfo.geoInfo.forthGeoLevelName}',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[500],
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),

                12.horizontalSpace,

                // 薪资
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: SalaryUtil.buildSalaryRangeText(
                          context,
                          recruitmentInfo.salaryInfo,
                        ),
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text:
                            " ${recruitmentInfo.salaryInfo.frequencyType.getText(context)}",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 标签构建方法
  Widget _buildTag(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(100.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          color: Theme.of(context).colorScheme.outline,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildCompanyImage({
    required String icon,
    required BuildContext context,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.04),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(39.r),
      ),
      padding: EdgeInsets.all(8.r),
      child: CacheImage(
        height: 26.h,
        width: 26.w,
        imageUrl: icon,
        borderRadius: 6.r,
      ),
    );
  }

  Widget buildTagRow(BuildContext context, List<String> tags) {
    if (tags.isEmpty) {
      return SizedBox.shrink();
    }
    const int maxVisible = 4; // 一行最多显示几个 tag

    int hiddenCount = tags.length - maxVisible;

    List<Widget> children = [];

    for (int i = 0; i < tags.length && i < maxVisible; i++) {
      children.add(_buildTag(context, tags[i]));
    }

    if (hiddenCount > 0) {
      children.add(_buildTag(context, "+$hiddenCount"));
    }

    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Wrap(spacing: 8.w, runSpacing: 5.h, children: children),
    );
  }
}
