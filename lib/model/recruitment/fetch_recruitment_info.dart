// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/recruitment/recruitment_info.dart';

class FetchRecruitmentInfoRequest {
  final int recruitmentId;
  FetchRecruitmentInfoRequest({required this.recruitmentId});

  FetchRecruitmentInfoRequest copyWith({int? recruitmentId}) {
    return FetchRecruitmentInfoRequest(
      recruitmentId: recruitmentId ?? this.recruitmentId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'recruitmentId': recruitmentId};
  }

  factory FetchRecruitmentInfoRequest.fromMap(Map<String, dynamic> map) {
    return FetchRecruitmentInfoRequest(
      recruitmentId: map['recruitmentId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchRecruitmentInfoRequest.fromJson(String source) =>
      FetchRecruitmentInfoRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'FetchRecruitmentInfoRequest(recruitmentId: $recruitmentId)';

  @override
  bool operator ==(covariant FetchRecruitmentInfoRequest other) {
    if (identical(this, other)) return true;

    return other.recruitmentId == recruitmentId;
  }

  @override
  int get hashCode => recruitmentId.hashCode;
}

class FetchRecruitmentInfoResponse {
  final RecruitmentInfo recruitmentInfo;
  final BaseResp baseResp;
  FetchRecruitmentInfoResponse({
    required this.recruitmentInfo,
    required this.baseResp,
  });

  FetchRecruitmentInfoResponse copyWith({
    RecruitmentInfo? recruitmentInfo,
    BaseResp? baseResp,
  }) {
    return FetchRecruitmentInfoResponse(
      recruitmentInfo: recruitmentInfo ?? this.recruitmentInfo,
      baseResp: baseResp ?? this.baseResp,
    );
  }

  bool get success => baseResp.success;

  factory FetchRecruitmentInfoResponse.fromMap(Map<String, dynamic> map) {
    return FetchRecruitmentInfoResponse(
      recruitmentInfo: RecruitmentInfo.fromMap(
        map['recruitmentInfo'] as Map<String, dynamic>,
      ),
      baseResp: BaseResp.fromJson(map['baseResp'] as Map<String, dynamic>),
    );
  }

  factory FetchRecruitmentInfoResponse.fromJson(String source) =>
      FetchRecruitmentInfoResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'FetchRecruitmentInfoResponse(recruitmentInfo: $recruitmentInfo, baseResp: $baseResp)';

  @override
  bool operator ==(covariant FetchRecruitmentInfoResponse other) {
    if (identical(this, other)) return true;

    return other.recruitmentInfo == recruitmentInfo &&
        other.baseResp == baseResp;
  }

  @override
  int get hashCode => recruitmentInfo.hashCode ^ baseResp.hashCode;
}
