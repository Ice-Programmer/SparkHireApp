enum SalaryFrequencyType { monthly, yearly, weekly, daily, hourly, unknown }

extension SalaryFrequencyTypeeExt on SalaryFrequencyType {
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
}
