import 'package:dio/dio.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/http/dio_instance.dart';
import 'package:spark_hire_app/model/candidate/edit_candidate_profile.dart';
import 'package:spark_hire_app/model/candidate/get_current_candidate.dart';

class CandidateService {
  final DioInstance _dioInstance = DioInstance.instance();

  Future<GetCurrentCandidateResponse> getCurrentCandidate(
    GetCurrentCandidateRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/user/candidate/current/get',
        data: req.toJson(),
        options: Options(contentType: 'application/json'),
      );

      final result = GetCurrentCandidateResponse.fromJson(resp.data);

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

  Future<EditCandidateProfileResponse> editCandidateProfile(
    EditCandidateProfileRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/user/candidate/profile/edit',
        data: req.toJson(),
        options: Options(contentType: 'application/json'),
      );

      final result = EditCandidateProfileResponse.fromJson(resp.data);

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
