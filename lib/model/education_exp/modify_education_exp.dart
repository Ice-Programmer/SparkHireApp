// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/candidate/education_status.dart';
import 'package:spark_hire_app/model/common/base_response.dart';

class ModifyEducationExpRequest {
  final int? id;
  final int schoolId;
  final int beginYear;
  final int endYear;
  final int majorId;
  final String activity;
  final EducationStatus? status;

  ModifyEducationExpRequest({
    this.id,
    required this.schoolId,
    required this.beginYear,
    required this.endYear,
    required this.majorId,
    required this.activity,
    this.status,
  });

  ModifyEducationExpRequest copyWith({
    int? id,
    int? schoolId,
    int? beginYear,
    int? endYear,
    int? majorId,
    String? activity,
    EducationStatus? status,
  }) {
    return ModifyEducationExpRequest(
      id: id ?? this.id,
      schoolId: schoolId ?? this.schoolId,
      beginYear: beginYear ?? this.beginYear,
      endYear: endYear ?? this.endYear,
      majorId: majorId ?? this.majorId,
      activity: activity ?? this.activity,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'schoolId': schoolId,
      'beginYear': beginYear,
      'endYear': endYear,
      'majorId': majorId,
      'activity': activity,
      'status': status?.value,
    };
  }

  factory ModifyEducationExpRequest.fromMap(Map<String, dynamic> map) {
    return ModifyEducationExpRequest(
      id: map['id'] != null ? map['id'] as int : null,
      schoolId: map['schoolId'] as int,
      beginYear: map['beginYear'] as int,
      endYear: map['endYear'] as int,
      majorId: map['majorId'] as int,
      activity: map['activity'] as String,
      status: EducationStatusExt.fromInt(map["status"]),
    );
  }

  String toJson() => json.encode(toMap());

  factory ModifyEducationExpRequest.fromJson(String source) =>
      ModifyEducationExpRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return 'ModifyEducationExpRequest(id: $id, schoolId: $schoolId, beginYear: $beginYear, endYear: $endYear, majorId: $majorId, activity: $activity, status: $status)';
  }

  @override
  bool operator ==(covariant ModifyEducationExpRequest other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.schoolId == schoolId &&
        other.beginYear == beginYear &&
        other.endYear == endYear &&
        other.majorId == majorId &&
        other.activity == activity &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        schoolId.hashCode ^
        beginYear.hashCode ^
        endYear.hashCode ^
        majorId.hashCode ^
        activity.hashCode ^
        status.hashCode;
  }

  // 校验参数
  bool validate() {
    if (schoolId <= 0) {
      return false;
    }

    if (majorId <= 0) {
      return false;
    }

    if (beginYear < 1900 || beginYear > 2099) {
      return false;
    }

    if (endYear < beginYear) {
      return false;
    }

    if (activity.length > 600) {
      return false;
    }

    if (status != null &&
        status!.value < 0 &&
        status != EducationStatus.unknown) {
      return false;
    }

    return true;
  }
}

class ModifyEducationExpResponse {
  final BaseResp baseResp;

  const ModifyEducationExpResponse({required this.baseResp});

  bool get success => baseResp.success;

  factory ModifyEducationExpResponse.fromJson(Map<String, dynamic> json) {
    return ModifyEducationExpResponse(
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
