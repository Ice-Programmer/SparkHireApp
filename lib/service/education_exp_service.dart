import 'package:dio/dio.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/http/dio_instance.dart';
import 'package:spark_hire_app/model/education_exp/get_current_user_education.dart';
import 'package:spark_hire_app/model/education_exp/modify_education_exp.dart';

class EducationExpService {
  final DioInstance _dioInstance = DioInstance.instance();

  Future<GetCurrentUserEducationExpResponse> getCurrentUserEducationExp(
    GetCurrentUserEducationExpRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/education/exp/current',
        data: req.toJson(),
        options: Options(contentType: 'application/json'),
      );

      final result = GetCurrentUserEducationExpResponse.fromJson(resp.data);

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

  Future<ModifyEducationExpResponse> modifyEducationExp(
    ModifyEducationExpRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/education/exp/modify',
        data: req.toJson(),
        options: Options(contentType: 'application/json'),
      );

      final result = ModifyEducationExpResponse.fromJson(resp.data);

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
