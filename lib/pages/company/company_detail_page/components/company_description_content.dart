import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/model/company/company_info.dart';

class CompanyDescriptionContent extends StatelessWidget {
  final CompanyInfo companyInfo;
  const CompanyDescriptionContent({super.key, required this.companyInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "公司介绍",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),

        8.verticalSpace,

        Text(
          companyInfo.description,
          style: TextStyle(
            fontSize: 14.sp,
            color: Theme.of(context).colorScheme.tertiary,
            height: 1.8,
          ),
        ),

        40.verticalSpace,

        _buildSectionTitle(context),

        20.verticalSpace,

        _buildOfficeGallery(context),

        100.verticalSpace,
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "办公环境",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),

        // todo 跳转逻辑
        Text(
          "查看全部",
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
