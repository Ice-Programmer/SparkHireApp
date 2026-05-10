// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/forum/post/forum_post.dart';

class FetchForumPostRequest {
  final int id;

  FetchForumPostRequest({required this.id});

  FetchForumPostRequest copyWith({int? id}) {
    return FetchForumPostRequest(id: id ?? this.id);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id};
  }

  factory FetchForumPostRequest.fromMap(Map<String, dynamic> map) {
    return FetchForumPostRequest(id: map['id'] as int);
  }

  String toJson() => json.encode(toMap());

  factory FetchForumPostRequest.fromJson(String source) =>
      FetchForumPostRequest.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'FetchForumPostRequest(id: $id)';

  @override
  bool operator ==(covariant FetchForumPostRequest other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}

class FetchForumPostResponse {
  final ForumPostInfo? postInfo;
  final BaseResp baseResp;
  FetchForumPostResponse({this.postInfo, required this.baseResp});

  FetchForumPostResponse copyWith({
    ForumPostInfo? postInfo,
    BaseResp? baseResp,
  }) {
    return FetchForumPostResponse(
      postInfo: postInfo ?? this.postInfo,
      baseResp: baseResp ?? this.baseResp,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postInfo': postInfo?.toMap(),
      'BaseResp': baseResp.toMap(),
    };
  }

  factory FetchForumPostResponse.fromMap(Map<String, dynamic> map) {
    return FetchForumPostResponse(
      postInfo:
          map['postInfo'] != null
              ? ForumPostInfo.fromMap(map['postInfo'] as Map<String, dynamic>)
              : null,
      baseResp: BaseResp.fromJson(map['BaseResp'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory FetchForumPostResponse.fromJson(String source) =>
      FetchForumPostResponse.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'FetchForumPostResponse(postInfo: $postInfo, BaseResp: $baseResp)';

  @override
  bool operator ==(covariant FetchForumPostResponse other) {
    if (identical(this, other)) return true;

    return other.postInfo == postInfo && other.baseResp == baseResp;
  }

  @override
  int get hashCode => postInfo.hashCode ^ baseResp.hashCode;

  bool get success => baseResp.success;
}
