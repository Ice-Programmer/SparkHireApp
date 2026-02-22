enum SalaryCurrencyType { dollar, cny, jpy, unknown }

extension SalaryCurrencyTypeExt on SalaryCurrencyType {
  static SalaryCurrencyType fromInt(int value) {
    switch (value) {
      case 1:
        return SalaryCurrencyType.dollar;
      case 2:
        return SalaryCurrencyType.cny;
      case 3:
        return SalaryCurrencyType.jpy;
      default:
        return SalaryCurrencyType.unknown;
    }
  }

  int get value {
    switch (this) {
      case SalaryCurrencyType.dollar:
        return 1;
      case SalaryCurrencyType.cny:
        return 2;
      case SalaryCurrencyType.jpy:
        return 3;
      default:
        return 0;
    }
  }

  String get symbol {
    switch (this) {
      case SalaryCurrencyType.dollar:
        return "\$";
      case SalaryCurrencyType.cny:
        return "¥";
      case SalaryCurrencyType.jpy:
        return "¥";
      default:
        return "";
    }
  }
}
