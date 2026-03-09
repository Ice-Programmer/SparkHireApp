// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:spark_hire_app/model/candidate/education_status.dart';
import 'package:spark_hire_app/model/company/company_info.dart';
import 'package:spark_hire_app/model/information/geo_info.dart';
import 'package:spark_hire_app/model/information/list_career.dart';
import 'package:spark_hire_app/model/recruitment/job_type.dart';
import 'package:spark_hire_app/model/tag/tag_info.dart';
import 'package:spark_hire_app/model/wish_career/salary_info.dart';

class RecruitmentInfo {
  final int id;
  final String name;
  final CompanyInfo companyInfo;
  final CareerInfo careerInfo;
  final String description;
  final String requirement;
  final EducationStatus educationStatus;
  final JobType jobType;
  final GeoDetailInfo geoInfo;
  final SalaryInfo salaryInfo;
  final List<TagInfo> tagInfoList;

  RecruitmentInfo({
    required this.id,
    required this.name,
    required this.companyInfo,
    required this.careerInfo,
    required this.description,
    required this.requirement,
    required this.educationStatus,
    required this.jobType,
    required this.geoInfo,
    required this.salaryInfo,
    required this.tagInfoList,
  });

  RecruitmentInfo copyWith({
    int? id,
    String? name,
    CompanyInfo? companyInfo,
    CareerInfo? careerInfo,
    String? description,
    String? requirement,
    EducationStatus? educationStatus,
    JobType? jobType,
    GeoDetailInfo? geoInfo,
    SalaryInfo? salaryInfo,
    List<TagInfo>? tagInfoList,
  }) {
    return RecruitmentInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      companyInfo: companyInfo ?? this.companyInfo,
      careerInfo: careerInfo ?? this.careerInfo,
      description: description ?? this.description,
      requirement: requirement ?? this.requirement,
      educationStatus: educationStatus ?? this.educationStatus,
      jobType: jobType ?? this.jobType,
      geoInfo: geoInfo ?? this.geoInfo,
      salaryInfo: salaryInfo ?? this.salaryInfo,
      tagInfoList: tagInfoList ?? this.tagInfoList,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'companyInfo': companyInfo.toMap(),
      'careerInfo': careerInfo.toJson(),
      'description': description,
      'requirement': requirement,
      'educationStatus': educationStatus.value,
      'jobType': jobType.value,
      'geoInfo': geoInfo.toJson(),
      'salaryInfo': salaryInfo.toMap(),
      'tagInfoList': tagInfoList.map((x) => x.toJson()).toList(),
    };
  }

  factory RecruitmentInfo.fromMap(Map<String, dynamic> map) {
    return RecruitmentInfo(
      id: map['id'] as int,
      name: map['name'] as String,
      companyInfo: CompanyInfo.fromMap(
        map['companyInfo'] as Map<String, dynamic>,
      ),
      careerInfo: CareerInfo.fromJson(
        map['careerInfo'] as Map<String, dynamic>,
      ),
      description: map['description'] as String,
      requirement: map['requirement'] as String,
      educationStatus: EducationStatusExt.fromInt(map['educationStatus']),
      jobType: JobTypeExt.fromInt(map['jobType']),
      geoInfo: GeoDetailInfo.fromJson(map['geoInfo'] as Map<String, dynamic>),
      salaryInfo: SalaryInfo.fromMap(map['salaryInfo'] as Map<String, dynamic>),
      tagInfoList: List<TagInfo>.from(
        (map['tagInfoList'] as Iterable).map<TagInfo>(
          (x) => TagInfo.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecruitmentInfo.fromJson(String source) =>
      RecruitmentInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'RecruitmentInfo(id: $id, name: $name, companyInfo: $companyInfo, careerInfo: $careerInfo, description: $description, requirement: $requirement, educationStatus: $educationStatus, jobType: $jobType, geoInfo: $geoInfo, salaryInfo: $salaryInfo, tagInfoList: $tagInfoList)';
  }

  @override
  bool operator ==(covariant RecruitmentInfo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.companyInfo == companyInfo &&
        other.careerInfo == careerInfo &&
        other.description == description &&
        other.requirement == requirement &&
        other.educationStatus == educationStatus &&
        other.jobType == jobType &&
        other.geoInfo == geoInfo &&
        other.salaryInfo == salaryInfo &&
        listEquals(other.tagInfoList, tagInfoList);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        companyInfo.hashCode ^
        careerInfo.hashCode ^
        description.hashCode ^
        requirement.hashCode ^
        educationStatus.hashCode ^
        jobType.hashCode ^
        geoInfo.hashCode ^
        salaryInfo.hashCode ^
        tagInfoList.hashCode;
  }
}
