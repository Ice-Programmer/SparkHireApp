import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/pages/schedule/schedule_page/components/calendar_strip.dart';
import 'package:spark_hire_app/pages/schedule/schedule_page/components/interview_card.dart';
import 'package:spark_hire_app/components/sliding_toggle.dart';
import 'package:spark_hire_app/pages/schedule/schedule_page/view_model/interview_view_model.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  int _selectedDayIndex = 3;
  int _statusIndex = 0; // 0 代表进行中，1 代表历史

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => InterviewViewModel()..fetchInterviews(),
      builder: (_, _) => _buildBodyUI(),
    );
  }

  Widget _buildBodyUI() {
    return SafeArea(
      minimum: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "我的面试",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),

            10.verticalSpace,

            // 日期选择条
            CalendarStrip(
              selectedIndex: _selectedDayIndex,
              onDaySelected: (index, selectedDate) {
                setState(() {
                  _selectedDayIndex = index;
                });
              },
            ),

            20.verticalSpace,

            // 状态切换卡
            SlidingToggle(
              options: const ["进行中", "历史"],
              selectedIndex: _statusIndex,
              onChange: (index) {
                setState(() {
                  _statusIndex = index;
                });
              },
            ),

            20.verticalSpace,

            // 面试卡片 先 mock
            Consumer<InterviewViewModel>(
              builder: (context, vm, child) => _buildInterviewList(vm),
            ),

            100.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildInterviewList(InterviewViewModel vm) {
    if (vm.isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (vm.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Text(
            "暂无面试安排",
            style: TextStyle(color: Colors.grey, fontSize: 14.sp),
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: vm.interviewList.length,
      separatorBuilder: (context, index) => 20.verticalSpace,
      itemBuilder: (context, index) {
        return InterviewCard(interviewInfo: vm.interviewList[index]);
      },
    );
  }
}
