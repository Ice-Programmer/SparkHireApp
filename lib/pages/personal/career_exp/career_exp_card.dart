import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remixicon/remixicon.dart';
import 'package:spark_hire_app/model/career_exp/get_current_user_career_exp.dart';
import 'package:spark_hire_app/pages/personal/components/profile_card/profile_card.dart';
import 'package:spark_hire_app/pages/personal/education_exp/education_info_card_skeleton.dart';
import 'package:spark_hire_app/pages/personal/view_model/career_exp_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CareerExpCard extends StatelessWidget {
  final CareerExpViewModel viewModel;
  final List<CareerExperienceInfo>? careerExpInfoList;

  const CareerExpCard({
    super.key,
    required this.viewModel,
    this.careerExpInfoList,
  });

  @override
  Widget build(BuildContext context) {
    if (careerExpInfoList == null) {
      return const EducationInfoCardSkeleton();
    }
    return ProfileCard(
      title: AppLocalizations.of(context)!.careerExpText,
      iconData: Icons.analytics_rounded,
      onCreate: () {
        context.push("/personal/career/exp/edit/0", extra: viewModel);
      },
      childList:
          careerExpInfoList!
              .map((educationExp) => _buildCareerExpInfo(educationExp, context))
              .toList(),
      allCreate: true,
    );
  }

  Widget _buildCareerExpInfo(
    CareerExperienceInfo careerExp,
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCareerExpIcon(context: context),

            20.horizontalSpace,

            Expanded(
              child: _buildEducationContent(
                context: context,
                careerExpInfo: careerExp,
              ),
            ),

            _buildEditBtn(context, careerExp.id),
          ],
        ),
      ),
    );
  }

  Widget _buildCareerExpIcon({required BuildContext context}) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.all(10.w),
      child: Icon(
        Icons.work_rounded,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  Widget _buildEditBtn(BuildContext context, int id) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          context.push("/personal/career/exp/edit/$id", extra: viewModel);
        },
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Icon(
            RemixIcons.edit_line,
            size: 20.sp,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildEducationContent({
    required CareerExperienceInfo careerExpInfo,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          careerExpInfo.jobRole,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),

        4.verticalSpace,

        Text(
          careerExpInfo.experienceName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12.sp,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.8),
          ),
        ),

        4.verticalSpace,

        Text(
          _formatTimeText(
            startTS: careerExpInfo.startTS,
            endTS: careerExpInfo.endTS,
            context: context,
          ),
          style: TextStyle(
            fontSize: 12.sp,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.8),
          ),
        ),
      ],
    );
  }

  String _formatTimeText({
    required int startTS,
    required int endTS,
    required BuildContext context,
  }) {
    final yearText = AppLocalizations.of(context)!.yearText;
    final monthText = AppLocalizations.of(context)!.monthText;

    final start = DateTime.fromMillisecondsSinceEpoch(startTS * 1000);
    final end = DateTime.fromMillisecondsSinceEpoch(endTS * 1000);

    final startText = "${start.year}.${start.month.toString().padLeft(2, '0')}";
    final endText = "${end.year}.${end.month.toString().padLeft(2, '0')}";

    final totalMonths =
        (end.year - start.year) * 12 + (end.month - start.month);

    String durationText;

    if (totalMonths < 24) {
      durationText = "$totalMonths $monthText";
    } else {
      final years = totalMonths / 12;
      durationText = "${years.toStringAsFixed(1)} $yearText";
    }

    return "$startText - $endText ($durationText)";
  }
}
