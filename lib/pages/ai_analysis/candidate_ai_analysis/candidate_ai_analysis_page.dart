import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/model/candidate/optimize_resume.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';
import 'package:spark_hire_app/pages/ai_analysis/candidate_ai_analysis/components/candidate_info_card.dart';
import 'package:spark_hire_app/pages/ai_analysis/candidate_ai_analysis/components/overview_card_content.dart';
import 'package:spark_hire_app/pages/ai_analysis/candidate_ai_analysis/components/score_card.dart';
import 'package:spark_hire_app/pages/ai_analysis/candidate_ai_analysis/components/suggestion_card_content.dart';
import 'package:spark_hire_app/pages/ai_analysis/candidate_ai_analysis/components/title_app_bar.dart';
import 'package:spark_hire_app/pages/ai_analysis/candidate_ai_analysis/view_model/candidate_analysis_view_model.dart';

class CandidateAiAnalysisPage extends StatefulWidget {
  final UserBasicInfo userBasicInfo;
  const CandidateAiAnalysisPage({super.key, required this.userBasicInfo});

  @override
  State<CandidateAiAnalysisPage> createState() =>
      _CandidateAiAnalysisPageState();
}

class _CandidateAiAnalysisPageState extends State<CandidateAiAnalysisPage> {
  final CandidateAnalysisViewModel _viewModel = CandidateAnalysisViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.loadCandidateAiAnalysis();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(),
      body: ChangeNotifierProvider.value(
        value: _viewModel,
        child: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// AI Banner
                Selector<CandidateAnalysisViewModel, bool>(
                  selector: (_, vm) => vm.isLoading,
                  builder: (_, isLoading, __) {
                    return CandidateInfoCard(
                      userBasicInfo: widget.userBasicInfo,
                      isLoading: isLoading,
                    );
                  },
                ),

                10.verticalSpace,

                /// 综合评分
                Selector<CandidateAnalysisViewModel, OptimizeResumeResult?>(
                  selector: (_, vm) => vm.optimizeResumeResult,
                  builder: (_, result, __) {
                    return ScoreCard(result: result);
                  },
                ),

                10.verticalSpace,

                /// 概览
                Selector<CandidateAnalysisViewModel, OptimizeResumeResult?>(
                  selector: (_, vm) => vm.optimizeResumeResult,
                  builder: (_, result, __) {
                    return OverviewCardContent(result: result);
                  },
                ),

                20.verticalSpace,

                Selector<CandidateAnalysisViewModel, OptimizeResumeResult?>(
                  selector: (_, vm) => vm.optimizeResumeResult,
                  builder: (_, result, __) {
                    return SuggestionCardContent(result: result);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
