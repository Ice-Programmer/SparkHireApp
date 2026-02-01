import 'package:spark_hire_app/model/common/base.dart';
import 'package:spark_hire_app/model/common/base_response.dart';

class SchoolInfo {
  final int id;
  final String schoolName;
  final String schoolIcon;

  SchoolInfo({
    required this.id,
    required this.schoolName,
    required this.schoolIcon,
  });

  factory SchoolInfo.fromJson(Map<String, dynamic> json) {
    return SchoolInfo(
      id: json["id"],
      schoolName: json["schoolName"],
      schoolIcon: json["schoolIcon"],
    );
  }
}

class ListSchoolRequest {
  final Base? base;

  ListSchoolRequest({this.base});

  Map<String, dynamic> toJson() => {'base': base?.toJson()};
}

class ListSchoolResponse {
  final List<SchoolInfo>? schoolList;
  final BaseResp baseResp;

  ListSchoolResponse({this.schoolList, required this.baseResp});

  bool get success => baseResp.success;

  factory ListSchoolResponse.fromJson(Map<String, dynamic> json) {
    return ListSchoolResponse(
      schoolList:
          (json["schoolList"] as List)
              .map((e) => SchoolInfo.fromJson(e))
              .toList(),
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
