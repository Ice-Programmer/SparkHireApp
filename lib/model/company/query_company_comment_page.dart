// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/company/comment.dart';

class CompanyCommentCondition {
  final int? companyId;
  final int? id;
  final int? userId;
  final int? rootId;
  CompanyCommentCondition({this.companyId, this.id, this.userId, this.rootId});

  CompanyCommentCondition copyWith({
    int? companyId,
    int? id,
    int? userId,
    int? rootId,
  }) {
    return CompanyCommentCondition(
      companyId: companyId ?? this.companyId,
      id: id ?? this.id,
      userId: userId ?? this.userId,
      rootId: rootId ?? this.rootId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'companyId': companyId,
      'id': id,
      'userId': userId,
      'rootId': rootId,
    };
  }

  factory CompanyCommentCondition.fromMap(Map<String, dynamic> map) {
    return CompanyCommentCondition(
      companyId: map['companyId'] != null ? map['companyId'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
      rootId: map['rootId'] != null ? map['rootId'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyCommentCondition.fromJson(String source) =>
      CompanyCommentCondition.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return 'CompanyCommentCondition(companyId: $companyId, id: $id, userId: $userId, rootId: $rootId)';
  }

  @override
  bool operator ==(covariant CompanyCommentCondition other) {
    if (identical(this, other)) return true;

    return other.companyId == companyId &&
        other.id == id &&
        other.userId == userId &&
        other.rootId == rootId;
  }

  @override
  int get hashCode {
    return companyId.hashCode ^ id.hashCode ^ userId.hashCode ^ rootId.hashCode;
  }
}

class QueryCompanyCommentPageRequest {
  final CompanyCommentCondition? condition;
  final int pageSize;
  final int pageNum;

  QueryCompanyCommentPageRequest({
    this.condition,
    required this.pageSize,
    required this.pageNum,
  });

  QueryCompanyCommentPageRequest copyWith({
    CompanyCommentCondition? condition,
    int? pageSize,
    int? pageNum,
  }) {
    return QueryCompanyCommentPageRequest(
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

  factory QueryCompanyCommentPageRequest.fromMap(Map<String, dynamic> map) {
    return QueryCompanyCommentPageRequest(
      condition:
          map['condition'] != null
              ? CompanyCommentCondition.fromMap(
                map['condition'] as Map<String, dynamic>,
              )
              : null,
      pageSize: map['pageSize'] as int,
      pageNum: map['pageNum'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory QueryCompanyCommentPageRequest.fromJson(String source) =>
      QueryCompanyCommentPageRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'QueryCompanyCommentPageRequest(condition: $condition, pageSize: $pageSize, pageNum: $pageNum)';

  @override
  bool operator ==(covariant QueryCompanyCommentPageRequest other) {
    if (identical(this, other)) return true;

    return other.condition == condition &&
        other.pageSize == pageSize &&
        other.pageNum == pageNum;
  }

  @override
  int get hashCode => condition.hashCode ^ pageSize.hashCode ^ pageNum.hashCode;
}

class QueryCompanyCommentPageResponse {
  final List<CommentInfo> commentInfoList;
  final int total;
  final BaseResp baseResp;

  QueryCompanyCommentPageResponse({
    required this.commentInfoList,
    required this.total,
    required this.baseResp,
  });

  QueryCompanyCommentPageResponse copyWith({
    List<CommentInfo>? commentInfoList,
    int? total,
    BaseResp? baseResp,
  }) {
    return QueryCompanyCommentPageResponse(
      commentInfoList: commentInfoList ?? this.commentInfoList,
      total: total ?? this.total,
      baseResp: baseResp ?? this.baseResp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'commentInfoList': commentInfoList.map((x) => x.toMap()).toList(),
      'total': total,
      'baseResp': baseResp.toMap(),
    };
  }

  factory QueryCompanyCommentPageResponse.fromMap(Map<String, dynamic> map) {
    return QueryCompanyCommentPageResponse(
      commentInfoList: List<CommentInfo>.from(
        (map['commentInfoList']).map<CommentInfo>(
          (x) => CommentInfo.fromMap(x as Map<String, dynamic>),
        ),
      ),
      total: map['total'] as int,
      baseResp: BaseResp.fromJson(map['BaseResp'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory QueryCompanyCommentPageResponse.fromJson(String source) =>
      QueryCompanyCommentPageResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'QueryCompanyCommentPageResponse(commentInfoList: $commentInfoList, total: $total, baseResp: $baseResp)';

  @override
  bool operator ==(covariant QueryCompanyCommentPageResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.commentInfoList, commentInfoList) &&
        other.total == total &&
        other.baseResp == baseResp;
  }

  @override
  int get hashCode =>
      commentInfoList.hashCode ^ total.hashCode ^ baseResp.hashCode;

  bool get success => baseResp.success;
}
