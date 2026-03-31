// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/interview/interview_info.dart';

class FetchCurrentUserInterviewRequest {
  Map<String, dynamic> toJson() => {};
}

class FetchCurrentUserInterviewResponse {
  final List<InterviewInfo> interviewList;
  final BaseResp baseResp;

  FetchCurrentUserInterviewResponse({
    required this.interviewList,
    required this.baseResp,
  });

  FetchCurrentUserInterviewResponse copyWith({
    List<InterviewInfo>? interviewList,
    BaseResp? baseResp,
  }) {
    return FetchCurrentUserInterviewResponse(
      interviewList: interviewList ?? this.interviewList,
      baseResp: baseResp ?? this.baseResp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'interviewList': interviewList.map((x) => x.toMap()).toList(),
      'baseResp': baseResp.toMap(),
    };
  }

  factory FetchCurrentUserInterviewResponse.fromMap(Map<String, dynamic> map) {
    return FetchCurrentUserInterviewResponse(
      interviewList: List<InterviewInfo>.from(
        (map['interviewList']).map<InterviewInfo>(
          (x) => InterviewInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
      baseResp: BaseResp.fromJson(map['BaseResp'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchCurrentUserInterviewResponse.fromJson(String source) =>
      FetchCurrentUserInterviewResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'FetchCurrentUserInterviewResponse(interviewList: $interviewList, BaseResp: $baseResp)';

  @override
  bool operator ==(covariant FetchCurrentUserInterviewResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.interviewList, interviewList) &&
        other.baseResp == baseResp;
  }

  @override
  int get hashCode => interviewList.hashCode ^ baseResp.hashCode;

  bool get success => baseResp.success;
}
