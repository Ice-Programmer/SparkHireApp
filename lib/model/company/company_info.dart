// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:spark_hire_app/model/information/geo_info.dart';
import 'package:spark_hire_app/model/information/list_career.dart';

class CompanyInfo {
  final int id;
  final String companyName;
  final String companyLogo;
  final String description;
  final GeoDetailInfo geoInfo;
  final IndustryDetailInfo industryInfo;
  final String backgroundImg;
  final List<String> companyImageList;
  final int favoriteCnt;

  CompanyInfo({
    required this.id,
    required this.companyName,
    required this.companyLogo,
    required this.description,
    required this.geoInfo,
    required this.industryInfo,
    required this.backgroundImg,
    required this.companyImageList,
    required this.favoriteCnt,
  });

  CompanyInfo copyWith({
    int? id,
    String? companyName,
    String? companyLogo,
    String? description,
    GeoDetailInfo? geoInfo,
    IndustryDetailInfo? industryInfo,
    String? backgroundImg,
    List<String>? companyImageList,
    int? favoriteCnt,
  }) {
    return CompanyInfo(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      companyLogo: companyLogo ?? this.companyLogo,
      description: description ?? this.description,
      geoInfo: geoInfo ?? this.geoInfo,
      industryInfo: industryInfo ?? this.industryInfo,
      backgroundImg: backgroundImg ?? this.backgroundImg,
      companyImageList: companyImageList ?? this.companyImageList,
      favoriteCnt: favoriteCnt ?? this.favoriteCnt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'companyName': companyName,
      'companyLogo': companyLogo,
      'description': description,
      'geoInfo': geoInfo.toJson(),
      'industryInfo': industryInfo.toMap(),
      'backgroundImg': backgroundImg,
      'companyImageList': companyImageList,
      'favoriteCnt': favoriteCnt,
    };
  }

  factory CompanyInfo.fromMap(Map<String, dynamic> map) {
    return CompanyInfo(
      id: map['id'] as int,
      companyName: map['companyName'] as String,
      companyLogo: map['companyLogo'] as String,
      description: map['description'] as String,
      geoInfo: GeoDetailInfo.fromJson(map['geoInfo'] as Map<String, dynamic>),
      industryInfo: IndustryDetailInfo.fromMap(
        map['industryInfo'] as Map<String, dynamic>,
      ),
      backgroundImg: map['backgroundImg'] as String,
      favoriteCnt: map['favoriteCnt'] as int,
      companyImageList: List<String>.from(map['companyImageList'] ?? []),
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyInfo.fromJson(String source) =>
      CompanyInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CompanyInfo(id: $id, companyName: $companyName, companyLogo: $companyLogo, description: $description, geoInfo: $geoInfo, industryInfo: $industryInfo, backgroundImg: $backgroundImg, companyImageList: $companyImageList, favoriteCnt: $favoriteCnt)';
  }

  @override
  bool operator ==(covariant CompanyInfo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.companyName == companyName &&
        other.companyLogo == companyLogo &&
        other.description == description &&
        other.geoInfo == geoInfo &&
        other.industryInfo == industryInfo &&
        other.backgroundImg == backgroundImg &&
        listEquals(other.companyImageList, companyImageList) &&
        other.favoriteCnt == favoriteCnt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        companyName.hashCode ^
        companyLogo.hashCode ^
        description.hashCode ^
        geoInfo.hashCode ^
        industryInfo.hashCode ^
        backgroundImg.hashCode ^
        companyImageList.hashCode ^
        favoriteCnt.hashCode;
  }
}
