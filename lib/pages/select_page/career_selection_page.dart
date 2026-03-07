import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/model/information/list_career.dart';
import 'package:spark_hire_app/service/information_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CareerCategory {
  final String name;
  final List<CareerInfo> jobs;
  CareerCategory({required this.name, required this.jobs});
}

class JobSelectionPage extends StatefulWidget {
  const JobSelectionPage({super.key});

  @override
  State<JobSelectionPage> createState() => _JobSelectionPageState();
}

class _JobSelectionPageState extends State<JobSelectionPage> {
  final InformationService _informationService = InformationService();
  final Color textGreyColor = const Color(0xFF999999);

  // --- 状态变量 ---
  List<CareerCategory> _careerCategories = [];
  bool _isLoading = true;
  int _selectedCategoryIndex = 0;
  int? _selectedJobId;
  String _selectedJobName = "";

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final result = await _informationService.listCareerInfo(
        ListCareerInfoRequest(),
      );
      final groupedMap = groupBy(
        result.careerList,
        (CareerInfo info) => info.careerTypeName,
      );

      final uiList =
          groupedMap.entries.map((entry) {
            return CareerCategory(name: entry.key, jobs: entry.value);
          }).toList();

      if (!mounted) return;
      setState(() {
        _careerCategories = uiList;
        _isLoading = false;
        if (_careerCategories.isNotEmpty) {
          _selectedCategoryIndex = 0;
        }
      });
    } catch (e) {
      if (mounted) setState(() => _isLoading = false);
      ToastUtils.showErrorMsg('获取职位列表失败');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color sideBgColor = Theme.of(context).colorScheme.inverseSurface;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20.sp),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child:
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        "${AppLocalizations.of(context)!.selectJobTitleText} $_selectedJobName",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    16.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: _buildSearchBar(sideBgColor),
                    ),
                    20.verticalSpace,
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLeftNav(sideBgColor),

                          _buildRightContent(sideBgColor),
                        ],
                      ),
                    ),
                  ],
                ),
      ),
      bottomNavigationBar: _buildBottomBtn(),
    );
  }

  /// 搜索框：恢复灰底
  Widget _buildSearchBar(Color bgColor) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          Icon(Icons.search, color: textGreyColor, size: 20.sp),
          8.horizontalSpace,
          Text(
            '搜索职位名称',
            style: TextStyle(color: textGreyColor, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }

  /// 左侧导航：恢复选中态连通样式
  Widget _buildLeftNav(Color bgColor) {
    return SizedBox(
      width: 105.w,
      child: ListView.builder(
        itemCount: _careerCategories.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedCategoryIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedCategoryIndex = index),
            child: Container(
              height: 56.h,
              color: isSelected ? bgColor : null,
              child: Row(
                children: [
                  Container(
                    width: 4.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(2.r),
                      ),
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Text(
                      _careerCategories[index].name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.normal,
                        color:
                            isSelected
                                ? Theme.of(context).colorScheme.primary
                                : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRightContent(Color bgColor) {
    if (_careerCategories.isEmpty) return const SizedBox();
    final jobs = _careerCategories[_selectedCategoryIndex].jobs;

    return Expanded(
      child: Container(
        color: bgColor, // 灰底
        child: ListView.builder(
          padding: EdgeInsets.fromLTRB(12.w, 8.h, 16.w, 20.h),
          itemCount: jobs.length,
          itemBuilder: (context, index) {
            final job = jobs[index];
            final isSelected = _selectedJobId == job.id;
            return _buildCareerInfoCard(job, isSelected);
          },
        ),
      ),
    );
  }

  Widget _buildCareerInfoCard(CareerInfo job, bool isSelected) {
    return GestureDetector(
      onTap:
          () => setState(() {
            _selectedJobId = job.id;
            _selectedJobName = job.careerName;
          }),
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color:
                      isSelected
                          ? Theme.of(context).colorScheme.primary
                          : const Color(0xFFD3D3D3),
                  size: 20.sp,
                ),

                8.horizontalSpace,

                Text(
                  job.careerName,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            8.verticalSpace,

            Row(
              children: [
                28.horizontalSpace,

                Expanded(
                  child: Text(
                    job.description,
                    style: TextStyle(fontSize: 13.sp, color: textGreyColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: textGreyColor,
                  size: 12.sp,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBtn() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20.w,
        12.h,
        20.w,
        MediaQuery.of(context).padding.bottom + 12.h,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          minimumSize: Size(double.infinity, 48.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          elevation: 0,
        ),
        onPressed:
            _selectedJobId == null
                ? null
                : () {
                  final selectedJob = _careerCategories[_selectedCategoryIndex]
                      .jobs
                      .firstWhere((e) => e.id == _selectedJobId);
                  Navigator.pop(context, selectedJob);
                },
        child: Text(
          AppLocalizations.of(context)!.save,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
