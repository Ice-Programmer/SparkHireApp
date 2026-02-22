// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/common/base.dart';
import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/information/list_career.dart';
import 'package:spark_hire_app/model/wish_career/salary_currency_type.dart';
import 'package:spark_hire_app/model/wish_career/salary_frequency_type.dart';

class WishCareerInfo {
  final int id;
  final CareerInfo careerInfo;
  final int salaryUpper;
  final int salaryLower;
  final SalaryCurrencyType salaryCurrencyType;
  final SalaryFrequencyType frequencyType;

  WishCareerInfo({
    required this.id,
    required this.careerInfo,
    required this.salaryUpper,
    required this.salaryLower,
    required this.salaryCurrencyType,
    required this.frequencyType,
  });

  WishCareerInfo copyWith({
    int? id,
    CareerInfo? careerInfo,
    int? salaryUpper,
    int? salaryLower,
    SalaryCurrencyType? salaryCurrencyType,
    SalaryFrequencyType? frequencyType,
  }) {
    return WishCareerInfo(
      id: id ?? this.id,
      careerInfo: careerInfo ?? this.careerInfo,
      salaryUpper: salaryUpper ?? this.salaryUpper,
      salaryLower: salaryLower ?? this.salaryLower,
      salaryCurrencyType: salaryCurrencyType ?? this.salaryCurrencyType,
      frequencyType: frequencyType ?? this.frequencyType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'careerInfo': careerInfo.toJson(),
      'salaryUpper': salaryUpper,
      'salaryLower': salaryLower,
      'salaryCurrencyType': salaryCurrencyType.value,
      'frequencyType': frequencyType.value,
    };
  }

  factory WishCareerInfo.fromMap(Map<String, dynamic> map) {
    return WishCareerInfo(
      id: map['id'] as int,
      careerInfo: CareerInfo.fromJson(map['careerInfo']),
      salaryUpper: map['salaryUpper'] as int,
      salaryLower: map['salaryLower'] as int,
      salaryCurrencyType: SalaryCurrencyTypeExt.fromInt(
        map['salaryCurrencyType'],
      ),
      frequencyType: SalaryFrequencyTypeeExt.fromInt(map['frequencyType']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WishCareerInfo.fromJson(String source) =>
      WishCareerInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WishCareerInfo(id: $id, careerInfo: $careerInfo, salaryUpper: $salaryUpper, salaryLower: $salaryLower, salaryCurrencyType: $salaryCurrencyType, frequencyType: $frequencyType)';
  }

  @override
  bool operator ==(covariant WishCareerInfo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.careerInfo == careerInfo &&
        other.salaryUpper == salaryUpper &&
        other.salaryLower == salaryLower &&
        other.salaryCurrencyType == salaryCurrencyType &&
        other.frequencyType == frequencyType;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        careerInfo.hashCode ^
        salaryUpper.hashCode ^
        salaryLower.hashCode ^
        salaryCurrencyType.hashCode ^
        frequencyType.hashCode;
  }
}

class GetCurrentWishCareerRequest {
  final Base? base;

  const GetCurrentWishCareerRequest({this.base});

  Map<String, dynamic> toJson() => {'base': base?.toJson()};
}

class GetCurrentWishCareerResponse {
  final List<WishCareerInfo>? wishCareerList;
  final BaseResp baseResp;

  const GetCurrentWishCareerResponse({
    required this.wishCareerList,
    required this.baseResp,
  });

  bool get success => baseResp.success;

  factory GetCurrentWishCareerResponse.fromJson(Map<String, dynamic> json) {
    return GetCurrentWishCareerResponse(
      wishCareerList:
          (json["wishCareerList"] as List)
              .map((e) => WishCareerInfo.fromJson(e))
              .toList(),
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
