import 'package:dio/dio.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/http/dio_instance.dart';
import 'package:spark_hire_app/model/graph/fetch_career_relative_skill_tags.dart';

class GraphService {
  final DioInstance _dioInstance = DioInstance.instance();

  Future<FetchCareerRelativeSkillTagsResponse> fetchCareerRelativeSkillTags(
    FetchCareerRelativeSkillTagsRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/tag/current',
        data: req.toJson(),
      );

      final result = FetchCareerRelativeSkillTagsResponse.fromMap(resp.data);

      if (!result.success) {
        throw BusinessException(
          result.baseResp.statusMessage,
          result.baseResp.statusCode,
        );
      }

      return result;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
