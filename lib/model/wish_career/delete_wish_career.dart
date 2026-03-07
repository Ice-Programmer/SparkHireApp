// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/common/base_response.dart';

class DeleteWishCareerRequest {
  final int id;
  DeleteWishCareerRequest({required this.id});

  DeleteWishCareerRequest copyWith({int? id}) {
    return DeleteWishCareerRequest(id: id ?? this.id);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id};
  }

  factory DeleteWishCareerRequest.fromMap(Map<String, dynamic> map) {
    return DeleteWishCareerRequest(id: map['id'] as int);
  }

  String toJson() => json.encode(toMap());

  factory DeleteWishCareerRequest.fromJson(String source) =>
      DeleteWishCareerRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'DeleteWishCareerRequest(id: $id)';

  @override
  bool operator ==(covariant DeleteWishCareerRequest other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class DeleteWishCareerResponse {
  final BaseResp baseResp;

  const DeleteWishCareerResponse({required this.baseResp});

  bool get success => baseResp.success;

  factory DeleteWishCareerResponse.fromJson(Map<String, dynamic> json) {
    return DeleteWishCareerResponse(
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
