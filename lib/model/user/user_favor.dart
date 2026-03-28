// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/common/base_response.dart';

enum TargetType { recruitment, company, none }

extension TargetTypeExt on TargetType {
  static TargetType fromInt(int value) {
    switch (value) {
      case 1:
        return TargetType.recruitment;
      case 2:
        return TargetType.company;
      default:
        return TargetType.none;
    }
  }

  int get value {
    switch (this) {
      case TargetType.recruitment:
        return 1;
      case TargetType.company:
        return 2;
      case TargetType.none:
        return 0;
    }
  }
}

class UserFavorRequest {
  final TargetType targetType;
  final int targetId;

  UserFavorRequest({required this.targetType, required this.targetId});

  UserFavorRequest copyWith({TargetType? targetType, int? targetId}) {
    return UserFavorRequest(
      targetType: targetType ?? this.targetType,
      targetId: targetId ?? this.targetId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'targetType': targetType.value,
      'targetId': targetId,
    };
  }

  factory UserFavorRequest.fromMap(Map<String, dynamic> map) {
    return UserFavorRequest(
      targetType: TargetTypeExt.fromInt(map['targetType']),
      targetId: map['targetId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserFavorRequest.fromJson(String source) =>
      UserFavorRequest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserFavorRequest(targetType: $targetType, targetId: $targetId)';

  @override
  bool operator ==(covariant UserFavorRequest other) {
    if (identical(this, other)) return true;

    return other.targetType == targetType && other.targetId == targetId;
  }

  @override
  int get hashCode => targetType.hashCode ^ targetId.hashCode;
}

class UserFavorResponse {
  final BaseResp baseResp;

  UserFavorResponse({required this.baseResp});

  UserFavorResponse copyWith({BaseResp? baseResp}) {
    return UserFavorResponse(baseResp: baseResp ?? this.baseResp);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'BaseResp': baseResp.toMap()};
  }

  factory UserFavorResponse.fromMap(Map<String, dynamic> map) {
    return UserFavorResponse(
      baseResp: BaseResp.fromJson(map['BaseResp'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserFavorResponse.fromJson(String source) =>
      UserFavorResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserFavorResponse(BaseResp: $baseResp)';

  @override
  bool operator ==(covariant UserFavorResponse other) {
    if (identical(this, other)) return true;

    return other.baseResp == baseResp;
  }

  @override
  int get hashCode => baseResp.hashCode;

  bool get success => baseResp.success;
}

class UserCancelFavorRequest {
  final TargetType targetType;
  final int targetId;
  UserCancelFavorRequest({required this.targetType, required this.targetId});

  UserCancelFavorRequest copyWith({TargetType? targetType, int? targetId}) {
    return UserCancelFavorRequest(
      targetType: targetType ?? this.targetType,
      targetId: targetId ?? this.targetId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'targetType': targetType.value,
      'targetId': targetId,
    };
  }

  factory UserCancelFavorRequest.fromMap(Map<String, dynamic> map) {
    return UserCancelFavorRequest(
      targetType: TargetTypeExt.fromInt(map['targetType'] as int),
      targetId: map['targetId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCancelFavorRequest.fromJson(String source) =>
      UserCancelFavorRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'UserCancelFavorRequest(targetType: $targetType, targetId: $targetId)';

  @override
  bool operator ==(covariant UserCancelFavorRequest other) {
    if (identical(this, other)) return true;

    return other.targetType == targetType && other.targetId == targetId;
  }

  @override
  int get hashCode => targetType.hashCode ^ targetId.hashCode;
}

class UserCancelFavorResponse {
  final BaseResp baseResp;

  UserCancelFavorResponse({required this.baseResp});

  UserCancelFavorResponse copyWith({BaseResp? baseResp}) {
    return UserCancelFavorResponse(baseResp: baseResp ?? this.baseResp);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'BaseResp': baseResp.toMap()};
  }

  factory UserCancelFavorResponse.fromMap(Map<String, dynamic> map) {
    return UserCancelFavorResponse(
      baseResp: BaseResp.fromJson(map['BaseResp']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserCancelFavorResponse.fromJson(String source) =>
      UserCancelFavorResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'UserCancelFavorResponse(BaseResp: $baseResp)';

  @override
  bool operator ==(covariant UserCancelFavorResponse other) {
    if (identical(this, other)) return true;

    return other.baseResp == baseResp;
  }

  @override
  int get hashCode => baseResp.hashCode;

  bool get success => baseResp.success;
}
