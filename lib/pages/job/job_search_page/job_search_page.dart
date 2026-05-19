import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/custom_input.dart';
import 'package:spark_hire_app/components/edit_title.dart';
import 'package:spark_hire_app/components/keyboard_wrapper.dart';
import 'package:spark_hire_app/model/recruitment/query_recruitment_page.dart';
import 'package:spark_hire_app/pages/job/job_home_page/components/relative_content.dart';
import 'package:spark_hire_app/pages/job/job_home_page/view_model/recruitment_view_model.dart';
import 'package:spark_hire_app/pages/job/job_search_page/components/search_history_content.dart';
import 'package:spark_hire_app/pages/job/job_search_page/view_model/user_search_history_view_model.dart';

class JobSearchPage extends StatefulWidget {
  const JobSearchPage({super.key});

  @override
  State<JobSearchPage> createState() => _JobSearchPageState();
}

class _JobSearchPageState extends State<JobSearchPage> {
  final ScrollController _scrollController = ScrollController();
  
  // 统一由 State 类管理的实例
  late RecruitmentViewModel _viewModel;
  late UserSearchHistoryViewModel _historyViewModel;
  
  RecuritmentCondition condition = RecuritmentCondition();

  @override
  void initState() {
    super.initState();
    _viewModel = RecruitmentViewModel();
    _viewModel.refresh(condition: condition);
    
    _historyViewModel = UserSearchHistoryViewModel();
    _historyViewModel.loadHistoryList();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        _viewModel.loadMore(); // 此时滑动到底部，触发的是正确的实例
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _viewModel.dispose();
    _historyViewModel.dispose();
    super.dispose();
  }

  void _searchJobs(String value) {
    FocusScope.of(context).unfocus();
    setState(() {
      condition = condition.copyWith(searchText: value);
    });
    _viewModel.refresh(condition: condition);
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissWrapper(
      child: Scaffold(
        appBar: EditAppBar(titleName: "搜索", centerTitle: true),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: _viewModel),
            ChangeNotifierProvider.value(value: _historyViewModel),
          ],
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              10.verticalSpace,
              // 搜索框
              CustomInput(
                key: ValueKey(condition.searchText),
                height: 45.h,
                backgroundColor: Theme.of(context).colorScheme.inverseSurface,
                borderRadius: 25.r,
                textInputAction: TextInputAction.search,
                defaultValue: condition.searchText,
                onSubmitted: (value) {
                  _searchJobs(value);
                },
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.outline,
                    size: 23.sp,
                  ),
                ),
                onChanged: (value) {
                  condition = condition.copyWith(searchText: value);
                },
                hintText: "请输入关键词，例如：后端开发工程师",
                hintColor: Theme.of(context).colorScheme.outline,
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 5.w),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.tune,
                      color: Theme.of(context).colorScheme.outline,
                      size: 23.sp,
                    ),
                  ),
                ),
              ),

              15.verticalSpace,

              /// 历史检索内容
              Consumer<UserSearchHistoryViewModel>(
                builder: (context, vm, child) {
                  return SearchHistoryContent(
                    onTagTap: _searchJobs,
                    historyList: vm.historyList,
                  );
                },
              ),

              20.verticalSpace,

              // 搜索结果 标题区域
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '搜索结果',
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Consumer<RecruitmentViewModel>(
                    builder: (context, vm, child) {
                      return Text(
                        '${vm.total} 个结果',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                ],
              ),

              20.verticalSpace,

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