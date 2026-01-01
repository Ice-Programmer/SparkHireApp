import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_hire_app/pages/personal/candidate_info_vm.dart';
import 'package:spark_hire_app/pages/personal/components/profile_card/profile_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/pages/personal/summary_info/summary_info_card_skeleton.dart';

class SummaryInfoCard extends StatefulWidget {
  final String? profile;
  final CandidateViewModel viewModel;
  const SummaryInfoCard({super.key, this.profile, required this.viewModel});

  @override
  State<SummaryInfoCard> createState() => _SummaryInfoCardState();
}

class _SummaryInfoCardState extends State<SummaryInfoCard> {
  @override
  Widget build(BuildContext context) {
    if (widget.profile == null) {
      return SummaryInfoCardSkeleton();
    }

    return ProfileCard(
      iconData: Icons.article_rounded,
      title: AppLocalizations.of(context)!.summaryText,
      onEdit: () {
        context.push("/personal/profile/edit", extra: widget.viewModel);
      },
      childList: [5.verticalSpace, _buildSummaryContent()],
    );
  }

  Widget _buildSummaryContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          widget.profile ?? "",
          maxLines: 7,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
      ),
    );
  }
}
