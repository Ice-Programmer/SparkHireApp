// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:spark_hire_app/model/common/base.dart';
import 'package:spark_hire_app/model/common/base_response.dart';

class OptimizeResumeOverviewItem {
  final String category;
  final String count;
  final double progress;

  OptimizeResumeOverviewItem({
    required this.category,
    required this.count,
    required this.progress,
  });

  OptimizeResumeOverviewItem copyWith({
    String? category,
    String? count,
    double? progress,
  }) {
    return OptimizeResumeOverviewItem(
      category: category ?? this.category,
      count: count ?? this.count,
      progress: progress ?? this.progress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'count': count,
      'progress': progress,
    };
  }

  factory OptimizeResumeOverviewItem.fromMap(Map<String, dynamic> map) {
    return OptimizeResumeOverviewItem(
      category: map['category'] as String,
      count: map['count'] as String,
      progress: map['progress'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OptimizeResumeOverviewItem.fromJson(String source) =>
      OptimizeResumeOverviewItem.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'OptimizeResumeOverviewItem(category: $category, count: $count, progress: $progress)';

  @override
  bool operator ==(covariant OptimizeResumeOverviewItem other) {
    if (identical(this, other)) return true;

    return other.category == category &&
        other.count == count &&
        other.progress == progress;
  }

  @override
  int get hashCode => category.hashCode ^ count.hashCode ^ progress.hashCode;
}

class OptimizeResumeSuggestion {
  final String category;
  final String title;
  final String descritpion;
  final String tag;

  OptimizeResumeSuggestion({
    required this.category,
    required this.title,
    required this.descritpion,
    required this.tag,
  });

  OptimizeResumeSuggestion copyWith({
    String? category,
    String? title,
    String? descritpion,
    String? tag,
  }) {
    return OptimizeResumeSuggestion(
      category: category ?? this.category,
      title: title ?? this.title,
      descritpion: descritpion ?? this.descritpion,
      tag: tag ?? this.tag,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category,
      'title': title,
      'descritpion': descritpion,
      'tag': tag,
    };
  }

  factory OptimizeResumeSuggestion.fromMap(Map<String, dynamic> map) {
    return OptimizeResumeSuggestion(
      category: map['category'] as String,
      title: map['title'] as String,
      descritpion: map['descritpion'] as String,
      tag: map['tag'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OptimizeResumeSuggestion.fromJson(String source) =>
      OptimizeResumeSuggestion.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return 'OptimizeResumeSuggestion(category: $category, title: $title, descritpion: $descritpion, tag: $tag)';
  }

  @override
  bool operator ==(covariant OptimizeResumeSuggestion other) {
    if (identical(this, other)) return true;

    return other.category == category &&
        other.title == title &&
        other.descritpion == descritpion &&
        other.tag == tag;
  }

  @override
  int get hashCode {
    return category.hashCode ^
        title.hashCode ^
        descritpion.hashCode ^
        tag.hashCode;
  }
}

class OptimizeResumeResult {
  final double score;
  final String comparisonText;
  final List<OptimizeResumeOverviewItem>? overviewItems;
  final List<OptimizeResumeOverviewItem>? suggestions;

  OptimizeResumeResult({
    required this.score,
    required this.comparisonText,
    this.overviewItems,
    this.suggestions,
  });

  OptimizeResumeResult copyWith({
    double? score,
    String? comparisonText,
    List<OptimizeResumeOverviewItem>? overviewItems,
    List<OptimizeResumeOverviewItem>? suggestions,
  }) {
    return OptimizeResumeResult(
      score: score ?? this.score,
      comparisonText: comparisonText ?? this.comparisonText,
      overviewItems: overviewItems ?? this.overviewItems,
      suggestions: suggestions ?? this.suggestions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'score': score,
      'comparisonText': comparisonText,
      'overviewItems': overviewItems?.map((x) => x.toMap()).toList(),
      'suggestions': suggestions?.map((x) => x.toMap()).toList(),
    };
  }

  factory OptimizeResumeResult.fromMap(Map<String, dynamic> map) {
    return OptimizeResumeResult(
      score: map['score'] as double,
      comparisonText: map['comparisonText'] as String,
      overviewItems:
          map['overviewItems'] != null
              ? List<OptimizeResumeOverviewItem>.from(
                (map['overviewItems'] as List<int>)
                    .map<OptimizeResumeOverviewItem?>(
                      (x) => OptimizeResumeOverviewItem.fromMap(
                        x as Map<String, dynamic>,
                      ),
                    ),
              )
              : null,
      suggestions:
          map['suggestions'] != null
              ? List<OptimizeResumeOverviewItem>.from(
                (map['suggestions'] as List<int>)
                    .map<OptimizeResumeOverviewItem?>(
                      (x) => OptimizeResumeOverviewItem.fromMap(
                        x as Map<String, dynamic>,
                      ),
                    ),
              )
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OptimizeResumeResult.fromJson(String source) =>
      OptimizeResumeResult.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OptimizeResumeResult(score: $score, comparisonText: $comparisonText, overviewItems: $overviewItems, suggestions: $suggestions)';
  }

  @override
  bool operator ==(covariant OptimizeResumeResult other) {
    if (identical(this, other)) return true;

    return other.score == score &&
        other.comparisonText == comparisonText &&
        listEquals(other.overviewItems, overviewItems) &&
        listEquals(other.suggestions, suggestions);
  }

  @override
  int get hashCode {
    return score.hashCode ^
        comparisonText.hashCode ^
        overviewItems.hashCode ^
        suggestions.hashCode;
  }
}

class SmartOptimizeCandidateResumeRequest {
  final Base? base;
  SmartOptimizeCandidateResumeRequest({this.base});

  SmartOptimizeCandidateResumeRequest copyWith({Base? base}) {
    return SmartOptimizeCandidateResumeRequest(base: base ?? this.base);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'base': base?.toJson()};
  }

  factory SmartOptimizeCandidateResumeRequest.fromMap(
    Map<String, dynamic> map,
  ) {
    return SmartOptimizeCandidateResumeRequest(
      base:
          map['base'] != null
              ? Base.fromJson(map['base'] as Map<String, dynamic>)
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SmartOptimizeCandidateResumeRequest.fromJson(String source) =>
      SmartOptimizeCandidateResumeRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'SmartOptimizeCandidateResumeRequest(base: $base)';

  @override
  bool operator ==(covariant SmartOptimizeCandidateResumeRequest other) {
    if (identical(this, other)) return true;

    return other.base == base;
  }

  @override
  int get hashCode => base.hashCode;
}

class SmartOptimizeCandidateResumeResponse {
  final OptimizeResumeResult optimizeResumeResult;
  final BaseResp baseResp;

  SmartOptimizeCandidateResumeResponse({
    required this.optimizeResumeResult,
    required this.baseResp,
  });

  SmartOptimizeCandidateResumeResponse copyWith({
    OptimizeResumeResult? optimizeResumeResult,
    BaseResp? baseResp,
  }) {
    return SmartOptimizeCandidateResumeResponse(
      optimizeResumeResult: optimizeResumeResult ?? this.optimizeResumeResult,
      baseResp: baseResp ?? this.baseResp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'optimizeResumeResult': optimizeResumeResult.toMap(),
      'BaseResp': baseResp.toMap(),
    };
  }

  factory SmartOptimizeCandidateResumeResponse.fromMap(
    Map<String, dynamic> map,
  ) {
    return SmartOptimizeCandidateResumeResponse(
      optimizeResumeResult: OptimizeResumeResult.fromMap(
        map['optimizeResumeResult'] as Map<String, dynamic>,
      ),
      baseResp: BaseResp.fromJson(map['BaseResp'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory SmartOptimizeCandidateResumeResponse.fromJson(String source) =>
      SmartOptimizeCandidateResumeResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'SmartOptimizeCandidateResumeResponse(optimizeResumeResult: $optimizeResumeResult, BaseResp: $baseResp)';

  @override
  bool operator ==(covariant SmartOptimizeCandidateResumeResponse other) {
    if (identical(this, other)) return true;

    return other.optimizeResumeResult == optimizeResumeResult &&
        other.baseResp == baseResp;
  }

  @override
  int get hashCode => optimizeResumeResult.hashCode ^ baseResp.hashCode;

  bool get success => baseResp.success;
}
