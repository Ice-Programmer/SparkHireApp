import 'package:dio/dio.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/http/dio_instance.dart';
import 'package:spark_hire_app/model/tag/add_tag.dart';
import 'package:spark_hire_app/model/tag/bind_tag.dart';
import 'package:spark_hire_app/model/tag/get_current_tags.dart';
import 'package:spark_hire_app/model/tag/query_tag.dart';
import 'package:spark_hire_app/model/tag/unbind_tag.dart';
import 'package:spark_hire_app/utils/log_util.dart';

class TagService {
  final DioInstance _dioInstance = DioInstance.instance();

  Future<GetCurrentCandidateTagsResponse> getCurrentCandidateTags(
    GetCurrentCandidateTagsRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/tag/current',
        data: req.toJson(),
      );

      final result = GetCurrentCandidateTagsResponse.fromJson(resp.data);

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

  Future<QueryTagResponse> queryTag(QueryTagRequest req) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/tag/query',
        data: req.toJson(),
      );

      final result = QueryTagResponse.fromJson(resp.data);

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

  Future<BindTagResponse> bindTag(BindTagRequest req) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/tag/bind',
        data: req.toJson(),
      );

      final result = BindTagResponse.fromJson(resp.data);

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

  Future<UnbindTagResponse> unbindTag(UnbindTagRequest req) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/tag/unbind',
        data: req.toJson(),
      );

      final result = UnbindTagResponse.fromJson(resp.data);

      if (!result.success) {
        throw BusinessException(
          result.baseResp.statusMessage,
          result.baseResp.statusCode,
        );
      }

      return result;
    } on DioException catch (e) {
      LogUtils.logger(e.message.toString());
      throw Exception(e.message);
    }
  }

  Future<AddTagResponse> addTag(AddTagRequest req) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/tag/add',
        data: req.toJson(),
      );

      final result = AddTagResponse.fromJson(resp.data);

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
