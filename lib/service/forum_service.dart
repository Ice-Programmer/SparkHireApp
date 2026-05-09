import 'package:dio/dio.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/http/dio_instance.dart';
import 'package:spark_hire_app/model/forum/post/query_forum_post_page.dart';

class ForumService {
  final DioInstance _instance = DioInstance.instance();

  Future<QueryForumPostPageResponse> queryRecruitmentPage(
    QueryForumPostPageRequest req,
  ) async {
    try {
      final resp = await _instance.post(
        path: '/api/v1/ice/sparkhire/forum/post/page',
        data: req.toJson(),
      );

      final result = QueryForumPostPageResponse.fromMap(resp.data);

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
