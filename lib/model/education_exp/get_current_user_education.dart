import 'package:spark_hire_app/model/candidate/education_status.dart';
import 'package:spark_hire_app/model/common/base.dart';
import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/information/list_major.dart';
import 'package:spark_hire_app/model/information/list_school.dart';

class EducationExpInfo {
  final int id;
  final SchoolInfo schoolInfo;
  final int beginYear;
  final int endYear;
  final MajorInfo majorInfo;
  final String activity;
  final EducationStatus status;

  const EducationExpInfo({
    required this.id,
    required this.schoolInfo,
    required this.beginYear,
    required this.endYear,
    required this.majorInfo,
    required this.activity,
    required this.status,
  });

  factory EducationExpInfo.fromJson(Map<String, dynamic> json) {
    return EducationExpInfo(
      id: json["id"],
      schoolInfo: SchoolInfo.fromJson(json["schoolInfo"]),
      beginYear: json["beginYear"],
      endYear: json["endYear"],
      majorInfo: MajorInfo.fromJson(json["majorInfo"]),
      activity: json["activity"],
      status: EducationStatusExt.fromInt(json["status"]),
    );
  }
}

class GetCurrentUserEducationExpRequest {
  final Base? base;

  const GetCurrentUserEducationExpRequest({this.base});

  Map<String, dynamic> toJson() => {'base': base?.toJson()};
}

class GetCurrentUserEducationExpResponse {
  final List<EducationExpInfo>? educationExpList;
  final BaseResp baseResp;

  const GetCurrentUserEducationExpResponse({
    required this.educationExpList,
    required this.baseResp,
  });

  bool get success => baseResp.success;

  factory GetCurrentUserEducationExpResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return GetCurrentUserEducationExpResponse(
      educationExpList:
          (json["educationExpList"] as List)
              .map((e) => EducationExpInfo.fromJson(e))
              .toList(),
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
