// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/tag/bind_tag.dart';

class UnbindTagRequest {
  final TagObjType objType;
  final List<int> tagIdList;
  final int objId;

  UnbindTagRequest({
    required this.objType,
    required this.tagIdList,
    required this.objId,
  });

  UnbindTagRequest copyWith({
    TagObjType? objType,
    List<int>? tagList,
    int? objId,
  }) {
    return UnbindTagRequest(
      objType: objType ?? this.objType,
      tagIdList: tagList ?? tagIdList,
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
      'UnbindTagReqest(objType: $objType, tagList: $tagIdList, objId: $objId)';

  @override
  bool operator ==(covariant UnbindTagRequest other) {
    if (identical(this, other)) return true;

    return other.objType == objType &&
        listEquals(other.tagIdList, tagIdList) &&
        other.objId == objId;
  }

  @override
  int get hashCode => objType.hashCode ^ tagIdList.hashCode ^ objId.hashCode;
}

class UnbindTagResponse {
  final int num;
  final BaseResp baseResp;

  const UnbindTagResponse({required this.num, required this.baseResp});

  bool get success => baseResp.success;

  factory UnbindTagResponse.fromJson(Map<String, dynamic> json) {
    return UnbindTagResponse(
      num: json['num'] as int,
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
