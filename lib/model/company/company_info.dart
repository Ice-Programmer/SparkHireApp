// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:spark_hire_app/model/information/geo_info.dart';
import 'package:spark_hire_app/model/information/list_career.dart';

class CompanyInfo {
  final int id;
  final String companyName;
  final String companyLogo;
  final String description;
  final GeoDetailInfo geoInfo;
  final IndustryDetailInfo industryInfo;
  
  CompanyInfo({
    required this.id,
    required this.companyName,
    required this.companyLogo,
    required this.description,
    required this.geoInfo,
    required this.industryInfo,
  });

  CompanyInfo copyWith({
    int? id,
    String? companyName,
    String? companyLogo,
    String? description,
    GeoDetailInfo? geoInfo,
    IndustryDetailInfo? industryInfo,
  }) {
    return CompanyInfo(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      companyLogo: companyLogo ?? this.companyLogo,
      description: description ?? this.description,
      geoInfo: geoInfo ?? this.geoInfo,
      industryInfo: industryInfo ?? this.industryInfo,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyInfo.fromJson(String source) =>
      CompanyInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CompanyInfo(id: $id, companyName: $companyName, companyLogo: $companyLogo, description: $description, geoInfo: $geoInfo, industryInfo: $industryInfo)';
  }

  @override
  bool operator ==(covariant CompanyInfo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.companyName == companyName &&
        other.companyLogo == companyLogo &&
        other.description == description &&
        other.geoInfo == geoInfo &&
        other.industryInfo == industryInfo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        companyName.hashCode ^
        companyLogo.hashCode ^
        description.hashCode ^
        geoInfo.hashCode ^
        industryInfo.hashCode;
  }
}
