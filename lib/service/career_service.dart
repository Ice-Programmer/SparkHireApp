import 'package:dio/dio.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/http/dio_instance.dart';
import 'package:spark_hire_app/model/career_exp/delete_career_experience.dart';
import 'package:spark_hire_app/model/career_exp/get_current_user_career_exp.dart';
import 'package:spark_hire_app/model/career_exp/modify_career_experience.dart';
import 'package:spark_hire_app/model/wish_career/get_current_wish_career.dart';

class CareerService {
  final DioInstance _dioInstance = DioInstance.instance();

  Future<GetCurrentUserCareerExperienceResponse> getCurrentUserCareerExp(
    GetCurrentUserCareerExperienceRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/career/exp/current',
        data: req.toJson(),
        options: Options(contentType: 'application/json'),
      );

      final result = GetCurrentUserCareerExperienceResponse.fromJson(resp.data);

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

  Future<ModifyCareerExperienceResponse> modifyCareerExperience(
    ModifyCareerExperienceRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/career/exp/modify',
        data: req.toJson(),
        options: Options(contentType: 'application/json'),
      );

      final result = ModifyCareerExperienceResponse.fromJson(resp.data);

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

  Future<DeleteCareerExperienceResponse> deleteCareerExperience(
    DeleteCareerExperienceRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/career/exp/delete',
        data: req.toJson(),
        options: Options(contentType: 'application/json'),
      );

      final result = DeleteCareerExperienceResponse.fromJson(resp.data);

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

  Future<GetCurrentWishCareerResponse> getCurrentWishCareer(
    GetCurrentWishCareerRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/wish/career/current',
        data: req.toJson(),
        options: Options(contentType: 'application/json'),
      );

      final result = GetCurrentWishCareerResponse.fromJson(resp.data);

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
