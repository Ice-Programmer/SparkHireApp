//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:built_value/serializer.dart';
import 'package:sparkhire_api/src/serializers.dart';
import 'package:sparkhire_api/src/auth/api_key_auth.dart';
import 'package:sparkhire_api/src/auth/basic_auth.dart';
import 'package:sparkhire_api/src/auth/bearer_auth.dart';
import 'package:sparkhire_api/src/auth/oauth.dart';
import 'package:sparkhire_api/src/api/biz_controller_api.dart';
import 'package:sparkhire_api/src/api/education_exp_controller_api.dart';
import 'package:sparkhire_api/src/api/employee_controller_api.dart';
import 'package:sparkhire_api/src/api/employee_wish_career_controller_api.dart';
import 'package:sparkhire_api/src/api/information_controller_api.dart';
import 'package:sparkhire_api/src/api/login_controller_api.dart';
import 'package:sparkhire_api/src/api/user_controller_api.dart';

class SparkhireApi {
  static const String basePath = r'http://localhost:8000/api';

  final Dio dio;
  final Serializers serializers;

  SparkhireApi({
    Dio? dio,
    Serializers? serializers,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : this.serializers = serializers ?? standardSerializers,
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Get BizControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  BizControllerApi getBizControllerApi() {
    return BizControllerApi(dio, serializers);
  }

  /// Get EducationExpControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  EducationExpControllerApi getEducationExpControllerApi() {
    return EducationExpControllerApi(dio, serializers);
  }

  /// Get EmployeeControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  EmployeeControllerApi getEmployeeControllerApi() {
    return EmployeeControllerApi(dio, serializers);
  }

  /// Get EmployeeWishCareerControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  EmployeeWishCareerControllerApi getEmployeeWishCareerControllerApi() {
    return EmployeeWishCareerControllerApi(dio, serializers);
  }

  /// Get InformationControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  InformationControllerApi getInformationControllerApi() {
    return InformationControllerApi(dio, serializers);
  }

  /// Get LoginControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  LoginControllerApi getLoginControllerApi() {
    return LoginControllerApi(dio, serializers);
  }

  /// Get UserControllerApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  UserControllerApi getUserControllerApi() {
    return UserControllerApi(dio, serializers);
  }
}
