// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/user/fetch_current_user.dart';

enum PostStatus {
  normal(1),
  reviewing(2),
  block(3);

  final int value;

  const PostStatus(this.value);

  static PostStatus fromValue(int value) {
    return PostStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PostStatus.normal,
    );
  }
}

enum PostType {
  normal(1),
  pinned(2),
  highlight(3);

  final int value;
  const PostType(this.value);

  static PostType fromValue(int value) {
    return PostType.values.firstWhere(
      (e) => e.value == value,
      orElse: () => PostType.normal,
    );
  }
}

class ForumPostInfo {
  final int id;
  final String title;
  final String content;
  final int favouriteCount;
  final int viewCount;
  final PostStatus status;
  final PostType type;
  final int createdAt;
  final UserBasicInfo creatorInfo;
  
  ForumPostInfo({
    required this.id,
    required this.title,
    required this.content,
    required this.favouriteCount,
    required this.viewCount,
    required this.status,
    required this.type,
    required this.createdAt,
    required this.creatorInfo,
  });

  ForumPostInfo copyWith({
    int? id,
    String? title,
    String? content,
    int? favouriteCount,
    int? viewCount,
    PostStatus? status,
    PostType? type,
    int? createdAt,
    UserBasicInfo? creatorInfo,
  }) {
    return ForumPostInfo(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      favouriteCount: favouriteCount ?? this.favouriteCount,
      viewCount: viewCount ?? this.viewCount,
      status: status ?? this.status,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      creatorInfo: creatorInfo ?? this.creatorInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'favouriteCount': favouriteCount,
      'viewCount': viewCount,
      'status': status.value,
      'type': type.value,
      'createdAt': createdAt,
      'creatorInfo': creatorInfo.toMap(),
    };
  }

  factory ForumPostInfo.fromMap(Map<String, dynamic> map) {
    return ForumPostInfo(
      id: map['id'] as int,
      title: map['title'] as String,
      content: map['content'] as String,
      favouriteCount: map['favouriteCount'] as int,
      viewCount: map['viewCount'] as int,
      status: PostStatus.fromValue(map['status']),
      type: PostType.fromValue(map['type']),
      createdAt: map['createdAt'] as int,
      creatorInfo: UserBasicInfo.fromMap(
        map['creatorInfo'] as Map<String, dynamic>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ForumPostInfo.fromJson(String source) =>
      ForumPostInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ForumPost(id: $id, title: $title, content: $content, favouriteCount: $favouriteCount, viewCount: $viewCount, status: $status, type: $type, createdAt: $createdAt, creatorInfo: $creatorInfo)';
  }

  @override
  bool operator ==(covariant ForumPostInfo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.content == content &&
        other.favouriteCount == favouriteCount &&
        other.viewCount == viewCount &&
        other.status == status &&
        other.type == type &&
        other.createdAt == createdAt &&
        other.creatorInfo == creatorInfo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        content.hashCode ^
        favouriteCount.hashCode ^
        viewCount.hashCode ^
        status.hashCode ^
        type.hashCode ^
        createdAt.hashCode ^
        creatorInfo.hashCode;
  }
}
