// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/interview/interview_status.dart';
import 'package:spark_hire_app/model/interview/interview_type.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';

class InterviewInfo {
  final int id;
  final UserBasicInfo candidateInfo;
  final UserBasicInfo creatorInfo;
  final int recruitmentId;
  final String recruitmentName;
  final int companyId;
  final String companyName;
  final String companyLink;
  final int interviewTs;
  final InterviewType type;
  final InterviewStatus status;
  final int duration;
  final String interviewLink;
  final String interviewDate;

  InterviewInfo({
    required this.id,
    required this.candidateInfo,
    required this.creatorInfo,
    required this.recruitmentId,
    required this.recruitmentName,
    required this.companyId,
    required this.companyName,
    required this.companyLink,
    required this.interviewTs,
    required this.type,
    required this.status,
    required this.duration,
    required this.interviewLink,
    required this.interviewDate,
  });

  InterviewInfo copyWith({
    int? id,
    UserBasicInfo? candidateInfo,
    UserBasicInfo? creatorInfo,
    int? recruitmentId,
    String? recruitmentName,
    int? companyId,
    String? companyName,
    String? companyLink,
    int? interviewTs,
    InterviewType? type,
    InterviewStatus? status,
    int? duration,
    String? interviewLink,
    String? interviewDate,
  }) {
    return InterviewInfo(
      id: id ?? this.id,
      candidateInfo: candidateInfo ?? this.candidateInfo,
      creatorInfo: creatorInfo ?? this.creatorInfo,
      recruitmentId: recruitmentId ?? this.recruitmentId,
      recruitmentName: recruitmentName ?? this.recruitmentName,
      companyId: companyId ?? this.companyId,
      companyName: companyName ?? this.companyName,
      companyLink: companyLink ?? this.companyLink,
      interviewTs: interviewTs ?? this.interviewTs,
      type: type ?? this.type,
      status: status ?? this.status,
      duration: duration ?? this.duration,
      interviewLink: interviewLink ?? this.interviewLink,
      interviewDate: interviewDate ?? this.interviewDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'candidateInfo': candidateInfo.toMap(),
      'creatorInfo': creatorInfo.toMap(),
      'recruitmentId': recruitmentId,
      'recruitmentName': recruitmentName,
      'companyId': companyId,
      'companyName': companyName,
      'companyLink': companyLink,
      'interviewTs': interviewTs,
      'type': type.value,
      'status': status.value,
      'duration': duration,
      'interviewLink': interviewLink,
      'interviewDate': interviewDate,
    };
  }

  factory InterviewInfo.fromMap(Map<String, dynamic> map) {
    return InterviewInfo(
      id: map['id'] as int,
      candidateInfo: UserBasicInfo.fromMap(
        map['candidateInfo'] as Map<String, dynamic>,
      ),
      creatorInfo: UserBasicInfo.fromMap(
        map['creatorInfo'] as Map<String, dynamic>,
      ),
      recruitmentId: map['recruitmentId'] as int,
      recruitmentName: map['recruitmentName'] as String,
      companyId: map['companyId'] as int,
      companyName: map['companyName'] as String,
      companyLink: map['companyLink'] as String,
      interviewTs: map['interviewTs'] as int,
      type: InterviewType.fromInt(map['type']),
      status: InterviewStatus.fromInt(map['status']),
      duration: map['duration'] as int,
      interviewLink: map['interviewLink'] as String,
      interviewDate: map['interviewDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory InterviewInfo.fromJson(String source) =>
      InterviewInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'InterviewInfo(id: $id, candidateInfo: $candidateInfo, creatorInfo: $creatorInfo, recruitmentId: $recruitmentId, recruitmentName: $recruitmentName, companyId: $companyId, companyName: $companyName, companyLink: $companyLink, interviewTs: $interviewTs, type: $type, status: $status, duration: $duration, interviewLink: $interviewLink, interviewDate: $interviewDate)';
  }

  @override
  bool operator ==(covariant InterviewInfo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.candidateInfo == candidateInfo &&
        other.creatorInfo == creatorInfo &&
        other.recruitmentId == recruitmentId &&
        other.recruitmentName == recruitmentName &&
        other.companyId == companyId &&
        other.companyName == companyName &&
        other.companyLink == companyLink &&
        other.interviewTs == interviewTs &&
        other.type == type &&
        other.status == status &&
        other.duration == duration &&
        other.interviewLink == interviewLink &&
        other.interviewDate == interviewDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        candidateInfo.hashCode ^
        creatorInfo.hashCode ^
        recruitmentId.hashCode ^
        recruitmentName.hashCode ^
        companyId.hashCode ^
        companyName.hashCode ^
        companyLink.hashCode ^
        interviewTs.hashCode ^
        type.hashCode ^
        status.hashCode ^
        duration.hashCode ^
        interviewLink.hashCode ^
        interviewDate.hashCode;
  }
}
