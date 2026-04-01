import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/model/information/list_career.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/components/edit_title.dart';
import 'package:spark_hire_app/pages/graph/career_graph_page.dart/components/career_analysis_header.dart';
import 'package:spark_hire_app/pages/graph/career_graph_page.dart/components/career_data_card.dart';

class CareerGraphPage extends StatefulWidget {
  final CareerInfo careerInfo;

  const CareerGraphPage({super.key, required this.careerInfo});

  @override
  State<CareerGraphPage> createState() => _CareerGraphPageState();
}

class _CareerGraphPageState extends State<CareerGraphPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditAppBar(
        context: context,
        titleName: AppLocalizations.of(context)!.careerAnalysis,
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              4.verticalSpace,

              // 职业基础信息
              CareerAnalysisHeader(careerInfo: widget.careerInfo),

              20.verticalSpace,

              // 职位数据统计
              CareerDataCard(),
            ],
          ),
        ),
      ),
    );
  }
}
