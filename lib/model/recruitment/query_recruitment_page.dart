// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:spark_hire_app/model/candidate/education_status.dart';
import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/recruitment/job_type.dart';
import 'package:spark_hire_app/model/recruitment/recruitment_info.dart';

class RecuritmentCondition {
  final JobType? jobType;
  final EducationStatus? educationStatus;
  final int? salaryUpper;
  final int? salaryLower;
  final String? searchText;
  final int? companyId;
  final int? careerId;

  RecuritmentCondition({
    this.jobType,
    this.educationStatus,
    this.salaryUpper,
    this.salaryLower,
    this.searchText,
    this.companyId,
    this.careerId,
  });

  RecuritmentCondition copyWith({
    JobType? jobType,
    EducationStatus? educationStatus,
    int? salaryUpper,
    int? salaryLower,
    String? searchText,
    int? companyId,
    int? careerId,
  }) {
    return RecuritmentCondition(
      jobType: jobType ?? this.jobType,
      educationStatus: educationStatus ?? this.educationStatus,
      salaryUpper: salaryUpper ?? this.salaryUpper,
      salaryLower: salaryLower ?? this.salaryLower,
      searchText: searchText ?? this.searchText,
      companyId: companyId ?? this.companyId,
      careerId: careerId ?? this.careerId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobType': jobType?.value,
      'educationStatus': educationStatus?.value,
      'salaryUpper': salaryUpper,
      'salaryLower': salaryLower,
      'searchText': searchText,
      'companyId': companyId,
      'careerId': careerId,
    };
  }

  factory RecuritmentCondition.fromMap(Map<String, dynamic> map) {
    return RecuritmentCondition(
      jobType:
          map['jobType'] != null ? JobTypeExt.fromInt(map['jobType']) : null,
      educationStatus:
          map['educationStatus'] != null
              ? EducationStatusExt.fromInt(map['educationStatus'])
              : null,
      salaryUpper:
          map['salaryUpper'] != null ? map['salaryUpper'] as int : null,
      salaryLower:
          map['salaryLower'] != null ? map['salaryLower'] as int : null,
      searchText:
          map['searchText'] != null ? map['searchText'] as String : null,
      companyId: map['companyId'] != null ? map['companyId'] as int : null,
      careerId: map['careerId'] != null ? map['careerId'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecuritmentCondition.fromJson(String source) =>
      RecuritmentCondition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RecuritmentCondition(jobType: $jobType, educationStatus: $educationStatus, salaryUpper: $salaryUpper, salaryLower: $salaryLower, searchText: $searchText, companyId: $companyId, careerId: $careerId)';
  }

  @override
  bool operator ==(covariant RecuritmentCondition other) {
    if (identical(this, other)) return true;

    return other.jobType == jobType &&
        other.educationStatus == educationStatus &&
        other.salaryUpper == salaryUpper &&
        other.salaryLower == salaryLower &&
        other.searchText == searchText &&
        other.companyId == companyId &&
        other.careerId == careerId;
  }

  @override
  int get hashCode {
    return jobType.hashCode ^
        educationStatus.hashCode ^
        salaryUpper.hashCode ^
        salaryLower.hashCode ^
        searchText.hashCode ^
        companyId.hashCode ^
        careerId.hashCode;
  }
}

class QueryRecruitmentPageRequest {
  final RecuritmentCondition? condition;
  final int? pageSize;
  final int? pageNum;

  QueryRecruitmentPageRequest({this.condition, this.pageSize, this.pageNum});

  QueryRecruitmentPageRequest copyWith({
    RecuritmentCondition? condition,
    int? pageSize,
    int? pageNum,
  }) {
    return QueryRecruitmentPageRequest(
      condition: condition ?? this.condition,
      pageSize: pageSize ?? this.pageSize,
      pageNum: pageNum ?? this.pageNum,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'condition': condition?.toMap(),
      'pageSize': pageSize,
      'pageNum': pageNum,
    };
  }

  factory QueryRecruitmentPageRequest.fromMap(Map<String, dynamic> map) {
    return QueryRecruitmentPageRequest(
      condition:
          map['condition'] != null
              ? RecuritmentCondition.fromMap(
                map['condition'] as Map<String, dynamic>,
              )
              : null,
      pageSize: map['pageSize'] != null ? map['pageSize'] as int : null,
      pageNum: map['pageNum'] != null ? map['pageNum'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory QueryRecruitmentPageRequest.fromJson(String source) =>
      QueryRecruitmentPageRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'QueryRecruitmentPageRequest(condition: $condition, pageSize: $pageSize, pageNum: $pageNum)';

  @override
  bool operator ==(covariant QueryRecruitmentPageRequest other) {
    if (identical(this, other)) return true;

    return other.condition == condition &&
        other.pageSize == pageSize &&
        other.pageNum == pageNum;
  }

  @override
  int get hashCode => condition.hashCode ^ pageSize.hashCode ^ pageNum.hashCode;
}

class QueryRecruitmentPageResponse {
  final List<RecruitmentInfo>? recruitmentList;
  final int? total;
  final BaseResp baseResp;

  QueryRecruitmentPageResponse({
    this.recruitmentList,
    this.total,
    required this.baseResp,
  });

  QueryRecruitmentPageResponse copyWith({
    List<RecruitmentInfo>? recruitmentList,
    int? total,
    BaseResp? baseResp,
  }) {
    return QueryRecruitmentPageResponse(
      recruitmentList: recruitmentList ?? this.recruitmentList,
      total: total ?? this.total,
      baseResp: baseResp ?? this.baseResp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'recruitmentList': recruitmentList?.map((x) => x.toMap()).toList(),
      'total': total,
      'BaseResp': baseResp.toMap(),
    };
  }

  factory QueryRecruitmentPageResponse.fromMap(Map<String, dynamic> map) {
    return QueryRecruitmentPageResponse(
      recruitmentList:
          map['recruitmentList'] != null
              ? List<RecruitmentInfo>.from(
                (map['recruitmentList']).map<RecruitmentInfo?>(
                  (x) => RecruitmentInfo.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      total: map['total'] != null ? map['total'] as int : null,
      baseResp: BaseResp.fromJson(map['BaseResp'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory QueryRecruitmentPageResponse.fromJson(String source) =>
      QueryRecruitmentPageResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'QueryRecruitmentPageResponse(recruitmentList: $recruitmentList, total: $total, baseResp: $baseResp)';

  @override
  bool operator ==(covariant QueryRecruitmentPageResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.recruitmentList, recruitmentList) &&
        other.total == total &&
        other.baseResp == baseResp;
  }

  @override
  int get hashCode =>
      recruitmentList.hashCode ^ total.hashCode ^ baseResp.hashCode;

  bool get success => baseResp.success;
}
