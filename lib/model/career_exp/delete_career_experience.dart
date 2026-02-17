// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/common/base_response.dart';

class DeleteCareerExperienceRequest {
  final int id;
  DeleteCareerExperienceRequest({required this.id});

  DeleteCareerExperienceRequest copyWith({int? id}) {
    return DeleteCareerExperienceRequest(id: id ?? this.id);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id};
  }

  factory DeleteCareerExperienceRequest.fromMap(Map<String, dynamic> map) {
    return DeleteCareerExperienceRequest(id: map['id'] as int);
  }

  String toJson() => json.encode(toMap());

  factory DeleteCareerExperienceRequest.fromJson(String source) =>
      DeleteCareerExperienceRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'DeleteCareerExperienceRequest(id: $id)';

  @override
  bool operator ==(covariant DeleteCareerExperienceRequest other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class DeleteCareerExperienceResponse {
  final BaseResp baseResp;

  const DeleteCareerExperienceResponse({required this.baseResp});

  bool get success => baseResp.success;

  factory DeleteCareerExperienceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCareerExperienceResponse(
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
