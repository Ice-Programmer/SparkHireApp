// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/tag/tag_info.dart';

class QueryTagRequest {
  final String searchText;
  final int pageNum;
  final int pageSize;
  QueryTagRequest({
    required this.searchText,
    required this.pageNum,
    required this.pageSize,
  });

  QueryTagRequest copyWith({String? searchText, int? pageNum, int? pageSize}) {
    return QueryTagRequest(
      searchText: searchText ?? this.searchText,
      pageNum: pageNum ?? this.pageNum,
      pageSize: pageSize ?? this.pageSize,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'searchText': searchText,
      'pageNum': pageNum,
      'pageSize': pageSize,
    };
  }

  factory QueryTagRequest.fromMap(Map<String, dynamic> map) {
    return QueryTagRequest(
      searchText: map['searchText'] as String,
      pageNum: map['pageNum'] as int,
      pageSize: map['pageSize'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory QueryTagRequest.fromJson(String source) =>
      QueryTagRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QueryTagRequest(searchText: $searchText, pageNum: $pageNum, pageSize: $pageSize)';

  @override
  bool operator ==(covariant QueryTagRequest other) {
    if (identical(this, other)) return true;

    return other.searchText == searchText &&
        other.pageNum == pageNum &&
        other.pageSize == pageSize;
  }

  @override
  int get hashCode =>
      searchText.hashCode ^ pageNum.hashCode ^ pageSize.hashCode;
}

class QueryTagResponse {
  final int total;
  final List<TagInfo> tagList;
  final BaseResp baseResp;

  QueryTagResponse({
    required this.total,
    required this.tagList,
    required this.baseResp,
  });

  bool get success => baseResp.success;

  factory QueryTagResponse.fromJson(Map<String, dynamic> json) {
    return QueryTagResponse(
      total: json["total"],
      tagList:
          (json["tagList"] as List).map((e) => TagInfo.fromJson(e)).toList(),
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
