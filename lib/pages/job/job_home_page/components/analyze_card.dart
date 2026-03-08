import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spark_hire_app/common/assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// todo 后端联调
class AnalysisDataCard extends StatelessWidget {
  final VoidCallback? onTap;

  const AnalysisDataCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    const neonGreen = Color(0xFFA6FF00);

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                Assets.assetsImageJobAnalyzeCardBg,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 分析
                      Text(
                        AppLocalizations.of(context)!.analyzeText,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 16.sp,
                        ),
                      ),

                      Row(
                        children: [
                          // 这一周
                          Text(
                            AppLocalizations.of(context)!.thisWeekText,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 14.sp,
                            ),
                          ),

                          4.horizontalSpace,

                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Theme.of(context).colorScheme.onPrimary,
                            size: 20,
                          ),
                        ],
                      ),
                    ],
                  ),

                  24.verticalSpace,

                  // --- 底部栏：核心数据展示 ---
                  Row(
                    children: [
                      // 简历查看次数
                      Expanded(
                        child: _buildDataColumn(
                          icon: Icons.person_outline_rounded,
                          value: "174",
                          label: AppLocalizations.of(context)!.resumeViewsText,
                          iconColor: neonGreen,
                          valueColor: neonGreen,
                          labelColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),

                      // 曝光次数
                      Expanded(
                        child: _buildDataColumn(
                          icon: Icons.trending_up_rounded,
                          value: "2.3K",
                          label: AppLocalizations.of(context)!.impressionText,
                          iconColor: neonGreen,
                          valueColor: neonGreen,
                          labelColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),

                      // ➡️
                      Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataColumn({
    required IconData icon,
    required String value,
    required String label,
    required Color iconColor,
    required Color valueColor,
    required Color labelColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 28),
            const SizedBox(width: 8),
            Text(
              value,
              style: TextStyle(
                color: valueColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 1.1,
              ),
            ),
          ],
        ),

        6.verticalSpace,

        Text(label, style: TextStyle(color: labelColor, fontSize: 13.sp)),
      ],
    );
  }
}
