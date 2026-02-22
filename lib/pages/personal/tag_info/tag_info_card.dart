import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_hire_app/components/custom_tag.dart';
import 'package:spark_hire_app/model/tag/tag_info.dart';
import 'package:spark_hire_app/pages/personal/components/profile_card/profile_card.dart';
import 'package:spark_hire_app/pages/personal/tag_info/tag_info_card_skeleton.dart';
import 'package:spark_hire_app/pages/personal/view_model/tag_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TagInfoCard extends StatelessWidget {
  final TagViewModel viewModel;
  final List<TagInfo>? tagList;

  const TagInfoCard({
    super.key,
    required this.viewModel,
    required this.tagList,
  });

  @override
  Widget build(BuildContext context) {
    if (tagList == null) {
      return const TagInfoCardSkeleton();
    }
    final tagWidget = _buildTagList();
    return ProfileCard(
      onCreate: () {
        context.push("/personal/skill/tag/edit", extra: viewModel);
      },
      onEdit: () {
        context.push("/personal/skill/tag/edit", extra: viewModel);
      },
      title: AppLocalizations.of(context)!.skillText,
      iconData: Icons.pie_chart_rounded,
      childList: tagWidget == null ? null : [tagWidget],
    );
  }

  Widget? _buildTagList() {
    final List<TagInfo>? tags = tagList;

    if (tags == null || tags.isEmpty) {
      return null;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: <Widget>[
            ...tags.map(
              (tag) => CustomTag(
                text: tag.tagName,
                fontSize: 14.sp,
                borderRadius: 10.r,
                horizontalPadding: 10.w,
                verticalPadding: 5.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
