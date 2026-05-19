import 'package:dio/dio.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/http/dio_instance.dart';
import 'package:spark_hire_app/model/user_search_history/user_history_info.dart';

class HistoryService {
  final DioInstance _instance = DioInstance.instance();

  Future<ListCurrentUserSearchHistoryL20Response>
  listCurrentUserSearchHistoryL20(
    ListCurrentUserSearchHistoryL20Reqeust req,
  ) async {
    try {
      final resp = await _instance.post(
        path: '/api/v1/ice/sparkhire/user/history/list/l20',
        data: req.toJson(),
      );

      final result = ListCurrentUserSearchHistoryL20Response.fromMap(resp.data);

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
