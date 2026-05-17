import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spark_hire_app/common/assets.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/components/custom_button.dart';
import 'package:spark_hire_app/model/company/company_info.dart';
import 'package:spark_hire_app/pages/company/company_detail_page/components/company_favor_btn.dart';
import 'package:spark_hire_app/utils/salary_util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompanyInfoHeader extends StatelessWidget {
  final CompanyInfo companyInfo;

  const CompanyInfoHeader({super.key, required this.companyInfo});

  @override
  Widget build(BuildContext context) {
    // 定义展开高度
    final double expandedHeight = 320.h;

    final double collapsedToolbarHeight = 30.h;

    return SliverLayoutBuilder(
      builder: (BuildContext context, SliverConstraints constraints) {
        final double maxScroll =
            expandedHeight -
            collapsedToolbarHeight -
            MediaQuery.of(context).padding.top;

        // 计算当前滑动的进度比例 (0.0 到 1.0)
        final double scrollPercent = (constraints.scrollOffset / maxScroll)
            .clamp(0.0, 1.0);

        // 根据滑动比例，让图标颜色从白色平滑过渡到黑色
        final Color? iconColor = Color.lerp(
          Colors.white,
          Theme.of(context).colorScheme.onSurface,
          scrollPercent,
        );

        return SliverAppBar(
          expandedHeight: expandedHeight,
          // 显式设置 Toolbar 和折叠高度
          toolbarHeight: collapsedToolbarHeight,
          collapsedHeight: collapsedToolbarHeight,
          elevation: 0,
          pinned: true,
          backgroundColor: Theme.of(context).colorScheme.surface,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: iconColor),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: iconColor),
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30.r),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  SvgPicture.asset(
                    Assets.assetsImageCompanyCompanyBackground,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // 公司头像
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

                      // 公司名称
                      Text(
                        companyInfo.companyName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      12.verticalSpace,

                      // 关注者 · 地址
                      Text(
                        "${SalaryUtil.formatSalary(companyInfo.favoriteCnt)} ${AppLocalizations.of(context)!.followText}  •  ${companyInfo.geoInfo.thirdGeoLevelName}, ${companyInfo.geoInfo.forthGeoLevelName}",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.sp,
                        ),
                      ),

                      30.verticalSpace,

                      // 关注 + 访问网站
                      _buildButtonList(context),

                      30.verticalSpace,
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildButtonList(BuildContext context) {
    final btnWidth = MediaQuery.of(context).size.width * 0.4;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 使用封装好的动态关注按钮
        CompanyFollowButton(btnWidth: btnWidth),

        20.horizontalSpace,

        // 访问网站
        CustomButton(
          onPressed: () {},
          textColor: Theme.of(context).colorScheme.primary,
          btnWidth: btnWidth,
          btnHeight: 42.h,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          title: AppLocalizations.of(context)!.visitWebText,
          isShadow: false,
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}
