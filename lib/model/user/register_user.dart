// lib/model/login/user_mail_login_request.dart

import 'package:spark_hire_app/model/common/base.dart';
import 'package:spark_hire_app/model/common/base_response.dart';

class RegisterUserRequest {
  final String email;
  final String verifyCode;
  final Base? base;

  const RegisterUserRequest({
    required this.email,
    required this.verifyCode,
    this.base,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'verifyCode': verifyCode,
    'base': base?.toJson(),
  };
}

class RegisterUserResonse {
  final String accessToken;
  final BaseResp baseResp;

  const RegisterUserResonse({
    required this.accessToken,
    required this.baseResp,
  });

  bool get success => baseResp.success;

  factory RegisterUserResonse.fromJson(Map<String, dynamic> json) {
    return RegisterUserResonse(
      accessToken: json['accessToken'] as String,
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
