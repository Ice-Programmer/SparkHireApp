import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remixicon/remixicon.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/model/candidate/education_status.dart';
import 'package:spark_hire_app/model/education_exp/get_current_user_education.dart';
import 'package:spark_hire_app/pages/personal/candidate_info_vm.dart';
import 'package:spark_hire_app/pages/personal/components/profile_card/profile_card.dart';
import 'package:spark_hire_app/pages/personal/education_exp/education_info_card_skeleton.dart';

class EducationInfoCard extends StatelessWidget {
  final List<EducationExpInfo>? educationExpList;
  final CandidateViewModel viewModel;

  const EducationInfoCard({
    super.key,
    this.educationExpList,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    if (educationExpList == null) {
      return const EducationInfoCardSkeleton();
    }
    return ProfileCard(
      title: AppLocalizations.of(context)!.educationText,
      iconData: Icons.school_rounded,
      onCreate: () {
        context.push("/personal/education/edit/0", extra: viewModel);
      },
      childList:
          educationExpList!
              .map((educationExp) => _buildEducationInfo(educationExp, context))
              .toList(),
      allCreate: true,
    );
  }

  Widget _buildEducationInfo(
    EducationExpInfo educationExp,
    BuildContext context,
  ) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEducationImage(
              icon: educationExp.schoolInfo.schoolIcon,
              context: context,
            ),

            20.horizontalSpace,

            Expanded(
              child: _buildEducationContent(
                educationExp: educationExp,
                context: context,
              ),
            ),

            _buildEditBtn(context, educationExp.id),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationImage({
    required String icon,
    required BuildContext context,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.1),
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(10.w),
      child: CacheImage(height: 30.w, width: 30.w, imageUrl: icon),
    );
  }

  Widget _buildEditBtn(BuildContext context, int id) {
    return Center(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          context.push("/personal/education/edit/$id", extra: viewModel);
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
    required EducationExpInfo educationExp,
    required BuildContext context,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 10.w,
          runSpacing: 6.h,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              educationExp.schoolInfo.schoolName,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            ),
            educationExp.status.tag(context),
          ],
        ),

        4.verticalSpace,

        Text(
          educationExp.majorInfo.majorName,
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
            beginYear: educationExp.beginYear,
            endYear: educationExp.endYear,
            context: context,
          ),
          style: TextStyle(
            fontSize: 12.sp,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.8),
          ),
        ),

        4.verticalSpace,

        Text(
          educationExp.activity,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
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
    required int beginYear,
    endYear,
    required BuildContext context,
  }) {
    final yearText = AppLocalizations.of(context)!.yearText;
    return '$beginYear - $endYear (${endYear - beginYear} $yearText)';
  }
}
