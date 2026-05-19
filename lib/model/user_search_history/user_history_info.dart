// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:spark_hire_app/model/common/base_response.dart';

enum UserHistoryType {
  recruitment(1),
  post(2);

  final int value;

  const UserHistoryType(this.value);

  static UserHistoryType fromValue(int value) {
    return UserHistoryType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => UserHistoryType.recruitment,
    );
  }
}

class UserHistoryInfo {
  final int id;
  final String content;
  final int createdAt;

  UserHistoryInfo({
    required this.id,
    required this.content,
    required this.createdAt,
  });

  UserHistoryInfo copyWith({int? id, String? content, int? createdAt}) {
    return UserHistoryInfo(
      id: id ?? this.id,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'createdAt': createdAt,
    };
  }

  factory UserHistoryInfo.fromMap(Map<String, dynamic> map) {
    return UserHistoryInfo(
      id: map['id'] as int,
      content: map['content'] as String,
      createdAt: map['createdAt'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserHistoryInfo.fromJson(String source) =>
      UserHistoryInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserHistoryInfo(id: $id, content: $content, createdAt: $createdAt)';

  @override
  bool operator ==(covariant UserHistoryInfo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.content == content &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => id.hashCode ^ content.hashCode ^ createdAt.hashCode;
}

class ListCurrentUserSearchHistoryL20Reqeust {
  final UserHistoryType type;

  ListCurrentUserSearchHistoryL20Reqeust({required this.type});

  ListCurrentUserSearchHistoryL20Reqeust copyWith({UserHistoryType? type}) {
    return ListCurrentUserSearchHistoryL20Reqeust(type: type ?? this.type);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'type': type.value};
  }

  factory ListCurrentUserSearchHistoryL20Reqeust.fromMap(
    Map<String, dynamic> map,
  ) {
    return ListCurrentUserSearchHistoryL20Reqeust(
      type: UserHistoryType.fromValue(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListCurrentUserSearchHistoryL20Reqeust.fromJson(String source) =>
      ListCurrentUserSearchHistoryL20Reqeust.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'ListCurrentUserSearchHistoryL20Reqeust(type: $type)';

  @override
  bool operator ==(covariant ListCurrentUserSearchHistoryL20Reqeust other) {
    if (identical(this, other)) return true;

    return other.type == type;
  }

  @override
  int get hashCode => type.hashCode;
}

class ListCurrentUserSearchHistoryL20Response {
  final List<UserHistoryInfo>? historyList;
  final BaseResp baseResp;

  ListCurrentUserSearchHistoryL20Response({
    this.historyList,
    required this.baseResp,
  });

  ListCurrentUserSearchHistoryL20Response copyWith({
    List<UserHistoryInfo>? historyList,
    BaseResp? baseResp,
  }) {
    return ListCurrentUserSearchHistoryL20Response(
      historyList: historyList ?? this.historyList,
      baseResp: baseResp ?? this.baseResp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'historyList': historyList?.map((x) => x.toMap()).toList(),
      'BaseResp': baseResp.toMap(),
    };
  }

  factory ListCurrentUserSearchHistoryL20Response.fromMap(
    Map<String, dynamic> map,
  ) {
    return ListCurrentUserSearchHistoryL20Response(
      historyList:
          map['historyList'] != null
              ? List<UserHistoryInfo>.from(
                (map['historyList']).map<UserHistoryInfo?>(
                  (x) => UserHistoryInfo.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      baseResp: BaseResp.fromJson(map['BaseResp'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListCurrentUserSearchHistoryL20Response.fromJson(String source) =>
      ListCurrentUserSearchHistoryL20Response.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'ListCurrentUserSearchHistoryL20Response(historyList: $historyList, BaseResp: $baseResp)';

  @override
  bool operator ==(covariant ListCurrentUserSearchHistoryL20Response other) {
    if (identical(this, other)) return true;

    return listEquals(other.historyList, historyList) &&
        other.baseResp == baseResp;
  }

  @override
  int get hashCode => historyList.hashCode ^ baseResp.hashCode;

  bool get success => baseResp.success;
}
