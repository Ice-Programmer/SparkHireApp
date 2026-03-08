import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// todo
class AnalyzeChart extends StatelessWidget {
  const AnalyzeChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false), // 隐藏网格线，让画面更干净
          titlesData: FlTitlesData(show: false), // 隐藏坐标轴刻度
          borderData: FlBorderData(show: false), // 隐藏边框
          lineTouchData: LineTouchData(enabled: false), // 禁用点击反馈
          lineBarsData: [
            // 简历查看次数
            _buildLineData(
              points: [
                const FlSpot(0, 3),
                const FlSpot(2, 5),
                const FlSpot(4, 3),
                const FlSpot(6, 6),
              ],
              lineColor: const Color(0xFFA6FF00),
            ),
            // 曝光次数
            _buildLineData(
              points: [
                const FlSpot(0, 2),
                const FlSpot(3, 4),
                const FlSpot(5, 2),
                const FlSpot(6, 5),
              ],
              lineColor: const Color(0xFF4A34A6),
            ),
          ],
        ),
      ),
    );
  }

  LineChartBarData _buildLineData({
    required List<FlSpot> points,
    required Color lineColor,
  }) {
    return LineChartBarData(
      spots: points,
      isCurved: true, // 开启平滑曲线
      color: lineColor,
      barWidth: 3,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: true, // 显示填充效果
        color: lineColor.withValues(alpha: 0.2)
      ),
    );
  }
}
