import 'package:dio/dio.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/http/dio_instance.dart';
import 'package:spark_hire_app/model/interview/fetch_current_user_interview.dart';

class InterviewService {
  final DioInstance _dioInstance = DioInstance.instance();

  Future<FetchCurrentUserInterviewResponse> queryRecruitmentPage(
    FetchCurrentUserInterviewRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/interview/current/fetch',
        data: req.toJson(),
      );

      final result = FetchCurrentUserInterviewResponse.fromMap(resp.data);

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
