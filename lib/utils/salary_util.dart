import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/wish_career/salary_currency_type.dart';
import 'package:spark_hire_app/model/wish_career/salary_info.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SalaryUtil {
  static String formatSalary(int value) {
    if (value >= 1000_00) {
      return '${(value / 10000).toStringAsFixed(value % 10000 == 0 ? 0 : 1)}w';
    }
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(value % 1000 == 0 ? 0 : 1)}k';
    }
    return value.toString();
  }


  static String buildSalaryRangeText(BuildContext context, SalaryInfo salaryInfo) {
    final l10n = AppLocalizations.of(context)!;
    final lower = salaryInfo.salaryLower;
    final upper = salaryInfo.salaryUpper;
    final symbol = salaryInfo.currencyType?.symbol ?? "\$";

    // 1. 全为0的情况：面议
    if (lower == 0 && upper == 0) return l10n.salaryNegotiableText;

    // 2. 格式化数字（如 4000 -> 4k）
    final sLower = SalaryUtil.formatSalary(lower ?? 0);
    final sUpper = SalaryUtil.formatSalary(upper ?? 0);

    // 3. 构建区间
    if (lower == 0) return '$symbol$sUpper ${l10n.belowText}';
    if (upper == 0) return '$symbol$sLower+';

    return '$symbol$sLower-$sUpper';
  }
}

