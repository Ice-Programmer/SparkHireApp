// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/company/company_info.dart';

class FetchCompanyDetailInfoRequest {
  final int companyId;
  FetchCompanyDetailInfoRequest({required this.companyId});

  FetchCompanyDetailInfoRequest copyWith({int? companyId}) {
    return FetchCompanyDetailInfoRequest(
      companyId: companyId ?? this.companyId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'companyId': companyId};
  }

  factory FetchCompanyDetailInfoRequest.fromMap(Map<String, dynamic> map) {
    return FetchCompanyDetailInfoRequest(companyId: map['companyId'] as int);
  }

  String toJson() => json.encode(toMap());

  factory FetchCompanyDetailInfoRequest.fromJson(String source) =>
      FetchCompanyDetailInfoRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'FetchCompanyDetailInfoRequest(companyId: $companyId)';

  @override
  bool operator ==(covariant FetchCompanyDetailInfoRequest other) {
    if (identical(this, other)) return true;

    return other.companyId == companyId;
  }

  @override
  int get hashCode => companyId.hashCode;
}

class FetchCompanyDetailInfoResponse {
  final CompanyInfo? companyInfo;
  final BaseResp baseResp;
  FetchCompanyDetailInfoResponse({this.companyInfo, required this.baseResp});

  FetchCompanyDetailInfoResponse copyWith({
    CompanyInfo? companyInfo,
    BaseResp? baseResp,
  }) {
    return FetchCompanyDetailInfoResponse(
      companyInfo: companyInfo ?? this.companyInfo,
      baseResp: baseResp ?? this.baseResp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'companyInfo': companyInfo?.toMap(),
      'BaseResp': baseResp.toMap(),
    };
  }

  factory FetchCompanyDetailInfoResponse.fromMap(Map<String, dynamic> map) {
    return FetchCompanyDetailInfoResponse(
      companyInfo:
          map['companyInfo'] != null
              ? CompanyInfo.fromMap(map['companyInfo'] as Map<String, dynamic>)
              : null,
      baseResp: BaseResp.fromJson(map['BaseResp'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchCompanyDetailInfoResponse.fromJson(String source) =>
      FetchCompanyDetailInfoResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'FetchCompanyDetailInfoResponse(companyInfo: $companyInfo, baseResp: $baseResp)';

  @override
  bool operator ==(covariant FetchCompanyDetailInfoResponse other) {
    if (identical(this, other)) return true;

    return other.companyInfo == companyInfo && other.baseResp == baseResp;
  }

  @override
  int get hashCode => companyInfo.hashCode ^ baseResp.hashCode;

  bool get success => baseResp.success;
}
