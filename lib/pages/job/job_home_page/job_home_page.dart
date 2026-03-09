import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/clickable_search_bar.dart';
import 'package:spark_hire_app/pages/job/job_home_page/components/analyze_card.dart';
import 'package:spark_hire_app/pages/job/job_home_page/components/popular_job_card.dart';
import 'package:spark_hire_app/pages/job/job_home_page/components/relative_content.dart';
import 'package:spark_hire_app/pages/job/job_home_page/components/title_content.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/pages/job/job_home_page/view_model/recruitment_view_model.dart';

class JobHomePage extends StatelessWidget {
  const JobHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => RecruitmentViewModel()..refresh(),
        ),
      ],
      builder: (context, child) {
        return SafeArea(
          minimum: EdgeInsets.all(20.w),
          child: _buildBody(context),
        );
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      children: [
        // 顶部栏
        TitleContent(),

        24.verticalSpace,

        // 搜索框
        ClickableSearchButton(
          onTap: () {},
          hintText: AppLocalizations.of(context)!.searchText,
        ),

        20.verticalSpace,

        // 分析卡片
        AnalysisDataCard(),

        20.verticalSpace,

        // 受欢迎的工作
        PopularJobCard(),

        20.verticalSpace,

        // 技能相符的职位
        Consumer<RecruitmentViewModel>(
          builder: (context, vm, _) {
            return RelativeJobContent(viewModel: vm);
          },
        ),
      ],
    );
  }
}
