// lib/model/user_role.dart
import 'package:spark_hire_app/model/common/base.dart';
import 'package:spark_hire_app/model/common/base_response.dart';

enum UserRole { unknown, visitor, candidate, hr, admin }

extension UserRoleExt on UserRole {
  static UserRole fromInt(int value) {
    switch (value) {
      case 1:
        return UserRole.visitor;
      case 2:
        return UserRole.candidate;
      case 3:
        return UserRole.hr;
      case 4:
        return UserRole.admin;
      default:
        return UserRole.unknown;
    }
  }

  int get value {
    switch (this) {
      case UserRole.visitor:
        return 1;
      case UserRole.candidate:
        return 2;
      case UserRole.hr:
        return 3;
      case UserRole.admin:
        return 4;
      case UserRole.unknown:
        return 0;
    }
  }
}

enum Gender { female, male, unknow }

extension GenderExt on Gender {
  static Gender fromInt(int value) {
    switch (value) {
      case 0:
        return Gender.female;
      case 1:
        return Gender.male;
      default:
        return Gender.unknow;
    }
  }

  int get value {
    switch (this) {
      case Gender.female:
        return 0;
      case Gender.male:
        return 1;
      case Gender.unknow:
        return 3;
    }
  }
}

class UserBasicInfo {
  final int id; // i64 → int
  final String username;
  final UserRole role;
  final String userAvatar;
  final Gender gender; // i8 → int
  final String email;

  const UserBasicInfo({
    required this.id,
    required this.username,
    required this.role,
    required this.userAvatar,
    required this.gender,
    required this.email,
  });

  factory UserBasicInfo.fromJson(Map<String, dynamic> json) {
    return UserBasicInfo(
      id: json['id'] as int,
      username: json['username'] as String,
      role: UserRoleExt.fromInt(json['role'] as int),
      userAvatar: json['userAvatar'] as String,
      gender: GenderExt.fromInt(json['gender'] as int),
      email: json['email'] as String,
    );
  }
}

class FetchCurrentUserRequest {
  final Base? base;

  const FetchCurrentUserRequest({this.base});

  Map<String, dynamic> toJson() => {'base': base?.toJson()};
}

class FetchCurrentUserResponse {
  final UserBasicInfo basicInfo;
  final BaseResp baseResp;

  const FetchCurrentUserResponse({
    required this.basicInfo,
    required this.baseResp,
  });

  bool get success => baseResp.success;

  factory FetchCurrentUserResponse.fromJson(Map<String, dynamic> json) {
    return FetchCurrentUserResponse(
      basicInfo: UserBasicInfo.fromJson(json['basicInfo']),
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
