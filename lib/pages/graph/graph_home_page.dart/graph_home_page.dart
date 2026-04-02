import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/custom_divider.dart';
import 'package:spark_hire_app/components/empty_state.dart';
import 'package:spark_hire_app/components/keyboard_wrapper.dart';
import 'package:spark_hire_app/pages/graph/graph_home_page.dart/components/career_info_card.dart';
import 'package:spark_hire_app/pages/graph/graph_home_page.dart/components/career_info_card_skeleton.dart';
import 'package:spark_hire_app/pages/graph/graph_home_page.dart/view_model/career_view_model.dart';

class GraphHomePage extends StatefulWidget {
  const GraphHomePage({super.key});

  @override
  State<GraphHomePage> createState() => _GraphHomePageState();
}

class _GraphHomePageState extends State<GraphHomePage> {
  late final CareerViewModel _viewModel;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _viewModel = CareerViewModel()..loadCareerInfoList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: KeyboardDismissWrapper(
        child: SafeArea(
          minimum: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. 页面大标题
              Text(
                'Explore Careers',
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
              ),

              20.verticalSpace,

              // 2. 搜索框
              _buildSearch(),

              20.verticalSpace,

              // 3. 结果列表
              Expanded(
                child: Consumer<CareerViewModel>(
                  builder: (context, vm, _) {
                    final list = vm.careerInfoList;

                    if (vm.isLoadingCareer) {
                      return CareerInfoCardSkeleton();
                    }

                    if (list.isEmpty) {
                      return EmptyState(title: "No careers found.");
                    }

                    return Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: list.length,
                        separatorBuilder:
                            (context, index) =>
                                CustomDivider(thickness: 0.5, height: 40.h),
                        itemBuilder:
                            (context, index) =>
                                CareerInfoCard(careerInfo: list[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return TextField(
      controller: _searchController,
      onChanged: (value) => _viewModel.filterCareers(value),
      decoration: InputDecoration(
        hintText: 'Search career name...',
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.outline,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.inverseSurface,
        contentPadding: EdgeInsets.symmetric(vertical: 0.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        suffixIcon:
            _searchController.text.isNotEmpty
                ? IconButton(
                  icon: const Icon(Icons.clear, size: 18),
                  onPressed: () {
                    _searchController.clear();
                    _viewModel.filterCareers('');
                  },
                )
                : null,
      ),
    );
  }
}
