// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/user/fetch_current_user.dart';

class CommentInfo {
  final int id;
  final String content;
  final int? parentId;
  final int? rootId;
  final int favoriteCnt;
  final int? replyId;
  final UserBasicInfo creatorInfo;
  final UserBasicInfo? replyUserInfo;
  final int createdAt;
  final int? replyNum;

  CommentInfo({
    required this.id,
    required this.content,
    this.parentId,
    this.rootId,
    required this.favoriteCnt,
    this.replyId,
    required this.creatorInfo,
    this.replyUserInfo,
    required this.createdAt,
    this.replyNum,
  });

  CommentInfo copyWith({
    int? id,
    String? content,
    int? parentId,
    int? rootId,
    int? favoriteCnt,
    int? replyId,
    UserBasicInfo? creatorInfo,
    UserBasicInfo? replyUserInfo,
    int? createdAt,
    int? replyNum,
  }) {
    return CommentInfo(
      id: id ?? this.id,
      content: content ?? this.content,
      parentId: parentId ?? this.parentId,
      rootId: rootId ?? this.rootId,
      favoriteCnt: favoriteCnt ?? this.favoriteCnt,
      replyId: replyId ?? this.replyId,
      creatorInfo: creatorInfo ?? this.creatorInfo,
      replyUserInfo: replyUserInfo ?? this.replyUserInfo,
      createdAt: createdAt ?? this.createdAt,
      replyNum: replyNum ?? this.replyNum,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'parentId': parentId,
      'rootId': rootId,
      'favoriteCnt': favoriteCnt,
      'replyId': replyId,
      'creatorInfo': creatorInfo.toMap(),
      'replyUserInfo': replyUserInfo?.toMap(),
      'createdAt': createdAt,
      'replyNum': replyNum,
    };
  }

  factory CommentInfo.fromMap(Map<String, dynamic> map) {
    return CommentInfo(
      id: map['id'] as int,
      content: map['content'] as String,
      parentId: map['parentId'] != null ? map['parentId'] as int : null,
      rootId: map['rootId'] != null ? map['rootId'] as int : null,
      favoriteCnt: map['favoriteCnt'] as int,
      replyId: map['replyId'] != null ? map['replyId'] as int : null,
      creatorInfo: UserBasicInfo.fromJson(
        map['creatorInfo'] as Map<String, dynamic>,
      ),
      replyUserInfo:
          map['replyUserInfo'] != null
              ? UserBasicInfo.fromJson(
                map['replyUserInfo'] as Map<String, dynamic>,
              )
              : null,
      createdAt: map['createdAt'] as int,
      replyNum: map['replyNum'] != null ? map['replyNum'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentInfo.fromJson(String source) =>
      CommentInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentInfo(id: $id, content: $content, parentId: $parentId, rootId: $rootId, favoriteCnt: $favoriteCnt, replyId: $replyId, creatorInfo: $creatorInfo, replyUserInfo: $replyUserInfo, createdAt: $createdAt, replyNum: $replyNum)';
  }

  @override
  bool operator ==(covariant CommentInfo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.content == content &&
        other.parentId == parentId &&
        other.rootId == rootId &&
        other.favoriteCnt == favoriteCnt &&
        other.replyId == replyId &&
        other.creatorInfo == creatorInfo &&
        other.replyUserInfo == replyUserInfo &&
        other.createdAt == createdAt &&
        other.replyNum == replyNum;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        content.hashCode ^
        parentId.hashCode ^
        rootId.hashCode ^
        favoriteCnt.hashCode ^
        replyId.hashCode ^
        creatorInfo.hashCode ^
        replyUserInfo.hashCode ^
        createdAt.hashCode ^
        replyNum.hashCode;
  }
}
