// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:spark_hire_app/model/common/base.dart';
import 'package:spark_hire_app/model/common/base_response.dart';

class CareerInfo {
  final int id;
  final String careerName;
  final String careerTypeName;
  final int careerTypeId;
  final String careerIcon;
  final String description;

  const CareerInfo({
    required this.id,
    required this.careerName,
    this.careerTypeName = "",
    required this.careerTypeId,
    this.careerIcon = "",
    required this.description,
  });

  factory CareerInfo.fromJson(Map<String, dynamic> json) {
    return CareerInfo(
      id: json['id'],
      careerName: json['careerName'],
      careerTypeName: json['careerTypeName'] ?? "",
      careerTypeId: json['careerTypeId'] ?? 0,
      careerIcon: json['careerIcon'] ?? "",
      description: json['description'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'careerName': careerName,
      'careerTypeName': careerTypeName,
      'careerTypeId': careerTypeId,
      'careerIcon': careerIcon,
      'description': description,
    };
  }
}

class ListCareerInfoRequest {
  final Base? base;

  const ListCareerInfoRequest({this.base});

  Map<String, dynamic> toJson() => {'Base': base?.toJson()};
}

class ListCareerInfoResponse {
  final List<CareerInfo> careerList;
  final BaseResp baseResp;

  const ListCareerInfoResponse({
    required this.careerList,
    required this.baseResp,
  });

  bool get success => baseResp.success;

  factory ListCareerInfoResponse.fromJson(Map<String, dynamic> json) {
    return ListCareerInfoResponse(
      careerList:
          (json['careerList'] as List)
              .map((e) => CareerInfo.fromJson(e))
              .toList(),
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}

class IndustryDetailInfo {
  final int id;
  final String industryName;

  IndustryDetailInfo({required this.id, required this.industryName});

  IndustryDetailInfo copyWith({int? id, String? industryName}) {
    return IndustryDetailInfo(
      id: id ?? this.id,
      industryName: industryName ?? this.industryName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'industryName': industryName};
  }

  factory IndustryDetailInfo.fromMap(Map<String, dynamic> map) {
    return IndustryDetailInfo(
      id: map['id'] as int,
      industryName: map['industryName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory IndustryDetailInfo.fromJson(String source) =>
      IndustryDetailInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'IndustryDetailInfo(id: $id, industryName: $industryName)';

  @override
  bool operator ==(covariant IndustryDetailInfo other) {
    if (identical(this, other)) return true;

    return other.id == id && other.industryName == industryName;
  }

  @override
  int get hashCode => id.hashCode ^ industryName.hashCode;
}
