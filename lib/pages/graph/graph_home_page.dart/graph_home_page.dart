import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/custom_divider.dart';
import 'package:spark_hire_app/model/information/list_career.dart';
import 'package:spark_hire_app/pages/graph/graph_home_page.dart/components/career_info_card.dart';
import 'package:spark_hire_app/pages/graph/graph_home_page.dart/view_model/career_view_model.dart';

class GraphHomePage extends StatefulWidget {
  const GraphHomePage({super.key});

  @override
  State<GraphHomePage> createState() => _GraphHomePageState();
}

class _GraphHomePageState extends State<GraphHomePage> {
  // 1. 在 State 中持有 ViewModel，确保它在当前页面生命周期内只创建一次
  late final CareerViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CareerViewModel()..loadCareerInfoList();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Consumer<CareerViewModel>(
            builder: (context, vm, _) {
              return ListView.separated(
                padding: EdgeInsets.all(20.w),
                itemCount: vm.careerInfoList.length,
                separatorBuilder:
                    (context, index) =>
                        CustomDivider(thickness: 0.5, height: 40.h),
                itemBuilder:
                    (context, index) =>
                        CareerInfoCard(careerInfo: vm.careerInfoList[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
