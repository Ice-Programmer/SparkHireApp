// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/common/base_response.dart';

class AddTagRequest {
  final String tagName;
  AddTagRequest({required this.tagName});

  AddTagRequest copyWith({String? tagName}) {
    return AddTagRequest(tagName: tagName ?? this.tagName);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'tagName': tagName};
  }

  factory AddTagRequest.fromMap(Map<String, dynamic> map) {
    return AddTagRequest(tagName: map['tagName'] as String);
  }

  String toJson() => json.encode(toMap());

  factory AddTagRequest.fromJson(String source) =>
      AddTagRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AddTagRequest(tagName: $tagName)';

  @override
  bool operator ==(covariant AddTagRequest other) {
    if (identical(this, other)) return true;

    return other.tagName == tagName;
  }

  @override
  int get hashCode => tagName.hashCode;
}

class AddTagResponse {
  final int id;
  final BaseResp baseResp;

  const AddTagResponse({required this.id, required this.baseResp});

  bool get success => baseResp.success;

  factory AddTagResponse.fromJson(Map<String, dynamic> json) {
    return AddTagResponse(
      id: json['id'] as int,
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
