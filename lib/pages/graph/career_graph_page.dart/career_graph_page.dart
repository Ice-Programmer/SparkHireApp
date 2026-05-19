import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/model/information/list_career.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/components/edit_title.dart';
import 'package:spark_hire_app/pages/graph/career_graph_page.dart/components/career_analysis_header.dart';
import 'package:spark_hire_app/pages/graph/career_graph_page.dart/components/career_data_card.dart';
import 'package:spark_hire_app/pages/graph/career_graph_page.dart/components/career_radio_graph.dart';
import 'package:spark_hire_app/pages/graph/career_graph_page.dart/components/career_skill_graph.dart';
import 'package:spark_hire_app/pages/graph/career_graph_page.dart/view_model/career_graph_view_model.dart';

class CareerGraphPage extends StatefulWidget {
  final CareerInfo careerInfo;

  const CareerGraphPage({super.key, required this.careerInfo});

  @override
  State<CareerGraphPage> createState() => _CareerGraphPageState();
}

class _CareerGraphPageState extends State<CareerGraphPage> {
  final CareerGraphViewModel _viewModel = CareerGraphViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.fetchCareerRelativeSkillTags(careerId: widget.careerInfo.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditAppBar(
        titleName: AppLocalizations.of(context)!.careerAnalysis,
      ),
      body: ChangeNotifierProvider.value(
        value: _viewModel,
        child: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                4.verticalSpace,

                // 职业基础信息
                CareerAnalysisHeader(careerInfo: widget.careerInfo),

                20.verticalSpace,

                // 职位数据统计
                CareerDataCard(),

                20.verticalSpace,

                // career skill tag
                CareerSkillGraph(careerInfo: widget.careerInfo),

                20.verticalSpace,

                CareerRadioGraph(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
