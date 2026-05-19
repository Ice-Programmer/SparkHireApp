// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:spark_hire_app/model/common/base.dart';
import 'package:spark_hire_app/model/common/base_response.dart';

class RecruitmentRecommendation {
  final int id;
  final int rank;
  final String title;
  final String reason;
  final int matchScore;
  final List<String> tags;

  RecruitmentRecommendation({
    required this.id,
    required this.rank,
    required this.title,
    required this.reason,
    required this.matchScore,
    required this.tags,
  });

  RecruitmentRecommendation copyWith({
    int? id,
    int? rank,
    String? title,
    String? reason,
    int? matchScore,
    List<String>? tags,
  }) {
    return RecruitmentRecommendation(
      id: id ?? this.id,
      rank: rank ?? this.rank,
      title: title ?? this.title,
      reason: reason ?? this.reason,
      matchScore: matchScore ?? this.matchScore,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'rank': rank,
      'title': title,
      'reason': reason,
      'matchScore': matchScore,
      'tags': tags,
    };
  }

  factory RecruitmentRecommendation.fromMap(Map<String, dynamic> map) {
    return RecruitmentRecommendation(
      id: map['id'] as int,
      rank: map['rank'] as int,
      title: map['title'] as String,
      reason: map['reason'] as String,
      matchScore: map['matchScore'] as int,
      tags: List<String>.from(map['tags'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecruitmentRecommendation.fromJson(String source) =>
      RecruitmentRecommendation.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return 'RecruitmentRecommendation(id: $id, rank: $rank, title: $title, reason: $reason, matchScore: $matchScore, tags: $tags)';
  }

  @override
  bool operator ==(covariant RecruitmentRecommendation other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.rank == rank &&
        other.title == title &&
        other.reason == reason &&
        other.matchScore == matchScore &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        rank.hashCode ^
        title.hashCode ^
        reason.hashCode ^
        matchScore.hashCode ^
        tags.hashCode;
  }
}

class RecommendRecruitmentResult {
  final List<RecruitmentRecommendation> recommendations;

  RecommendRecruitmentResult({required this.recommendations});

  RecommendRecruitmentResult copyWith({
    List<RecruitmentRecommendation>? recommendations,
  }) {
    return RecommendRecruitmentResult(
      recommendations: recommendations ?? this.recommendations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'recommendations': recommendations.map((x) => x.toMap()).toList(),
    };
  }

  factory RecommendRecruitmentResult.fromMap(Map<String, dynamic> map) {
    return RecommendRecruitmentResult(
      recommendations: List<RecruitmentRecommendation>.from(
        (map['recommendations']).map<RecruitmentRecommendation>(
          (x) => RecruitmentRecommendation.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecommendRecruitmentResult.fromJson(String source) =>
      RecommendRecruitmentResult.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'RecommendRecruitmentResult(recommendations: $recommendations)';

  @override
  bool operator ==(covariant RecommendRecruitmentResult other) {
    if (identical(this, other)) return true;

    return listEquals(other.recommendations, recommendations);
  }

  @override
  int get hashCode => recommendations.hashCode;
}

class SmartRecommendRecruitmentRequest {
  final Base? base;

  SmartRecommendRecruitmentRequest({this.base});

  SmartRecommendRecruitmentRequest copyWith({Base? base}) {
    return SmartRecommendRecruitmentRequest(base: base ?? this.base);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'base': base?.toJson()};
  }

  factory SmartRecommendRecruitmentRequest.fromMap(Map<String, dynamic> map) {
    return SmartRecommendRecruitmentRequest(
      base:
          map['Base'] != null
              ? Base.fromJson(map['Base'] as Map<String, dynamic>)
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SmartRecommendRecruitmentRequest.fromJson(String source) =>
      SmartRecommendRecruitmentRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'SmartRecommendRecruitmentRequest(base: $base)';

  @override
  bool operator ==(covariant SmartRecommendRecruitmentRequest other) {
    if (identical(this, other)) return true;

    return other.base == base;
  }

  @override
  int get hashCode => base.hashCode;
}

class SmartRecommendRecruitmentResponse {
  final RecommendRecruitmentResult? recommendRecruitmentResult;
  final BaseResp baseResp;

  SmartRecommendRecruitmentResponse({
    this.recommendRecruitmentResult,
    required this.baseResp,
  });

  SmartRecommendRecruitmentResponse copyWith({
    RecommendRecruitmentResult? recommendRecruitmentResult,
    BaseResp? baseResp,
  }) {
    return SmartRecommendRecruitmentResponse(
      recommendRecruitmentResult:
          recommendRecruitmentResult ?? this.recommendRecruitmentResult,
      baseResp: baseResp ?? this.baseResp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'recommendRecruitmentResult': recommendRecruitmentResult?.toMap(),
      'BaseResp': baseResp.toMap(),
    };
  }

  factory SmartRecommendRecruitmentResponse.fromMap(Map<String, dynamic> map) {
    return SmartRecommendRecruitmentResponse(
      recommendRecruitmentResult:
          map['recommendRecruitmentResult'] != null
              ? RecommendRecruitmentResult.fromMap(
                map['recommendRecruitmentResult'] as Map<String, dynamic>,
              )
              : null,
      baseResp: BaseResp.fromJson(map['BaseResp'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory SmartRecommendRecruitmentResponse.fromJson(String source) =>
      SmartRecommendRecruitmentResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'SmartRecommendRecruitmentResponse(recommendRecruitmentResult: $recommendRecruitmentResult, BaseResp: $baseResp)';

  @override
  bool operator ==(covariant SmartRecommendRecruitmentResponse other) {
    if (identical(this, other)) return true;

    return other.recommendRecruitmentResult == recommendRecruitmentResult &&
        other.baseResp == baseResp;
  }

  @override
  int get hashCode => recommendRecruitmentResult.hashCode ^ baseResp.hashCode;

  bool get success => baseResp.success;
}
