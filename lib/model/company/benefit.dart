// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class BenefitInfo {
  final int id;
  final String title;
  final String subTitle;
  final List<BenefitDetail> itemList;
  BenefitInfo({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.itemList,
  });

  BenefitInfo copyWith({
    int? id,
    String? title,
    String? subTitle,
    List<BenefitDetail>? itemList,
  }) {
    return BenefitInfo(
      id: id ?? this.id,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      itemList: itemList ?? this.itemList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'itemList': itemList.map((x) => x.toMap()).toList(),
    };
  }

  factory BenefitInfo.fromMap(Map<String, dynamic> map) {
    return BenefitInfo(
      id: map['id'] as int,
      title: map['title'] as String,
      subTitle: map['subTitle'] as String,
      itemList: List<BenefitDetail>.from(
        (map['itemList']).map<BenefitDetail>(
          (x) => BenefitDetail.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory BenefitInfo.fromJson(String source) =>
      BenefitInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BenefitInfo(id: $id, title: $title, subTitle: $subTitle, itemList: $itemList)';
  }

  @override
  bool operator ==(covariant BenefitInfo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.subTitle == subTitle &&
        listEquals(other.itemList, itemList);
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ subTitle.hashCode ^ itemList.hashCode;
  }
}

class BenefitDetail {
  final int id;
  final String title;
  final String content;
  BenefitDetail({required this.id, required this.title, required this.content});

  BenefitDetail copyWith({int? id, String? title, String? content}) {
    return BenefitDetail(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'title': title, 'content': content};
  }

  factory BenefitDetail.fromMap(Map<String, dynamic> map) {
    return BenefitDetail(
      id: map['id'] as int,
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BenefitDetail.fromJson(String source) =>
      BenefitDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'BenefitDetail(id: $id, title: $title, content: $content)';

  @override
  bool operator ==(covariant BenefitDetail other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.content == content;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ content.hashCode;
}
