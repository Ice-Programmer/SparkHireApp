// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'StatusCode': statusCode,
      'StatusMessage': statusMessage,
      'extra': extra,
    };
  }
}
