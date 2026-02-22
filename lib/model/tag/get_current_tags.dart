import 'package:spark_hire_app/model/common/base.dart';
import 'package:spark_hire_app/model/common/base_response.dart';
import 'package:spark_hire_app/model/tag/tag_info.dart';

class GetCurrentCandidateTagsRequest {
  final Base? base;

  const GetCurrentCandidateTagsRequest({this.base});

  Map<String, dynamic> toJson() => {'base': base?.toJson()};
}

class GetCurrentCandidateTagsResponse {
  final List<TagInfo> tagList;
  final BaseResp baseResp;

  const GetCurrentCandidateTagsResponse({
    required this.tagList,
    required this.baseResp,
  });

  bool get success => baseResp.success;

  factory GetCurrentCandidateTagsResponse.fromJson(Map<String, dynamic> json) {
    return GetCurrentCandidateTagsResponse(
      tagList:
          (json["tagList"] as List).map((e) => TagInfo.fromJson(e)).toList(),
      baseResp: BaseResp.fromJson(json['BaseResp']),
    );
  }
}
