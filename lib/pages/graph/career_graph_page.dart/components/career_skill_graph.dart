import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/custom_know_graph.dart';
import 'package:spark_hire_app/model/information/list_career.dart';
import 'package:spark_hire_app/pages/graph/career_graph_page.dart/view_model/career_graph_view_model.dart';
import 'package:spark_hire_app/theme/semantic_theme.dart';

class CareerSkillGraph extends StatelessWidget {
  final CareerInfo careerInfo;
  const CareerSkillGraph({super.key, required this.careerInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 技能图谱
        Text(
          "技能图谱",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),

        10.verticalSpace,

        Consumer<CareerGraphViewModel>(
          builder: (context, vm, child) {
            if (vm.isLoadingTagList) {
              return Placeholder();
            }
            if (vm.skillTagList.isEmpty) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                height: 200.h,
                child: Center(
                  child: Text(
                    "暂无信息",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              );
            }

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              height: 200.h,
              child: CustomKnowGraph(
                borderRadius: 20.r,
                nodeColor: Theme.of(context).semantic.success,
                rootColor: Theme.of(context).colorScheme.primary,
                nodeList:
                    vm.skillTagList.map((tag) => tag.tagName).toSet().toList(),
                rootNode: careerInfo.careerName,
                edgeColor: Theme.of(context).colorScheme.outline,
              ),
            );
          },
        ),
      ],
    );
  }
}
