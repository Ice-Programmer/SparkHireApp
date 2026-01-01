import 'package:spark_hire_app/model/common/base_response.dart';

class EditCandidateProfileRequest {
  final String profile;

  EditCandidateProfileRequest({required this.profile});

  Map<String, dynamic> toJson() => {'profile': profile};
}

class EditCandidateProfileResponse {
  final BaseResp baseResp;

  const EditCandidateProfileResponse({required this.baseResp});

  bool get success => baseResp.success;

  factory EditCandidateProfileResponse.fromJson(Map<String, dynamic> json) {
    return EditCandidateProfileResponse(
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
