import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remixicon/remixicon.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/model/wish_career/get_current_wish_career.dart';
import 'package:spark_hire_app/model/wish_career/salary_currency_type.dart';
import 'package:spark_hire_app/pages/personal/components/profile_card/profile_card.dart';
import 'package:spark_hire_app/pages/personal/view_model/wish_career_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WishCareerCard extends StatelessWidget {
  final WishCareerViewModel viewModel;
  const WishCareerCard({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ProfileCard(
      title: AppLocalizations.of(context)!.expectedCareerText,
      iconData: Icons.track_changes_rounded,
      allCreate: true,
      onCreate: () {
        context.push("/personal/wish/career/edit/0", extra: viewModel);
      },
      childList:
          viewModel.wishCareerList
              ?.map((wishCareer) => _buildWishCareerInfo(context, wishCareer))
              .toList(),
    );
  }

  Widget _buildWishCareerInfo(
    BuildContext context,
    WishCareerInfo wishCareerInfo,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildCareerImage(
            icon: wishCareerInfo.careerInfo.careerIcon,
            context: context,
          ),

          16.horizontalSpace,

          Expanded(
            child: _buildWishCareerContent(
              wishCareerInfo: wishCareerInfo,
              context: context,
            ),
          ),

          _buildCareerEditBtn(context, wishCareerInfo.id),
        ],
      ),
    );
  }

  Widget _buildCareerEditBtn(BuildContext context, int id) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: () {
        context.push("/personal/wish/career/edit/$id", extra: viewModel);
      },
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Icon(
          RemixIcons.edit_line,
          size: 20.sp,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildCareerImage({
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
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(12.w),
      child: CacheImage(height: 28.w, width: 28.w, imageUrl: icon),
    );
  }

  Widget _buildWishCareerContent({
    required BuildContext context,
    required WishCareerInfo wishCareerInfo,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 职业名称
            Flexible(
              child: Text(
                wishCareerInfo.careerInfo.careerName,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            8.horizontalSpace,

            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: Theme.of(
                  context,
                ).colorScheme.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                wishCareerInfo.careerInfo.careerTypeName,
                style: TextStyle(
                  fontSize: 11.sp,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),

        6.verticalSpace,
        // 薪资信息
        Text(
          _buildSalaryRangeText(context, wishCareerInfo),
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.65),
          ),
        ),
      ],
    );
  }

  String _buildSalaryRangeText(
    BuildContext context,
    WishCareerInfo wishCareerInfo,
  ) {
    final lower = wishCareerInfo.salaryLower;
    final upper = wishCareerInfo.salaryUpper;
    final symbol = wishCareerInfo.salaryCurrencyType.symbol;

    if (lower == 0 && upper == 0) {
      return AppLocalizations.of(context)!.salaryNegotiableText;
    } else if (lower == 0) {
      return '${AppLocalizations.of(context)!.noPreferenceText} - $upper $symbol';
    } else if (upper == 0) {
      return '$lower $symbol - ${AppLocalizations.of(context)!.noPreferenceText}';
    } else {
      return '$lower - $upper $symbol';
    }
  }
}
