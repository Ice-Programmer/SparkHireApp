import 'package:dio/dio.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/http/dio_instance.dart';
import 'package:spark_hire_app/model/biz/send_verify_code.dart';

class BizService {
  final DioInstance _dioInstance = DioInstance.instance();

  Future<SendVerifyCodeResponse> sendVerifyCode(
    SendVerifyCodeRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/verify/code/send',
        data: req.toJson(),
        options: Options(contentType: 'application/json'),
      );

      final result = SendVerifyCodeResponse.fromJson(resp.data);

      if (!result.baseResp.success) {
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
