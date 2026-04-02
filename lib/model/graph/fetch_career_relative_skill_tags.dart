// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/tag/tag_info.dart';

class FetchCareerRelativeSkillTagsRequest {
  final int ccareerId;
  FetchCareerRelativeSkillTagsRequest({required this.ccareerId});

  FetchCareerRelativeSkillTagsRequest copyWith({int? ccareerId}) {
    return FetchCareerRelativeSkillTagsRequest(
      ccareerId: ccareerId ?? this.ccareerId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'ccareerId': ccareerId};
  }

  factory FetchCareerRelativeSkillTagsRequest.fromMap(
    Map<String, dynamic> map,
  ) {
    return FetchCareerRelativeSkillTagsRequest(
      ccareerId: map['ccareerId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchCareerRelativeSkillTagsRequest.fromJson(String source) =>
      FetchCareerRelativeSkillTagsRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'FetchCareerRelativeSkillTagsRequest(ccareerId: $ccareerId)';

  @override
  bool operator ==(covariant FetchCareerRelativeSkillTagsRequest other) {
    if (identical(this, other)) return true;

    return other.ccareerId == ccareerId;
  }

  @override
  int get hashCode => ccareerId.hashCode;
}

class FetchCareerRelativeSkillTagsResponse {
  final List<TagInfo>? tagList;
  final BaseResp baseResp;
  FetchCareerRelativeSkillTagsResponse({this.tagList, required this.baseResp});

  FetchCareerRelativeSkillTagsResponse copyWith({
    List<TagInfo>? tagList,
    BaseResp? baseResp,
  }) {
    return FetchCareerRelativeSkillTagsResponse(
      tagList: tagList ?? this.tagList,
      baseResp: baseResp ?? this.baseResp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tagList': tagList?.map((x) => x.toJson()).toList(),
      'BaseResp': baseResp.toMap(),
    };
  }

  factory FetchCareerRelativeSkillTagsResponse.fromMap(
    Map<String, dynamic> map,
  ) {
    return FetchCareerRelativeSkillTagsResponse(
      tagList:
          map['tagList'] != null
              ? List<TagInfo>.from(
                (map['tagList']).map<TagInfo?>(
                  (x) => TagInfo.fromJson(x as Map<String, dynamic>),
                ),
              )
              : null,
      baseResp: BaseResp.fromJson(map['BaseResp'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchCareerRelativeSkillTagsResponse.fromJson(String source) =>
      FetchCareerRelativeSkillTagsResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'FetchCareerRelativeSkillTagsResponse(tagList: $tagList, BaseResp: $baseResp)';

  @override
  bool operator ==(covariant FetchCareerRelativeSkillTagsResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.tagList, tagList) && other.baseResp == baseResp;
  }

  @override
  int get hashCode => tagList.hashCode ^ baseResp.hashCode;

  bool get success => baseResp.success;
}
