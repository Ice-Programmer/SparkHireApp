import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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

  String get currencyName {
    switch (this) {
      case SalaryCurrencyType.dollar:
        return "Dollar";
      case SalaryCurrencyType.cny:
        return "CNY";
      case SalaryCurrencyType.jpy:
        return "JPY";
      default:
        return "";
    }
  }

  Widget get flag {
    switch (this) {
      case SalaryCurrencyType.dollar:
        return _buildFlag("icons/flags/svg/us.svg");
      case SalaryCurrencyType.cny:
        return _buildFlag("icons/flags/svg/cn.svg");
      case SalaryCurrencyType.jpy:
        return _buildFlag("icons/flags/svg/jp.svg");
      case SalaryCurrencyType.unknown:
        return SizedBox.shrink();
    }
  }

  Widget _buildFlag(String flag) {
    return Container(
      width: 34.sp,
      height: 30.sp,
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(6),
      ),
      child: SvgPicture.asset(
        flag,
        package: "country_icons",
        fit: BoxFit.contain,
      ),
    );
  }
}
