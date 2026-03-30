// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/company/benefit.dart';

class FetchCompanyBenefitsRequest {
  final int companyId;
  FetchCompanyBenefitsRequest({required this.companyId});

  FetchCompanyBenefitsRequest copyWith({int? companyId}) {
    return FetchCompanyBenefitsRequest(companyId: companyId ?? this.companyId);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'companyId': companyId};
  }

  factory FetchCompanyBenefitsRequest.fromMap(Map<String, dynamic> map) {
    return FetchCompanyBenefitsRequest(companyId: map['id'] as int);
  }

  String toJson() => json.encode(toMap());

  factory FetchCompanyBenefitsRequest.fromJson(String source) =>
      FetchCompanyBenefitsRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'FetchCompanyBenefitRequest(companyId: $companyId)';

  @override
  bool operator ==(covariant FetchCompanyBenefitsRequest other) {
    if (identical(this, other)) return true;

    return other.companyId == companyId;
  }

  @override
  int get hashCode => companyId.hashCode;
}

class FetchCompanyBenefitsResponse {
  final List<BenefitInfo> benefitList;
  final BaseResp baseResp;
  FetchCompanyBenefitsResponse({
    required this.benefitList,
    required this.baseResp,
  });

  FetchCompanyBenefitsResponse copyWith({
    List<BenefitInfo>? benefitList,
    BaseResp? baseResp,
  }) {
    return FetchCompanyBenefitsResponse(
      benefitList: benefitList ?? this.benefitList,
      baseResp: baseResp ?? this.baseResp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'benefitList': benefitList.map((x) => x.toMap()).toList(),
      'BaseResp': baseResp.toMap(),
    };
  }

  factory FetchCompanyBenefitsResponse.fromMap(Map<String, dynamic> map) {
    return FetchCompanyBenefitsResponse(
      benefitList: List<BenefitInfo>.from(
        (map['benefitList']).map<BenefitInfo>(
          (x) => BenefitInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
      baseResp: BaseResp.fromJson(map['BaseResp'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchCompanyBenefitsResponse.fromJson(String source) =>
      FetchCompanyBenefitsResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'FetchCompanyBenefitResponse(benefitList: $benefitList, baseResp: $baseResp)';

  @override
  bool operator ==(covariant FetchCompanyBenefitsResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.benefitList, benefitList) &&
        other.baseResp == baseResp;
  }

  @override
  int get hashCode => benefitList.hashCode ^ baseResp.hashCode;

  bool get success => baseResp.success;
}
