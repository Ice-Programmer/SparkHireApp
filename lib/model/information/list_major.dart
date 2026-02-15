import 'package:spark_hire_app/model/common/base.dart';
import 'package:spark_hire_app/model/common/base_response.dart';

class MajorInfo {
  final int id;
  final String majorName;

  MajorInfo({required this.id, required this.majorName});

  factory MajorInfo.fromJson(Map<String, dynamic> json) {
    return MajorInfo(id: json["id"], majorName: json["majorName"]);
  }
}

class ListMajorRequest {
  final Base? base;

  ListMajorRequest({this.base});

  Map<String, dynamic> toJson() => {'base': base?.toJson()};
}

class ListMajorResponse {
  final List<MajorInfo>? majorList;
  final BaseResp baseResp;

  ListMajorResponse({required this.majorList, required this.baseResp});

  bool get success => baseResp.success;

  factory ListMajorResponse.fromJson(Map<String, dynamic> json) {
    return ListMajorResponse(
      majorList:
          (json["majorList"] as List)
              .map((e) => MajorInfo.fromJson(e))
              .toList(),
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
