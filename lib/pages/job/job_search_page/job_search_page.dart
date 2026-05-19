import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/custom_input.dart';
import 'package:spark_hire_app/components/edit_title.dart';
import 'package:spark_hire_app/components/keyboard_wrapper.dart';

class JobSearchPage extends StatelessWidget {
  const JobSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissWrapper(
      child: Scaffold(
        appBar: EditAppBar(titleName: "搜索", centerTitle: true),
        body: SafeArea(
          minimum: EdgeInsets.all(20.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 搜索框
                CustomInput(
                  height: 45.h,
                  backgroundColor: Theme.of(context).colorScheme.inverseSurface,
                  borderRadius: 25.r,
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.outline,
                      size: 23.sp,
                    ),
                  ),
                  hintText: "请输入关键词，例如：后端开发工程师",
                  hintColor: Theme.of(context).colorScheme.outline,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Icon(
                      Icons.tune,
                      color: Theme.of(context).colorScheme.outline,
                      size: 23.sp,
                    ),
                  ),
                ),

                20.verticalSpace,

                // 过滤标签 (所有工作, 全职, etc.)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildFilterChip('所有工作', isActive: true),
                      const SizedBox(width: 10),
                      _buildFilterChip('全职'),
                      const SizedBox(width: 10),
                      _buildFilterChip('兼职'),
                      const SizedBox(width: 10),
                      _buildFilterChip('自由职业者'),
                    ],
                  ),
                ),

                30.verticalSpace,

                // 搜索结果 标题区域
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '搜索结果',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '12个结果',
                      style: TextStyle(
                        color: Colors.deepPurple.shade700,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                20.verticalSpace,

                // 搜索结果 垂直列表
                Column(
                  children: [
                    _buildJobCard(
                      icon: Icons.language,
                      iconBgColor: Colors.blue.shade50,
                      iconColor: Colors.blue,
                      title: '平面设计师',
                      company: 'Webflow',
                      location: '上海, 黄浦区',
                      salary: '¥ 17000',
                    ),
                    const SizedBox(height: 16),
                    _buildJobCard(
                      icon: Icons.push_pin,
                      iconBgColor: Colors.red.shade50,
                      iconColor: Colors.red,
                      title: 'UI 设计师',
                      company: 'Pinterest',
                      location: '上海, 浦东新区',
                      salary: '¥ 20000',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 构建过滤标签
  Widget _buildFilterChip(String text, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isActive ? Colors.deepPurple.shade50 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.deepPurple.shade700 : Colors.grey.shade500,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          fontSize: 14,
        ),
      ),
    );
  }

  // 构建空缺职位卡片（横向）
  Widget _buildCompanyCard(
    IconData icon,
    Color bgColor,
    Color iconColor,
    String title,
    String subtitle,
  ) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
          ),
        ],
      ),
    );
  }

  // 构建工作详情卡片（竖向）
  Widget _buildJobCard({
    required IconData icon,
    required Color iconBgColor,
    required Color iconColor,
    required String title,
    required String company,
    required String location,
    required String salary,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      company,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.bookmark_border, color: Colors.grey.shade400),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey.shade500,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    location,
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    salary,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    ' / 月',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
