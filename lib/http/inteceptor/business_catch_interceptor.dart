import 'package:dio/dio.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/common/base_response.dart';

class BizErrorInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final base = BaseResp.fromJson(response.data);
    if (!base.success) {
      throw BusinessException(base.statusMessage);
    }
    handler.next(response);
  }
}
