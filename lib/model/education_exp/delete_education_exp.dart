// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/common/base_response.dart';

class DeleteEducationExpRequest {
  final int id;
  DeleteEducationExpRequest({required this.id});

  DeleteEducationExpRequest copyWith({int? id}) {
    return DeleteEducationExpRequest(id: id ?? this.id);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id};
  }

  factory DeleteEducationExpRequest.fromMap(Map<String, dynamic> map) {
    return DeleteEducationExpRequest(id: map['id'] as int);
  }

  String toJson() => json.encode(toMap());

  factory DeleteEducationExpRequest.fromJson(String source) =>
      DeleteEducationExpRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'DeleteEducationExpRequest(id: $id)';

  @override
  bool operator ==(covariant DeleteEducationExpRequest other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class DeleteEducationExpResponse {
  final BaseResp baseResp;

  const DeleteEducationExpResponse({required this.baseResp});

  bool get success => baseResp.success;

  factory DeleteEducationExpResponse.fromJson(Map<String, dynamic> json) {
    return DeleteEducationExpResponse(
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
