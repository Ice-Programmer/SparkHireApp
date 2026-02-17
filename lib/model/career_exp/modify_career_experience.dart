// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/common/base_response.dart';

class ModifyCareerExperienceRequest {
  final int? id;
  final String experienceName;
  final String jobRole;
  final String description;
  final int startTS;
  final int endTS;
  ModifyCareerExperienceRequest({
    this.id,
    required this.experienceName,
    required this.jobRole,
    required this.description,
    required this.startTS,
    required this.endTS,
  });

  ModifyCareerExperienceRequest copyWith({
    int? id,
    String? experienceName,
    String? jobRole,
    String? description,
    int? startTS,
    int? endTS,
  }) {
    return ModifyCareerExperienceRequest(
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

  factory ModifyCareerExperienceRequest.fromMap(Map<String, dynamic> map) {
    return ModifyCareerExperienceRequest(
      id: map['id'] != null ? map['id'] as int : null,
      experienceName: map['experienceName'] as String,
      jobRole: map['jobRole'] as String,
      description: map['description'] as String,
      startTS: map['startTS'] as int,
      endTS: map['endTS'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModifyCareerExperienceRequest.fromJson(String source) =>
      ModifyCareerExperienceRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return 'ModifyCareerExperienceRequest(id: $id, experienceName: $experienceName, jobRole: $jobRole, description: $description, startTS: $startTS, endTS: $endTS)';
  }

  @override
  bool operator ==(covariant ModifyCareerExperienceRequest other) {
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

  bool validate() {
    if (experienceName.isEmpty) {
      return false;
    }

    if (jobRole.isEmpty) {
      return false;
    }

    if (startTS == 0 || endTS == 0 || endTS < startTS) {
        return false;
    }

    return true;
  }
}

class ModifyCareerExperienceResponse {
  final BaseResp baseResp;

  const ModifyCareerExperienceResponse({required this.baseResp});

  bool get success => baseResp.success;

  factory ModifyCareerExperienceResponse.fromJson(Map<String, dynamic> json) {
    return ModifyCareerExperienceResponse(
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
