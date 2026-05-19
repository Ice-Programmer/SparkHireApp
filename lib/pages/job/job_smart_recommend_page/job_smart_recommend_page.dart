import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/edit_title.dart';
import 'package:spark_hire_app/pages/job/job_smart_recommend_page/components/recommend_recruitment_card.dart';
import 'package:spark_hire_app/pages/job/job_smart_recommend_page/components/resume_optimize_card.dart';
import 'package:spark_hire_app/pages/job/job_smart_recommend_page/components/title_card.dart';
import 'package:spark_hire_app/pages/job/job_smart_recommend_page/view_model/recommend_recrutiment_view_model.dart';

class JobSmartRecommendPage extends StatefulWidget {
  const JobSmartRecommendPage({super.key});

  @override
  State<JobSmartRecommendPage> createState() => _JobSmartRecommendPageState();
}

class _JobSmartRecommendPageState extends State<JobSmartRecommendPage> {
  final RecommendRecrutimentViewModel _viewModel =
      RecommendRecrutimentViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.loadRecommendRecruitmentResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditAppBar(titleName: "智能推荐", centerTitle: true),
      body: ChangeNotifierProvider.value(
        value: _viewModel,
        // 1. 使用 Consumer 来获取 ViewModel 中的动态数据
        child: Consumer<RecommendRecrutimentViewModel>(
          builder: (context, viewModel, child) {
            // 获取推荐列表数据，如果为 null 则给个空列表
            final recommendations =
                viewModel.recommendRecruitmentResult?.recommendations ?? [];

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  /// banner (保持不变)
                  const RecommendRecruitmentTitleCard(),

                  24.verticalSpace,

                  /// title
                  Row(
                    children: [
                      Text(
                        "为你推荐的职业方向",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      // 2. 动态显示推荐总数
                      Text(
                        "共 ${recommendations.length} 个推荐方向",
                        style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                      ),
                    ],
                  ),

                  18.verticalSpace,

                  // 3. 根据加载状态显示不同 UI
                  if (viewModel.isLoading)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else if (recommendations.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: Text("暂无推荐方向"),
                      ),
                    )
                  else
                    // 4. 动态遍历列表渲染 Card
                    ...recommendations.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;

                      // 将索引转换为 "01", "02" 格式
                      final indexStr = (index + 1).toString().padLeft(2, '0');

                      return Padding(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: RecommendRecruitmentCard(
                          index: indexStr,
                          title: item.title,
                          match: "${item.matchScore}%",
                          reason: item.reason,
                          tags: item.tags,
                        ),
                      );
                    }),

                  20.verticalSpace,

                  /// bottom card
                  ResumeOptimizeCard(),

                  30.verticalSpace,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
