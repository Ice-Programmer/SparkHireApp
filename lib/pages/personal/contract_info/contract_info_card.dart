import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:remixicon/remixicon.dart';
import 'package:spark_hire_app/components/description_skeleton.dart';
import 'package:spark_hire_app/model/candidate/get_current_candidate.dart';
import 'package:spark_hire_app/pages/personal/components/profile_card/profile_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/pages/personal/components/profile_card/profile_card_skeleton.dart';

class ContractInfoCard extends StatefulWidget {
  final ContractInfo? contractInfo;
  const ContractInfoCard({super.key, this.contractInfo});

  @override
  State<ContractInfoCard> createState() => _ContractInfoCardState();
}

class _ContractInfoCardState extends State<ContractInfoCard> {
  @override
  Widget build(BuildContext context) {
    if (widget.contractInfo == null) {
      return ProfileCardSkeleton(child: DescriptionSkeleton());
    }
    return ProfileCard(
      iconData: Icons.person_rounded,
      title: AppLocalizations.of(context)!.contactInformationTitle,
      childList: [_buildContractDescription()],
      onEdit: () {
        context.push("/personal/contract/edit", extra: widget.contractInfo);
      },
    );
  }

  Widget _buildContractDescription() {
    return Column(
      children: [
        5.verticalSpace,
        _buildContractInfo(
          icon: RemixIcons.map_pin_line,
          contractInfo: widget.contractInfo?.geoInfo.address,
        ),

        _buildContractInfo(
          icon: RemixIcons.phone_line,
          contractInfo: widget.contractInfo?.phone,
        ),

        _buildContractInfo(
          icon: RemixIcons.mail_line,
          contractInfo: widget.contractInfo?.email,
        ),
      ],
    );
  }

  Widget _buildContractInfo({required IconData icon, String? contractInfo}) {
    if (contractInfo == null || contractInfo.isEmpty) {
      return SizedBox.shrink();
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          3.horizontalSpace,

          Icon(
            icon,
            color: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.6),
          ),

          16.horizontalSpace,

          Text(
            contractInfo,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w700,
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
