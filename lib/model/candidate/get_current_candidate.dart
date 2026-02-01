import 'package:spark_hire_app/model/candidate/education_status.dart';
import 'package:spark_hire_app/model/candidate/job_status.dart';
import 'package:spark_hire_app/model/common/base.dart';
import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/information/geo_info.dart';
import 'package:spark_hire_app/model/tag/tag_info.dart';

class ContractInfo {
  final String? phone;
  final String email;
  final GeoDetailInfo geoInfo;

  ContractInfo({this.phone, required this.email, required this.geoInfo});

  factory ContractInfo.fromJson(Map<String, dynamic> json) {
    return ContractInfo(
      email: json['email'],
      geoInfo: GeoDetailInfo.fromJson(json['geoInfo']),
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      if (phone != null) "phone": phone,
      "geoInfo": geoInfo.toJson(),
    };
  }
}

class CandidateInfo {
  final int age;
  final String profile;
  final JobStatus jobStatus;
  final ContractInfo contractInfo;
  final int graduationYear;
  final EducationStatus educationStatus;
  final int? id;
  final List<TagInfo>? tagList;

  CandidateInfo({
    required this.age,
    required this.profile,
    required this.jobStatus,
    required this.contractInfo,
    required this.graduationYear,
    required this.educationStatus,
    this.id,
    this.tagList,
  });

  CandidateInfo copyWith({
    int? age,
    String? profile,
    JobStatus? jobStatus,
    ContractInfo? contractInfo,
    int? graduationYear,
    EducationStatus? educationStatus,
    int? id,
    List<TagInfo>? tagList,
  }) {
    return CandidateInfo(
      age: age ?? this.age,
      profile: profile ?? this.profile,
      jobStatus: jobStatus ?? this.jobStatus,
      contractInfo: contractInfo ?? this.contractInfo,
      graduationYear: graduationYear ?? this.graduationYear,
      educationStatus: educationStatus ?? this.educationStatus,
      id: id ?? this.id,
      tagList: tagList ?? this.tagList,
    );
  }

  factory CandidateInfo.fromJson(Map<String, dynamic> json) {
    return CandidateInfo(
      age: json['age'],
      profile: json['profile'],
      jobStatus: JobStatusExt.fromInt(json['jobStatus']),
      contractInfo: ContractInfo.fromJson(json['contractInfo']),
      graduationYear: json['graduationYear'],
      educationStatus: EducationStatusExt.fromInt(json['educationStatus']),
      id: json['id'],
      tagList:
          json['tagList'] != null
              ? (json['tagList'] as List)
                  .map((e) => TagInfo.fromJson(e))
                  .toList()
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'age': age,
      'profile': profile,
      'jobStatus': jobStatus.value,
      'contractInfo': contractInfo.toJson(),
      'graduationYear': graduationYear,
      'educationStatus': educationStatus.value,
      if (id != null) 'id': id,
      if (tagList != null) 'tagList': tagList!.map((e) => e.toJson()).toList(),
    };
  }
}

class GetCurrentCandidateRequest {
  final Base? base;

  const GetCurrentCandidateRequest({this.base});

  Map<String, dynamic> toJson() => {'base': base?.toJson()};
}

class GetCurrentCandidateResponse {
  final CandidateInfo? candidateInfo;
  final BaseResp baseResp;

  const GetCurrentCandidateResponse({
    required this.candidateInfo,
    required this.baseResp,
  });

  bool get success => baseResp.success;

  factory GetCurrentCandidateResponse.fromJson(Map<String, dynamic> json) {
    return GetCurrentCandidateResponse(
      candidateInfo: CandidateInfo.fromJson(json['candidateInfo']),
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
