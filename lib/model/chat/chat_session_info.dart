// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/user/fetch_current_user.dart';

class ChatSessionInfo {
  final int id;
  final int companyId;
  final String companyName;
  final String recruitmentName;
  final int recruitmentId;
  final UserBasicInfo receiverInfo;
  final int latestMessageCreatedAt;
  final int unreadNum;
  final String lastMessage;

  ChatSessionInfo({
    required this.id,
    required this.companyId,
    required this.companyName,
    required this.recruitmentName,
    required this.recruitmentId,
    required this.receiverInfo,
    required this.latestMessageCreatedAt,
    required this.unreadNum,
    required this.lastMessage,
  });

  ChatSessionInfo copyWith({
    int? id,
    int? companyId,
    String? companyName,
    String? recruitmentName,
    int? recruitmentId,
    UserBasicInfo? receiverInfo,
    int? latestMessageCreatedAt,
    int? unreadNum,
    String? lastMessage,
  }) {
    return ChatSessionInfo(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      companyName: companyName ?? this.companyName,
      recruitmentName: recruitmentName ?? this.recruitmentName,
      recruitmentId: recruitmentId ?? this.recruitmentId,
      receiverInfo: receiverInfo ?? this.receiverInfo,
      latestMessageCreatedAt:
          latestMessageCreatedAt ?? this.latestMessageCreatedAt,
      unreadNum: unreadNum ?? this.unreadNum,
      lastMessage: lastMessage ?? this.lastMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'companyId': companyId,
      'companyName': companyName,
      'recruitmentName': recruitmentName,
      'recruitmentId': recruitmentId,
      'receiverInfo': receiverInfo.toMap(),
      'latestMessageCreatedAt': latestMessageCreatedAt,
      'unreadNum': unreadNum,
      'lastMessage': lastMessage,
    };
  }

  factory ChatSessionInfo.fromMap(Map<String, dynamic> map) {
    return ChatSessionInfo(
      id: map['id'] as int,
      companyId: map['companyId'] as int,
      companyName: map['companyName'] as String,
      recruitmentName: map['recruitmentName'] as String,
      recruitmentId: map['recruitmentId'] as int,
      receiverInfo: UserBasicInfo.fromMap(
        map['receiverInfo'] as Map<String, dynamic>,
      ),
      latestMessageCreatedAt: map['latestMessageCreatedAt'] as int,
      unreadNum: map['unreadNum'] as int,
      lastMessage: map['lastMessage'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatSessionInfo.fromJson(String source) =>
      ChatSessionInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatSessionInfo(id: $id, companyId: $companyId, companyName: $companyName, recruitmentName: $recruitmentName, recruitmentId: $recruitmentId, receiverInfo: $receiverInfo, latestMessageCreatedAt: $latestMessageCreatedAt, unreadNum: $unreadNum, lastMessage: $lastMessage)';
  }

  @override
  bool operator ==(covariant ChatSessionInfo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.companyId == companyId &&
        other.companyName == companyName &&
        other.recruitmentName == recruitmentName &&
        other.recruitmentId == recruitmentId &&
        other.receiverInfo == receiverInfo &&
        other.latestMessageCreatedAt == latestMessageCreatedAt &&
        other.unreadNum == unreadNum &&
        other.lastMessage == lastMessage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        companyId.hashCode ^
        companyName.hashCode ^
        recruitmentName.hashCode ^
        recruitmentId.hashCode ^
        receiverInfo.hashCode ^
        latestMessageCreatedAt.hashCode ^
        unreadNum.hashCode ^
        lastMessage.hashCode;
  }
}
