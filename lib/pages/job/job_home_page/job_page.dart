import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/clickable_search_bar.dart';
import 'package:spark_hire_app/pages/job/job_home_page/components/analyze_card.dart';
import 'package:spark_hire_app/pages/job/job_home_page/components/title_content.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JobPage extends StatelessWidget {
  const JobPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(20.w),
      child: ListView(
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

          // 受欢迎的工作

          // 技能相符的职位
        ],
      ),
    );
  }
}
