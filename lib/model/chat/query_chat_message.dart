// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';

class ChatMessageInfo {
  final int id;
  final String content;
  final UserBasicInfo senderInfo;
  final int messageType;
  final bool isRead;
  final int createdAt;

  ChatMessageInfo({
    required this.id,
    required this.content,
    required this.senderInfo,
    required this.messageType,
    required this.isRead,
    required this.createdAt,
  });

  ChatMessageInfo copyWith({
    int? id,
    String? content,
    UserBasicInfo? senderInfo,
    int? messageType,
    bool? isRead,
    int? createdAt,
  }) {
    return ChatMessageInfo(
      id: id ?? this.id,
      content: content ?? this.content,
      senderInfo: senderInfo ?? this.senderInfo,
      messageType: messageType ?? this.messageType,
      isRead: isRead ?? this.isRead,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'senderInfo': senderInfo.toMap(),
      'messageType': messageType,
      'isRead': isRead,
      'createdAt': createdAt,
    };
  }

  factory ChatMessageInfo.fromMap(Map<String, dynamic> map) {
    return ChatMessageInfo(
      id: map['id'] as int,
      content: map['content'] as String,
      senderInfo: UserBasicInfo.fromMap(
        map['senderInfo'] as Map<String, dynamic>,
      ),
      messageType: map['messageType'] as int,
      isRead: map['isRead'] as bool,
      createdAt: map['createdAt'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatMessageInfo.fromJson(String source) =>
      ChatMessageInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatMessageInfo(id: $id, content: $content, senderInfo: $senderInfo, messageType: $messageType, isRead: $isRead, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant ChatMessageInfo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.content == content &&
        other.senderInfo == senderInfo &&
        other.messageType == messageType &&
        other.isRead == isRead &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        content.hashCode ^
        senderInfo.hashCode ^
        messageType.hashCode ^
        isRead.hashCode ^
        createdAt.hashCode;
  }
}

class QueryChatMessageRequest {
  final int pageSize;
  final int pageNum;
  final int sessionId;

  QueryChatMessageRequest({
    required this.pageSize,
    required this.pageNum,
    required this.sessionId,
  });

  QueryChatMessageRequest copyWith({
    int? pageSize,
    int? pageNum,
    int? sessionId,
  }) {
    return QueryChatMessageRequest(
      pageSize: pageSize ?? this.pageSize,
      pageNum: pageNum ?? this.pageNum,
      sessionId: sessionId ?? this.sessionId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pageSize': pageSize,
      'pageNum': pageNum,
      'sessionId': sessionId,
    };
  }

  factory QueryChatMessageRequest.fromMap(Map<String, dynamic> map) {
    return QueryChatMessageRequest(
      pageSize: map['pageSize'] as int,
      pageNum: map['pageNum'] as int,
      sessionId: map['sessionId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory QueryChatMessageRequest.fromJson(String source) =>
      QueryChatMessageRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'QueryChatMessageRequest(pageSize: $pageSize, pageNum: $pageNum, sessionId: $sessionId)';

  @override
  bool operator ==(covariant QueryChatMessageRequest other) {
    if (identical(this, other)) return true;

    return other.pageSize == pageSize &&
        other.pageNum == pageNum &&
        other.sessionId == sessionId;
  }

  @override
  int get hashCode => pageSize.hashCode ^ pageNum.hashCode ^ sessionId.hashCode;
}

class QueryChatMessageResponse {
  final List<ChatMessageInfo>? messageList;
  final int? total;
  final BaseResp baseResp;

  QueryChatMessageResponse({
    this.messageList,
    this.total,
    required this.baseResp,
  });

  QueryChatMessageResponse copyWith({
    List<ChatMessageInfo>? messageList,
    int? total,
    BaseResp? baseResp,
  }) {
    return QueryChatMessageResponse(
      messageList: messageList ?? this.messageList,
      total: total ?? this.total,
      baseResp: baseResp ?? this.baseResp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messageList': messageList?.map((x) => x.toMap()).toList(),
      'total': total,
      'BaseResp': baseResp.toMap(),
    };
  }

  factory QueryChatMessageResponse.fromMap(Map<String, dynamic> map) {
    return QueryChatMessageResponse(
      messageList:
          map['messageList'] != null
              ? List<ChatMessageInfo>.from(
                (map['messageList']).map<ChatMessageInfo?>(
                  (x) => ChatMessageInfo.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      total: map['total'] != null ? map['total'] as int : null,
      baseResp: BaseResp.fromJson(map['BaseResp'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory QueryChatMessageResponse.fromJson(String source) =>
      QueryChatMessageResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'QueryChatMessageResponse(messageList: $messageList, total: $total, BaseResp: $baseResp)';

  @override
  bool operator ==(covariant QueryChatMessageResponse other) {
    if (identical(this, other)) return true;

    return listEquals(other.messageList, messageList) &&
        other.total == total &&
        other.baseResp == baseResp;
  }

  @override
  int get hashCode => messageList.hashCode ^ total.hashCode ^ baseResp.hashCode;

  bool get success => baseResp.success;
}
