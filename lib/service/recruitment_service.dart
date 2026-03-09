import 'package:dio/dio.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/http/dio_instance.dart';
import 'package:spark_hire_app/model/recruitment/fetch_recruitment_info.dart';
import 'package:spark_hire_app/model/recruitment/query_recruitment_page.dart';

class RecruitmentService {
  final DioInstance _dioInstance = DioInstance.instance();

  Future<FetchRecruitmentInfoResponse> getCurrentCandidateTags(
    FetchRecruitmentInfoRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/recruiment/fetch',
        data: req.toJson(),
      );

      final result = FetchRecruitmentInfoResponse.fromJson(resp.data);

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

  Future<QueryRecruitmentPageResponse> queryRecruitmentPage(
    QueryRecruitmentPageRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/recruiment/page',
        data: req.toJson(),
      );

      final result = QueryRecruitmentPageResponse.fromMap(resp.data);

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
