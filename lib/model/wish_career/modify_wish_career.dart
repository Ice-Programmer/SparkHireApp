// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/wish_career/salary_currency_type.dart';
import 'package:spark_hire_app/model/wish_career/salary_frequency_type.dart';

class ModifyWishCareerRequest {
  final int? id;
  final int careerId;
  final int salaryUpper;
  final int salaryLower;
  final SalaryCurrencyType currencyType;
  final SalaryFrequencyType frequencyType;

  ModifyWishCareerRequest({
    this.id,
    required this.careerId,
    required this.salaryUpper,
    required this.salaryLower,
    required this.currencyType,
    required this.frequencyType,
  });

  ModifyWishCareerRequest copyWith({
    int? id,
    int? careerId,
    int? salaryUpper,
    int? salaryLower,
    SalaryCurrencyType? currencyType,
    SalaryFrequencyType? frequencyType,
  }) {
    return ModifyWishCareerRequest(
      id: id ?? this.id,
      careerId: careerId ?? this.careerId,
      salaryUpper: salaryUpper ?? this.salaryUpper,
      salaryLower: salaryLower ?? this.salaryLower,
      currencyType: currencyType ?? this.currencyType,
      frequencyType: frequencyType ?? this.frequencyType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'careerId': careerId,
      'salaryUpper': salaryUpper,
      'salaryLower': salaryLower,
      'currencyType': currencyType.value,
      'frequencyType': frequencyType.value,
    };
  }

  factory ModifyWishCareerRequest.fromMap(Map<String, dynamic> map) {
    return ModifyWishCareerRequest(
      id: map['id'] != null ? map['id'] as int : null,
      careerId: map['careerId'] as int,
      salaryUpper: map['salaryUpper'] as int,
      salaryLower: map['salaryLower'] as int,
      currencyType: SalaryCurrencyTypeExt.fromInt(map['currencyType']),
      frequencyType: SalaryFrequencyTypeExt.fromInt(map['frequencyType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ModifyWishCareerRequest.fromJson(String source) =>
      ModifyWishCareerRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return 'ModifyWishCareerRequest(id: $id, careerId: $careerId, salaryUpper: $salaryUpper, salaryLower: $salaryLower, currencyType: $currencyType, frequencyType: $frequencyType)';
  }

  @override
  bool operator ==(covariant ModifyWishCareerRequest other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.careerId == careerId &&
        other.salaryUpper == salaryUpper &&
        other.salaryLower == salaryLower &&
        other.currencyType == currencyType &&
        other.frequencyType == frequencyType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        careerId.hashCode ^
        salaryUpper.hashCode ^
        salaryLower.hashCode ^
        currencyType.hashCode ^
        frequencyType.hashCode;
  }

  bool validate() {
    if (salaryLower != 0 && salaryUpper != 0 && salaryLower >= salaryUpper) {
      return false;
    }

    return true;
  }
}

class ModifyWishCareerResponse {
  final BaseResp baseResp;

  const ModifyWishCareerResponse({required this.baseResp});

  bool get success => baseResp.success;

  factory ModifyWishCareerResponse.fromJson(Map<String, dynamic> json) {
    return ModifyWishCareerResponse(
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
