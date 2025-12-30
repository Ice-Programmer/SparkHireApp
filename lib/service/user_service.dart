import 'package:dio/dio.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/http/dio_instance.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';
import 'package:spark_hire_app/model/user/register_user.dart';
import 'package:spark_hire_app/model/user/user_mail_login.dart';

class UserService {
  final DioInstance _dioInstance = DioInstance.instance();

  Future<FetchCurrentUserResponse> fetchCurrentUser(
    FetchCurrentUserRequest req,
  ) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/user/current/fetch',
        data: req.toJson(),
        options: Options(contentType: 'application/json'),
      );
      final result = FetchCurrentUserResponse.fromJson(resp.data);

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

  Future<UserMailLoginResponse> userMailLogin(UserMailLoginRequest req) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/user/login',
        data: req.toJson(),
        options: Options(contentType: 'application/json'),
      );
      final result = UserMailLoginResponse.fromJson(resp.data);

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

  Future<RegisterUserResonse> registerUser(RegisterUserRequest req) async {
    try {
      final resp = await _dioInstance.post(
        path: '/api/v1/ice/sparkhire/runtime/user/register',
        data: req.toJson(),
        options: Options(contentType: 'application/json'),
      );

      final result = RegisterUserResonse.fromJson(resp.data);

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
