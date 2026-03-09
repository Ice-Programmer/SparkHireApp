import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:spark_hire_app/components/clickable_search_bar.dart';
import 'package:spark_hire_app/pages/job/job_home_page/components/analyze_card.dart';
import 'package:spark_hire_app/pages/job/job_home_page/components/popular_job_card.dart';
import 'package:spark_hire_app/pages/job/job_home_page/components/relative_content.dart';
import 'package:spark_hire_app/pages/job/job_home_page/components/title_content.dart';
import 'package:spark_hire_app/pages/job/job_home_page/view_model/recruitment_view_model.dart';

class JobHomePage extends StatefulWidget {
  const JobHomePage({super.key});

  @override
  State<JobHomePage> createState() => _JobHomePageState();
}

class _JobHomePageState extends State<JobHomePage> {
  final ScrollController _scrollController = ScrollController();
  late RecruitmentViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    // 1. 初始化 ViewModel 并触发首次加载
    _viewModel = RecruitmentViewModel();
    _viewModel.refresh();

    // 2. 监听滚动事件，实现上拉加载更多
    _scrollController.addListener(() {
      // 当滑动到距离底部还剩 200 像素时，提前触发加载下一页，提升用户体验
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        _viewModel.loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 3. 将 ViewModel 提供给子组件
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: SafeArea(
        minimum: EdgeInsets.all(20.w),
        // 4. 原生下拉刷新组件
        child: RefreshIndicator(
          onRefresh: () => _viewModel.refresh(),
          child: ListView(
            controller: _scrollController, // 绑定控制器
            physics: const AlwaysScrollableScrollPhysics(), // 保证内容不足一屏也能下拉刷新
            children: [
              const TitleContent(),
              24.verticalSpace,
              ClickableSearchButton(
                onTap: () {},
                hintText: AppLocalizations.of(context)!.searchText,
              ),
              20.verticalSpace,
              const AnalysisDataCard(),
              20.verticalSpace,
              const PopularJobCard(),
              20.verticalSpace,
              
              // 5. 使用 Consumer 监听数据变化，传给子组件渲染
              Consumer<RecruitmentViewModel>(
                builder: (context, viewModel, child) {
                  return RelativeJobContent(viewModel: viewModel);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}