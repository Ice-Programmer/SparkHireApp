import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/empty_state.dart';
import 'package:spark_hire_app/pages/job/job_home_page/view_model/recruitment_view_model.dart';

class RelativeJobContent extends StatelessWidget {
  final RecruitmentViewModel viewModel;
  const RelativeJobContent({super.key, required this.viewModel});

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "🔥 ${AppLocalizations.of(context)!.popularJobText}",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),

        // 查看全部
        GestureDetector(
          onTap: () {},
          child: Text(
            AppLocalizations.of(context)!.viewAllText,
            style: TextStyle(
              fontSize: 15.sp,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //
        _buildTitle(context),

        // 求职卡片列表
        _buildRecruitmentCardList(context),
      ],
    );
  }

  Widget _buildRecruitmentCardList(BuildContext context) {
    if (viewModel.isLoading && viewModel.recruitmentInfoList.isEmpty) {
      return const CircularProgressIndicator(); // 首次加载的 loading
    }

    if (viewModel.recruitmentInfoList.isEmpty) {
      return EmptyState(title: "暂无招聘信息", subTitle: "稍后再来看看吧");
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {},
    );
  }
}
