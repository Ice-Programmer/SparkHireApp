import 'package:dio/dio.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/http/dio_instance.dart';
import 'package:spark_hire_app/model/information/list_career.dart';
import 'package:spark_hire_app/model/information/list_school.dart';

class InformationService {
  final DioInstance _dioInstance = DioInstance.instance();

  Future<ListCareerInfoResponse> listCareerInfo(
    ListCareerInfoRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/career/list',
        data: req.toJson(),
        options: Options(contentType: 'application/json'),
      );

      final result = ListCareerInfoResponse.fromJson(resp.data);

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

  Future<ListSchoolResponse> listSchoolList(ListSchoolRequest req) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/school/list',
        data: req.toJson(),
      );

      final result = ListSchoolResponse.fromJson(resp.data);

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
