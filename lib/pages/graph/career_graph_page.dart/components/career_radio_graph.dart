import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// todo 做成动态的
class CareerRadioGraph extends StatelessWidget {
  const CareerRadioGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4.w,
              height: 18.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            8.horizontalSpace,

            Text(
              "技能图谱分析",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),

        16.verticalSpace,

        Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
          child: AspectRatio(
            aspectRatio: 1.2,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
              child: RadarChart(
                RadarChartData(
                  radarBackgroundColor: Colors.transparent,
                  borderData: FlBorderData(show: false),
                  radarBorderData: const BorderSide(color: Colors.transparent),
                  // 调整标题偏移，避免重叠
                  titlePositionPercentageOffset: 0.2,
                  titleTextStyle: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.7),
                  ),
                  getTitle: (index, angle) {
                    final labels = [
                      '专业技能',
                      '逻辑分析',
                      '沟通协作',
                      '执行效率',
                      '创新学习',
                      '自驱动力',
                    ];
                    return RadarChartTitle(text: labels[index]);
                  },
                  tickCount: 4,
                  ticksTextStyle: const TextStyle(color: Colors.transparent),
                  // 优化网格线：使用浅色虚线感
                  tickBorderData: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.outlineVariant.withValues(alpha: 0.4),
                    width: 1,
                  ),
                  gridBorderData: BorderSide(
                    color: Theme.of(
                      context,
                    ).colorScheme.outlineVariant.withValues(alpha: 0.4),
                    width: 1,
                  ),
                  dataSets: [_buildDataSet(context)],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  RadarDataSet _buildDataSet(BuildContext context) {
    return RadarDataSet(
      fillColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
      borderColor: Theme.of(context).colorScheme.primary,
      entryRadius: 4.r,
      borderWidth: 2.5,
      dataEntries: [
        const RadarEntry(value: 85),
        const RadarEntry(value: 65),
        const RadarEntry(value: 90),
        const RadarEntry(value: 80),
        const RadarEntry(value: 85),
        const RadarEntry(value: 70),
      ],
    );
  }
}
