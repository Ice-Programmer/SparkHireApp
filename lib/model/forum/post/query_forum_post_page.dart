// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/forum/post/forum_post.dart';

class ForumPostCondition {
  final String? searchText;

  ForumPostCondition({this.searchText});

  ForumPostCondition copyWith({String? searchText}) {
    return ForumPostCondition(searchText: searchText ?? this.searchText);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'searchText': searchText};
  }

  factory ForumPostCondition.fromMap(Map<String, dynamic> map) {
    return ForumPostCondition(
      searchText:
          map['searchText'] != null ? map['searchText'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ForumPostCondition.fromJson(String source) =>
      ForumPostCondition.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ForumPostCondition(searchText: $searchText)';

  @override
  bool operator ==(covariant ForumPostCondition other) {
    if (identical(this, other)) return true;

    return other.searchText == searchText;
  }

  @override
  int get hashCode => searchText.hashCode;
}

class QueryForumPostPageRequest {
  final ForumPostCondition? condition;
  final int pageSize;
  final int pageNum;

  QueryForumPostPageRequest({
    this.condition,
    required this.pageSize,
    required this.pageNum,
  });

  QueryForumPostPageRequest copyWith({
    ForumPostCondition? condition,
    int? pageSize,
    int? pageNum,
  }) {
    return QueryForumPostPageRequest(
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

  factory QueryForumPostPageRequest.fromMap(Map<String, dynamic> map) {
    return QueryForumPostPageRequest(
      condition:
          map['condition'] != null
              ? ForumPostCondition.fromMap(
                map['condition'] as Map<String, dynamic>,
              )
              : null,
      pageSize: map['pageSize'] as int,
      pageNum: map['pageNum'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory QueryForumPostPageRequest.fromJson(String source) =>
      QueryForumPostPageRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'QueryForumPostPageRequest(condition: $condition, pageSize: $pageSize, pageNum: $pageNum)';

  @override
  bool operator ==(covariant QueryForumPostPageRequest other) {
    if (identical(this, other)) return true;

    return other.condition == condition &&
        other.pageSize == pageSize &&
        other.pageNum == pageNum;
  }

  @override
  int get hashCode => condition.hashCode ^ pageSize.hashCode ^ pageNum.hashCode;
}

class QueryForumPostPageResponse {
  final List<ForumPostInfo>? postList;
  final int? total;
  final BaseResp baseResp;

  QueryForumPostPageResponse({
    this.postList,
    this.total,
    required this.baseResp,
  });

  QueryForumPostPageResponse copyWith({
    List<ForumPostInfo>? postList,
    int? total,
    BaseResp? baseResp,
  }) {
    return QueryForumPostPageResponse(
      postList: postList ?? this.postList,
      total: total ?? this.total,
      baseResp: baseResp ?? this.baseResp,
    );
  }

  factory QueryForumPostPageResponse.fromMap(Map<String, dynamic> map) {
    return QueryForumPostPageResponse(
      postList:
          map['postList'] != null
              ? List<ForumPostInfo>.from(
                (map['postList']).map<ForumPostInfo?>(
                  (x) => ForumPostInfo.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      total: map['total'] != null ? map['total'] as int : null,
      baseResp: BaseResp.fromJson(map['BaseResp'] as Map<String, dynamic>),
    );
  }

  factory QueryForumPostPageResponse.fromJson(String source) =>
      QueryForumPostPageResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'QueryForumPostPageResponse(postList: $postList, total: $total, BaseResp: $baseResp)';

  @override
  bool operator ==(covariant QueryForumPostPageResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.postList, postList) &&
        other.total == total &&
        other.baseResp == baseResp;
  }

  bool get success => baseResp.success;

  @override
  int get hashCode => postList.hashCode ^ total.hashCode ^ baseResp.hashCode;
}
