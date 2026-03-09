// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/wish_career/salary_currency_type.dart';
import 'package:spark_hire_app/model/wish_career/salary_frequency_type.dart';

class SalaryInfo {
  final int? salaryUpper;
  final int? salaryLower;
  final SalaryCurrencyType? currencyType;
  final SalaryFrequencyType frequencyType;

  SalaryInfo({
    this.salaryUpper,
    this.salaryLower,
    this.currencyType,
    required this.frequencyType,
  });

  SalaryInfo copyWith({
    int? salaryUpper,
    int? salaryLower,
    SalaryCurrencyType? currencyType,
    SalaryFrequencyType? frequencyType,
  }) {
    return SalaryInfo(
      salaryUpper: salaryUpper ?? this.salaryUpper,
      salaryLower: salaryLower ?? this.salaryLower,
      currencyType: currencyType ?? this.currencyType,
      frequencyType: frequencyType ?? this.frequencyType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'salaryUpper': salaryUpper,
      'salaryLower': salaryLower,
      'currencyType': currencyType?.value,
      'frequencyType': frequencyType.value,
    };
  }

  factory SalaryInfo.fromMap(Map<String, dynamic> map) {
    return SalaryInfo(
      salaryUpper:
          map['salaryUpper'] != null ? map['salaryUpper'] as int : null,
      salaryLower:
          map['salaryLower'] != null ? map['salaryLower'] as int : null,
      currencyType:
          map['currencyType'] != null
              ? SalaryCurrencyTypeExt.fromInt(map['currencyType'])
              : null,
      frequencyType: SalaryFrequencyTypeExt.fromInt(map['frequencyType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SalaryInfo.fromJson(String source) =>
      SalaryInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SalaryInfo(salaryUpper: $salaryUpper, salaryLower: $salaryLower, currencyType: $currencyType, frequencyType: $frequencyType)';
  }

  @override
  bool operator ==(covariant SalaryInfo other) {
    if (identical(this, other)) return true;

    return other.salaryUpper == salaryUpper &&
        other.salaryLower == salaryLower &&
        other.currencyType == currencyType &&
        other.frequencyType == frequencyType;
  }

  @override
  int get hashCode {
    return salaryUpper.hashCode ^
        salaryLower.hashCode ^
        currencyType.hashCode ^
        frequencyType.hashCode;
  }
}
