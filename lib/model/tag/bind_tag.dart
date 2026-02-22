// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:spark_hire_app/model/common/base_response.dart';

enum TagObjType { candidate, recruitment, unknown }

extension TagObjTypeExt on TagObjType {
  static TagObjType fromInt(int value) {
    switch (value) {
      case 1:
        return TagObjType.candidate;
      case 2:
        return TagObjType.recruitment;
      default:
        return TagObjType.unknown;
    }
  }

  int get value {
    switch (this) {
      case TagObjType.candidate:
        return 1;
      case TagObjType.recruitment:
        return 2;
      case TagObjType.unknown:
        return 0;
    }
  }
}

class BindTagRequest {
  final TagObjType objType;
  final List<int> tagIdList;
  final int objId;

  BindTagRequest({
    required this.objType,
    required this.tagIdList,
    required this.objId,
  });

  BindTagRequest copyWith({
    TagObjType? objType,
    List<int>? tagList,
    int? objId,
  }) {
    return BindTagRequest(
      objType: objType ?? this.objType,
      tagIdList: tagList ?? this.tagIdList,
      objId: objId ?? this.objId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objType': objType.value,
      'tagIdList': tagIdList,
      'objId': objId,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'BindTagRequest(objType: $objType, tagList: $tagIdList, objId: $objId)';

  @override
  bool operator ==(covariant BindTagRequest other) {
    if (identical(this, other)) return true;

    return other.objType == objType &&
        listEquals(other.tagIdList, tagIdList) &&
        other.objId == objId;
  }

  @override
  int get hashCode => objType.hashCode ^ tagIdList.hashCode ^ objId.hashCode;
}

class BindTagResponse {
  final int num;
  final BaseResp baseResp;

  const BindTagResponse({required this.num, required this.baseResp});

  bool get success => baseResp.success;

  factory BindTagResponse.fromJson(Map<String, dynamic> json) {
    return BindTagResponse(
      num: json['num'] as int,
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
