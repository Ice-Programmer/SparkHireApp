import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spark_hire_app/common/assets.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/components/custom_button.dart';
import 'package:spark_hire_app/model/company/company_info.dart';
import 'package:spark_hire_app/utils/salary_util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompanyInfoHeader extends StatelessWidget {
  final CompanyInfo companyInfo;

  const CompanyInfoHeader({super.key, required this.companyInfo});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 400.h,
      pinned: true,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        AppLocalizations.of(context)!.companyDetailText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert, color: Colors.white),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            // 底层：SVG 背景图片
            SvgPicture.asset(
              Assets.assetsImageCompanyCompanyBackground,
              fit: BoxFit.fitHeight,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                60.verticalSpace,

                // Logo
                CircleAvatar(
                  radius: 40.r,
                  backgroundColor: Colors.white,
                  child: CacheImage(
                    height: 50.h,
                    width: 50.w,
                    imageUrl: companyInfo.companyLogo,
                    borderRadius: 10.r,
                  ),
                ),

                20.verticalSpace,

                Text(
                  companyInfo.companyName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                12.verticalSpace,

                // 关注 · 地址
                Text(
                  "${SalaryUtil.formatSalary(companyInfo.favoriteCnt)} ${AppLocalizations.of(context)!.followText}  •  ${companyInfo.geoInfo.thirdGeoLevelName}, ${companyInfo.geoInfo.forthGeoLevelName}",
                  style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                ),

                30.verticalSpace,

                // 按钮组
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 关注
                    CustomButton(
                      onPressed: () {},
                      textColor: Theme.of(context).colorScheme.primary,
                      btnWidth: 140.w,
                      btnHeight: 44.h,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      title: "关注",
                      isShadow: false,
                      backgroundColor: Colors.white,
                    ),

                    20.horizontalSpace,

                    // 访问网站
                    CustomButton(
                      onPressed: () {},
                      textColor: Theme.of(context).colorScheme.primary,
                      btnWidth: 140.w,
                      btnHeight: 44.h,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      title: AppLocalizations.of(context)!.visitWebText,
                      isShadow: false,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),

      bottom: PreferredSize(
        preferredSize: Size.fromHeight(30.h),
        child: Container(
          height: 30.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
        ),
      ),
    );
  }
}
