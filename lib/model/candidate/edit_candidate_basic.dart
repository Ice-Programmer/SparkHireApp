import 'package:spark_hire_app/model/candidate/job_status.dart';
import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';

class EditCandidateBasicInfoRequest {
  final String username;
  final String avatar;
  final JobStatus status;
  final Gender gender;

  EditCandidateBasicInfoRequest({
    required this.username,
    required this.avatar,
    required this.status,
    required this.gender,
  });

  Map<String, dynamic> toJson() => {
    "username": username,
    "avatar": avatar,
    "status": status.value,
    "gender": gender.value,
  };
}

class EditCandidateBasicInfoResponse {
  final BaseResp baseResp;
  const EditCandidateBasicInfoResponse({required this.baseResp});

  bool get success => baseResp.success;

  factory EditCandidateBasicInfoResponse.fromJson(Map<String, dynamic> json) {
    return EditCandidateBasicInfoResponse(
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
