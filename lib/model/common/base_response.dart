abstract class BaseResponse {
  BaseResp get baseResp;
}

class BaseResp {
  final int statusCode;
  final String statusMessage;
  final Map<String, String>? extra;

  const BaseResp({
    required this.statusCode,
    required this.statusMessage,
    this.extra,
  });

  bool get success => statusCode == 0;

  factory BaseResp.error(int code, String message) {
    return BaseResp(statusCode: code, statusMessage: message);
  }

  factory BaseResp.fromJson(Map<String, dynamic> json) {
    return BaseResp(
      statusCode: json['StatusCode'] as int,
      statusMessage: json['StatusMessage'] as String,
      extra:
          json['extra'] == null
              ? null
              : Map<String, String>.from(json['extra']),
    );
  }
}
