import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:remixicon/remixicon.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/components/custom_tag.dart';
import 'package:spark_hire_app/model/candidate/get_current_candidate.dart';
import 'package:spark_hire_app/model/candidate/job_status.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';
import 'package:spark_hire_app/pages/personal/basic_info/candidate_info_skeleton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/pages/personal/view_model/candidate_view_model.dart';
import 'package:spark_hire_app/pages/personal/view_model/user_view_model.dart';

class CandidateInfoCard extends StatefulWidget {
  final UserBasicInfo? userBasicInfo;
  final CandidateInfo? candidateInfo;
  const CandidateInfoCard({super.key, this.userBasicInfo, this.candidateInfo});

  @override
  State<CandidateInfoCard> createState() => _CandidateInfoCardState();
}

class _CandidateInfoCardState extends State<CandidateInfoCard> {
  final CandidateInfoViewModel _viewModel = CandidateInfoViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.loadCurrentCandidate();
  }

  Widget _buildSubline() {
    return Row(
      children: [
        CustomTag(
          color: widget.candidateInfo!.jobStatus.color,
          fontSize: 11.sp,
          text: widget.candidateInfo!.jobStatus.getMultiLanguageString(context),
        ),

        10.horizontalSpace,

        CustomTag(
          color: Colors.deepPurpleAccent,
          fontSize: 11.sp,
          text:
              '${widget.candidateInfo?.age ?? '20'}${AppLocalizations.of(context)!.ageText}',
        ),
      ],
    );
  }

  Widget _buildNameLine() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.userBasicInfo!.username,
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
        ),

        8.horizontalSpace,

        _buildGenderTag(),
      ],
    );
  }

  Widget _buildGenderTag() {
    final bool isMale = widget.userBasicInfo?.gender.value == 1;
    final Color genderColor =
        isMale ? const Color(0xFF2196F3) : const Color(0xFFFF4081);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: genderColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: genderColor.withValues(alpha: 0.2),
          width: 0.5,
        ),
      ),
      child: Icon(
        isMale ? RemixIcons.men_line : RemixIcons.women_line,
        size: 12.sp,
        color: genderColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.userBasicInfo == null || widget.candidateInfo == null) {
      return CandidateInfoSkeleton();
    }
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          CacheImage(
            height: 64.w,
            width: 64.w,
            borderRadius: 32.r,
            imageUrl: widget.userBasicInfo!.userAvatar,
          ),

          16.horizontalSpace,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_buildNameLine(), 6.verticalSpace, _buildSubline()],
            ),
          ),

          IconButton(
            onPressed: () {
              final candidateInfoViewModel = context.read<CandidateInfoViewModel>();
              final userViewModel = context.read<UserViewModel>();
              context.push("/personal/basic/edit", extra: (userViewModel, candidateInfoViewModel));
            },
            icon: Icon(
              RemixIcons.edit_line,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
