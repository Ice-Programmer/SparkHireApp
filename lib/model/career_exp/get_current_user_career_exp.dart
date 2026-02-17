// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/common/base.dart';
import 'package:spark_hire_app/model/common/base_response.dart';

class GetCurrentUserCareerExperienceRequest {
  final Base? base;

  const GetCurrentUserCareerExperienceRequest({this.base});

  Map<String, dynamic> toJson() => {'base': base?.toJson()};
}

class CareerExperienceInfo {
  final int id;
  final String experienceName;
  final String jobRole;
  final String description;
  final int startTS;
  final int endTS;

  CareerExperienceInfo({
    required this.id,
    required this.experienceName,
    required this.jobRole,
    required this.description,
    required this.startTS,
    required this.endTS,
  });

  CareerExperienceInfo copyWith({
    int? id,
    String? experienceName,
    String? jobRole,
    String? description,
    int? startTS,
    int? endTS,
  }) {
    return CareerExperienceInfo(
      id: id ?? this.id,
      experienceName: experienceName ?? this.experienceName,
      jobRole: jobRole ?? this.jobRole,
      description: description ?? this.description,
      startTS: startTS ?? this.startTS,
      endTS: endTS ?? this.endTS,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'experienceName': experienceName,
      'jobRole': jobRole,
      'description': description,
      'startTS': startTS,
      'endTS': endTS,
    };
  }

  factory CareerExperienceInfo.fromMap(Map<String, dynamic> map) {
    return CareerExperienceInfo(
      id: map['id'] as int,
      experienceName: map['experienceName'] as String,
      jobRole: map['jobRole'] as String,
      description: map['description'] as String,
      startTS: map['startTS'] as int,
      endTS: map['endTS'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CareerExperienceInfo.fromJson(String source) =>
      CareerExperienceInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CareerExperienceInfo(id: $id, experienceName: $experienceName, jobRole: $jobRole, description: $description, startTS: $startTS, endTS: $endTS)';
  }

  @override
  bool operator ==(covariant CareerExperienceInfo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.experienceName == experienceName &&
        other.jobRole == jobRole &&
        other.description == description &&
        other.startTS == startTS &&
        other.endTS == endTS;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        experienceName.hashCode ^
        jobRole.hashCode ^
        description.hashCode ^
        startTS.hashCode ^
        endTS.hashCode;
  }
}

class GetCurrentUserCareerExperienceResponse {
  final List<CareerExperienceInfo> careerExperienceInfoList;
  final BaseResp baseResp;

  const GetCurrentUserCareerExperienceResponse({
    required this.careerExperienceInfoList,
    required this.baseResp,
  });

  bool get success => baseResp.success;

  factory GetCurrentUserCareerExperienceResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetCurrentUserCareerExperienceResponse(
      careerExperienceInfoList:
          (json["careerExperienceInfoList"] as List)
              .map((e) => CareerExperienceInfo.fromMap(e))
              .toList(),
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
