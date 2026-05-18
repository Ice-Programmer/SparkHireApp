// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/common/base_response.dart';

class ApplyRecruitmentResponse {
  final BaseResp baseResp;

  ApplyRecruitmentResponse({required this.baseResp});

  ApplyRecruitmentResponse copyWith({BaseResp? baseResp}) {
    return ApplyRecruitmentResponse(baseResp: baseResp ?? this.baseResp);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'BaseResp': baseResp.toMap()};
  }

  factory ApplyRecruitmentResponse.fromMap(Map<String, dynamic> map) {
    return ApplyRecruitmentResponse(
      baseResp: BaseResp.fromJson(map['BaseResp'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ApplyRecruitmentResponse.fromJson(String source) =>
      ApplyRecruitmentResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'ApplyRecruitmentResponse(BaseResp: $baseResp)';

  @override
  bool operator ==(covariant ApplyRecruitmentResponse other) {
    if (identical(this, other)) return true;

    return other.baseResp == baseResp;
  }

  @override
  int get hashCode => baseResp.hashCode;

  bool get success => baseResp.success;
}

class ApplyRecruitmentRequest {
  final int recruitmentId;
  
  ApplyRecruitmentRequest({required this.recruitmentId});

  ApplyRecruitmentRequest copyWith({int? recruitmentId}) {
    return ApplyRecruitmentRequest(
      recruitmentId: recruitmentId ?? this.recruitmentId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'recruitmentId': recruitmentId};
  }

  factory ApplyRecruitmentRequest.fromMap(Map<String, dynamic> map) {
    return ApplyRecruitmentRequest(recruitmentId: map['recruitmentId'] as int);
  }

  String toJson() => json.encode(toMap());

  factory ApplyRecruitmentRequest.fromJson(String source) =>
      ApplyRecruitmentRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'ApplyRecruitmentRequest(recruitmentId: $recruitmentId)';

  @override
  bool operator ==(covariant ApplyRecruitmentRequest other) {
    if (identical(this, other)) return true;

    return other.recruitmentId == recruitmentId;
  }

  @override
  int get hashCode => recruitmentId.hashCode;
}
