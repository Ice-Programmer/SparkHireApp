import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/pages/schedule/schedule_page/components/calendar_strip.dart';
import 'package:spark_hire_app/pages/schedule/schedule_page/components/interview_card.dart';
import 'package:spark_hire_app/components/sliding_toggle.dart';

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
            Column(
              children: [
                InterviewCard(
                  logoUrl:
                      'https://cdn-icons-png.flaticon.com/512/145/145808.png',
                  company: 'Pinterest',
                  position: '用户界面设计师',
                  date: '2024-12-20',
                  time: '上午 11:00',
                  type: '视频面试',
                ),

                20.verticalSpace,

                InterviewCard(
                  logoUrl:
                      'https://cdn-icons-png.flaticon.com/512/732/732252.png',
                  company: 'Webflow',
                  position: '平面设计师',
                  date: '2024-12-20',
                  time: '上午 11:00',
                  type: '视频面试',
                ),
              ],
            ),

            100.verticalSpace,
          ],
        ),
      ),
    );
  }
}
