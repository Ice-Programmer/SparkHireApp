import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum SalaryFrequencyType { monthly, yearly, weekly, daily, hourly, unknown }

extension SalaryFrequencyTypeExt on SalaryFrequencyType {
  static SalaryFrequencyType fromInt(int value) {
    switch (value) {
      case 1:
        return SalaryFrequencyType.monthly;
      case 2:
        return SalaryFrequencyType.yearly;
      case 3:
        return SalaryFrequencyType.weekly;
      case 4:
        return SalaryFrequencyType.daily;
      case 5:
        return SalaryFrequencyType.hourly;
      default:
        return SalaryFrequencyType.unknown;
    }
  }

  int get value {
    switch (this) {
      case SalaryFrequencyType.monthly:
        return 1;
      case SalaryFrequencyType.yearly:
        return 2;
      case SalaryFrequencyType.weekly:
        return 3;
      case SalaryFrequencyType.daily:
        return 4;
      case SalaryFrequencyType.hourly:
        return 5;
      default:
        return 0;
    }
  }

  String getText(BuildContext context) {
    switch (this) {
      case SalaryFrequencyType.monthly:
        return AppLocalizations.of(context)!.monthText;
      case SalaryFrequencyType.yearly:
        return AppLocalizations.of(context)!.yearlyText;
      case SalaryFrequencyType.weekly:
        return AppLocalizations.of(context)!.weeklyText;
      case SalaryFrequencyType.daily:
        return AppLocalizations.of(context)!.dailyText;
      case SalaryFrequencyType.hourly:
        return AppLocalizations.of(context)!.hourlyText;
      default:
        return "";
    }
  }
}
