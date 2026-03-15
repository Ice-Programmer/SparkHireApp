import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/components/expandable_text.dart';
import 'package:spark_hire_app/model/company/company_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/pages/job/job_detail_page/components/geo_detail_content.dart';

class CompanyDescriptionContent extends StatelessWidget {
  final CompanyInfo companyInfo;
  const CompanyDescriptionContent({super.key, required this.companyInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.companyDescriptionText,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),

        8.verticalSpace,

        ExpandableText(
          text: companyInfo.description,
          maxLines: 10,
          style: TextStyle(
            fontSize: 14.sp,
            color: Theme.of(context).colorScheme.tertiary,
            height: 1.8,
          ),
        ),

        30.verticalSpace,

        // 办公环境
        _buildSectionTitle(context),

        20.verticalSpace,

        _buildOfficeGallery(context),

        30.verticalSpace,

        // 办公地点
        Text(
          AppLocalizations.of(context)!.workLocationText,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),

        12.verticalSpace,

        // 工作地点
        JobLocationMapCard(geoInfo: companyInfo.geoInfo),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.officeEnvText,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),

        // todo 跳转逻辑
        Text(
          AppLocalizations.of(context)!.viewAllText,
          style: TextStyle(
            fontSize: 13.sp,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildOfficeGallery(BuildContext context) {
    final List<String> images = companyInfo.companyImageList;

    if (images.isEmpty) return _buildEmptyGallery(context);

    return SizedBox(
      height: 80.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: images.length > 4 ? 4 : images.length,
        separatorBuilder: (_, __) => 12.horizontalSpace,
        itemBuilder: (context, index) {
          final bool showMoreOverlay = index == 3 && images.length > 4;

          return Stack(
            children: [
              CacheImage(
                width: 80.w,
                height: 80.h,
                imageUrl: images[index], // 当前显示的图
                borderRadius: 12.r,
                canView: true,
                galleryImages: images,
                index: index,
                // ---------------------------
              ),

              if (showMoreOverlay)
                IgnorePointer(
                  child: Container(
                    width: 80.w,
                    height: 80.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      "+${images.length - 3}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  /// 优雅的占位组件
  Widget _buildEmptyGallery(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.inverseSurface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_not_supported_outlined,
            color: Colors.grey[400],
            size: 24.r,
          ),
          4.verticalSpace,
          Text(
            "暂无办公环境照片",
            style: TextStyle(color: Colors.grey[500], fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
