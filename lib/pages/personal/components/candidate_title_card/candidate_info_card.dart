import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:remixicon/remixicon.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';
import 'package:spark_hire_app/pages/personal/components/candidate_title_card/candidate_info_skeleton.dart';
import 'package:spark_hire_app/pages/personal/candidate_info_vm.dart';

class CandidateInfoCard extends StatefulWidget {
  final UserBasicInfo? userBasicInfo;
  const CandidateInfoCard({super.key, this.userBasicInfo});

  @override
  State<CandidateInfoCard> createState() => _CandidateInfoCardState();
}

class _CandidateInfoCardState extends State<CandidateInfoCard> {
  final CandidateViewModel _viewModel = CandidateViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.loadCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.userBasicInfo == null) {
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

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.userBasicInfo!.username,
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
              ),

              6.verticalSpace,

              Text(
                "老八是我的女朋友",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.35),
                ),
              ),
            ],
          ),

          Spacer(),

          IconButton(
            onPressed: () {},
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
