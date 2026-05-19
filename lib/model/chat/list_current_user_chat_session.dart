// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:spark_hire_app/model/chat/chat_session_info.dart';
import 'package:spark_hire_app/model/common/base.dart';
import 'package:spark_hire_app/model/common/base_response.dart';

class ListCurrentUserChatSessionRequest {
  final Base? base;

  ListCurrentUserChatSessionRequest({this.base});

  ListCurrentUserChatSessionRequest copyWith({Base? base}) {
    return ListCurrentUserChatSessionRequest(base: base ?? this.base);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'Base': base?.toJson()};
  }

  factory ListCurrentUserChatSessionRequest.fromMap(Map<String, dynamic> map) {
    return ListCurrentUserChatSessionRequest(
      base:
          map['Base'] != null
              ? Base.fromJson(map['Base'] as Map<String, dynamic>)
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListCurrentUserChatSessionRequest.fromJson(String source) =>
      ListCurrentUserChatSessionRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'ListCurrentUserChatSessionRequest(Base: $base)';

  @override
  bool operator ==(covariant ListCurrentUserChatSessionRequest other) {
    if (identical(this, other)) return true;

    return other.base == base;
  }

  @override
  int get hashCode => base.hashCode;
}

class ListCurrentUserChatSessionResponse {
  final List<ChatSessionInfo>? sessionList;
  final BaseResp baseResp;

  ListCurrentUserChatSessionResponse({
    this.sessionList,
    required this.baseResp,
  });

  ListCurrentUserChatSessionResponse copyWith({
    List<ChatSessionInfo>? sessionList,
    BaseResp? baseResp,
  }) {
    return ListCurrentUserChatSessionResponse(
      sessionList: sessionList ?? this.sessionList,
      baseResp: baseResp ?? this.baseResp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sessionList': sessionList?.map((x) => x.toMap()).toList(),
      'BaseResp': baseResp.toMap(),
    };
  }

  factory ListCurrentUserChatSessionResponse.fromMap(Map<String, dynamic> map) {
    return ListCurrentUserChatSessionResponse(
      sessionList:
          map['sessionList'] != null
              ? List<ChatSessionInfo>.from(
                (map['sessionList']).map<ChatSessionInfo?>(
                  (x) => ChatSessionInfo.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      baseResp: BaseResp.fromJson(map['BaseResp'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListCurrentUserChatSessionResponse.fromJson(String source) =>
      ListCurrentUserChatSessionResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'ListCurrentUserChatSessionResponse(sessionList: $sessionList, BaseResp: $baseResp)';

  @override
  bool operator ==(covariant ListCurrentUserChatSessionResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.sessionList, sessionList) &&
        other.baseResp == baseResp;
  }

  @override
  int get hashCode => sessionList.hashCode ^ baseResp.hashCode;

  bool get success => baseResp.success;
}
