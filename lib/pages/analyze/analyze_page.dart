import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/custom_button.dart';
import 'package:spark_hire_app/pages/analyze/components/analyze_chart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// todo
class AnalyzePage extends StatelessWidget {
  const AnalyzePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.analyzeText,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.calendar_month_outlined),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 36.h),
        child: CustomButton(
          textColor: Theme.of(context).colorScheme.onPrimary,
          btnWidth: double.infinity,
          btnHeight: 60.h,
          fontSize: 19.sp,
          icon: Icons.lock_outline_rounded,
          iconGap: 8.w,
          title: AppLocalizations.of(context)!.subscibeToUnlockText,
          borderRadius: 18.r,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDateHeader(),

              20.verticalSpace,

              _buildChartCard(context),

              const SizedBox(height: 30),

              _buildListHeader(context),

              const SizedBox(height: 16),

              Expanded(child: _buildViewerList()),
            ],
          ),
        ),
      ),
    );
  }

  /// 日期标题
  Widget _buildDateHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "星期一",
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        const SizedBox(height: 4),
        const Text(
          "2024年12月20日",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  /// 图表与数据卡片
  Widget _buildChartCard(BuildContext context) {
    return Column(
      children: [
        // 带有边框和圆角剪裁的图表容器
        Container(
          height: 160.h,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
            border: Border.all(color: Colors.grey.shade300, width: 0.8),
          ),
          child: const AnalyzeChart(),
        ),

        20.verticalSpace,

        // 底部数据栏
        Padding(
          padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 16),
          child: Row(
            children: [
              // 简历被查看次数
              Expanded(
                child: _buildDataColumn(
                  icon: Icons.person_outline,
                  iconColor: const Color(0xFFA6FF00), // 荧光绿
                  label: AppLocalizations.of(context)!.resumeViewsText,
                  value: "174",
                ),
              ),

              Container(width: 1, height: 40.h, color: Colors.grey.shade200),

              // 曝光次数统计
              Expanded(
                child: _buildDataColumn(
                  icon: Icons.trending_up,
                  iconColor: const Color(0xFF4A34A6), // 紫色
                  label: AppLocalizations.of(context)!.impressionText,
                  value: "2.3K",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 辅助方法：构建单个数据列
  Widget _buildDataColumn({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 18),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  /// 访客列表标题
  Widget _buildListHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${AppLocalizations.of(context)!.whoViewdText} (30)",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        // 查看全部
        GestureDetector(
          onTap: () {},
          child: Text(
            AppLocalizations.of(context)!.viewAllText,
            style: TextStyle(
              fontSize: 14.sp,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  /// 访客列表 (固定高度，带底部淡出模糊效果)
  Widget _buildViewerList() {
    // 模拟数据
    final viewers = [
      {"name": "李娜", "role": "软件工程师招聘", "avatar": "assets/avatar1.png"},
      {"name": "钱桂英", "role": "市场部经理", "avatar": "assets/avatar2.png"},
      {"name": "何天民", "role": "财务分析师", "avatar": "assets/avatar3.png"},
      {"name": "王艾米丽", "role": "人力资源总监", "avatar": "assets/avatar4.png"},
      {"name": "张三", "role": "产品经理", "avatar": "assets/avatar5.png"},
      {"name": "李四", "role": "测试工程师", "avatar": "assets/avatar6.png"},
    ];

    /// ShaderMask 给列表添加从下往上逐渐透明的遮罩
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.black, Colors.transparent],
          stops: [0.0, 0.5, 1.0],
        ).createShader(bounds);
      },
      blendMode: BlendMode.dstIn,
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: viewers.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final viewer = viewers[index];
          return Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.grey.shade200,
                child: Icon(Icons.person, color: Colors.grey.shade400),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    viewer["name"]!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    viewer["role"]!,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
