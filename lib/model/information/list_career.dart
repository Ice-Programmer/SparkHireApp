import 'package:spark_hire_app/model/common/base.dart';
import 'package:spark_hire_app/model/common/base_response.dart';

class CareerInfo {
  final int id;
  final String careerName;
  final String careerTypeName;
  final int careerTypeId;

  const CareerInfo({
    required this.id,
    required this.careerName,
    required this.careerTypeName,
    required this.careerTypeId,
  });

  factory CareerInfo.fromJson(Map<String, dynamic> json) {
    return CareerInfo(
      id: json['id'],
      careerName: json['careerName'],
      careerTypeName: json['careerTypeName'],
      careerTypeId: json['careerTypeId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'careerName': careerName,
      'careerTypeName': careerTypeName,
      'careerTypeId': careerTypeId,
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
