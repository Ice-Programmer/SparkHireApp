import 'package:spark_hire_app/model/common/base.dart';
import 'package:spark_hire_app/model/common/base_response.dart';

class SendVerifyCodeRequest {
  final String email;
  final Base? base;

  const SendVerifyCodeRequest({required this.email, this.base});

  Map<String, dynamic> toJson() => {'email': email, 'base': base?.toJson()};
}


class SendVerifyCodeResponse {
  final BaseResp baseResp;

  const SendVerifyCodeResponse({
    required this.baseResp,
  });

  bool get success => baseResp.success;

  factory SendVerifyCodeResponse.fromJson(Map<String, dynamic> json) {
    return SendVerifyCodeResponse(
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}