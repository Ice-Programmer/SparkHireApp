import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/components/custom_markdown.dart';
import 'package:spark_hire_app/model/recruitment/job_type.dart';
import 'package:spark_hire_app/model/recruitment/recruitment_info.dart';
import 'package:spark_hire_app/utils/salary_util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JobDetailPage extends StatelessWidget {
  final RecruitmentInfo recruitmentInfo;
  const JobDetailPage({super.key, required this.recruitmentInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "职位详细",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            10.verticalSpace,

            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // 白色背景容器
                  Positioned.fill(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 40.h),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(32.r),
                        ),
                      ),
                      child: _buildScrollContent(context),
                    ),
                  ),

                  // 悬浮的公司 Logo 头像
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(6.r),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: _buildCompanyImage(
                          icon: recruitmentInfo.companyInfo.companyLogo,
                          context: context,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // 底部固定按钮
      bottomNavigationBar: _buildBottomBar(context),
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
      padding: EdgeInsets.all(12.w),
      child: CacheImage(
        height: 46.h,
        width: 50.w,
        imageUrl: icon,
        borderRadius: 10.r,
      ),
    );
  }

  // 构建可滚动的内容区域
  Widget _buildScrollContent(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          60.verticalSpace,

          Center(
            child: Column(
              children: [
                // 岗位名称
                Text(
                  recruitmentInfo.name,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                8.verticalSpace,

                // 公司名称 + 地址
                Text(
                  "${recruitmentInfo.companyInfo.companyName} • ${recruitmentInfo.geoInfo.thirdGeoLevelName}, ${recruitmentInfo.geoInfo.forthGeoLevelName}",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
              ],
            ),
          ),

          30.verticalSpace,

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // 薪资
              _buildInfoItem(
                context,
                Icons.workspace_premium_outlined,
                AppLocalizations.of(context)!.salaryText,
                SalaryUtil.buildSalaryRangeText(
                  context,
                  recruitmentInfo.salaryInfo,
                ),
              ),

              // 工作类型
              _buildInfoItem(
                context,
                Icons.access_time_filled,
                AppLocalizations.of(context)!.jobTypeText,
                recruitmentInfo.jobType.getMultiLanguageString(context),
              ),

              // 行业
              _buildInfoItem(
                context,
                Icons.flag,
                AppLocalizations.of(context)!.industryText,
                recruitmentInfo.careerInfo.careerTypeName,
              ),
            ],
          ),

          40.verticalSpace,

          // 职位描述
          Text(
            AppLocalizations.of(context)!.jobDescriptionText,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),

          12.verticalSpace,

          // 职位详情
          Text(
            recruitmentInfo.description,
            style: TextStyle(
              fontSize: 14.sp,
              color: Theme.of(context).colorScheme.outline,
              height: 1.6,
            ),
          ),

          30.verticalSpace,

          // 职位要求
          Text(
            AppLocalizations.of(context)!.jobRequirementText,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),

          12.verticalSpace,

          CustomMarkdown(text: recruitmentInfo.requirement),

          40.verticalSpace, // 底部留白
        ],
      ),
    );
  }

  // 构建中间的三个圆形信息项
  Widget _buildInfoItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(icon, color: Colors.white, size: 28.r),
          ),
          12.verticalSpace,
          Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          4.verticalSpace,
          Text(
            value,
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // 构建底部悬浮按钮
  Widget _buildBottomBar(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 34.h),
      child: SizedBox(
        width: double.infinity,
        height: 60.h,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
          child: Text(
            AppLocalizations.of(context)!.applyJobText,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
