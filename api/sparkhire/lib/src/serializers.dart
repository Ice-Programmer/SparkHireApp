//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:sparkhire_api/src/date_serializer.dart';
import 'package:sparkhire_api/src/model/date.dart';

import 'package:sparkhire_api/src/model/base_response_boolean.dart';
import 'package:sparkhire_api/src/model/base_response_employee_vo.dart';
import 'package:sparkhire_api/src/model/base_response_list_career_vo.dart';
import 'package:sparkhire_api/src/model/base_response_list_city_vo.dart';
import 'package:sparkhire_api/src/model/base_response_list_education_experience_vo.dart';
import 'package:sparkhire_api/src/model/base_response_list_employee_wish_career_vo.dart';
import 'package:sparkhire_api/src/model/base_response_list_industry_vo.dart';
import 'package:sparkhire_api/src/model/base_response_list_major_vo.dart';
import 'package:sparkhire_api/src/model/base_response_list_qualification_vo.dart';
import 'package:sparkhire_api/src/model/base_response_list_school_vo.dart';
import 'package:sparkhire_api/src/model/base_response_long.dart';
import 'package:sparkhire_api/src/model/base_response_string.dart';
import 'package:sparkhire_api/src/model/base_response_token_vo.dart';
import 'package:sparkhire_api/src/model/base_response_user_basic_info.dart';
import 'package:sparkhire_api/src/model/career_detail.dart';
import 'package:sparkhire_api/src/model/career_vo.dart';
import 'package:sparkhire_api/src/model/city_detail.dart';
import 'package:sparkhire_api/src/model/city_vo.dart';
import 'package:sparkhire_api/src/model/delete_request.dart';
import 'package:sparkhire_api/src/model/education_exp_add_request.dart';
import 'package:sparkhire_api/src/model/education_exp_edit_request.dart';
import 'package:sparkhire_api/src/model/education_experience_vo.dart';
import 'package:sparkhire_api/src/model/employee_add_request.dart';
import 'package:sparkhire_api/src/model/employee_edit_request.dart';
import 'package:sparkhire_api/src/model/employee_qualification_vo.dart';
import 'package:sparkhire_api/src/model/employee_vo.dart';
import 'package:sparkhire_api/src/model/employee_wish_career_vo.dart';
import 'package:sparkhire_api/src/model/industry_detail.dart';
import 'package:sparkhire_api/src/model/industry_vo.dart';
import 'package:sparkhire_api/src/model/major_vo.dart';
import 'package:sparkhire_api/src/model/qualification_detail.dart';
import 'package:sparkhire_api/src/model/qualification_vo.dart';
import 'package:sparkhire_api/src/model/school_vo.dart';
import 'package:sparkhire_api/src/model/token_vo.dart';
import 'package:sparkhire_api/src/model/user_basic_info.dart';
import 'package:sparkhire_api/src/model/user_mail_login_request.dart';
import 'package:sparkhire_api/src/model/user_switch_role_request.dart';
import 'package:sparkhire_api/src/model/verify_code_request.dart';
import 'package:sparkhire_api/src/model/wish_career_add_request.dart';
import 'package:sparkhire_api/src/model/wish_career_edit_request.dart';

part 'serializers.g.dart';

@SerializersFor([
  BaseResponseBoolean,
  BaseResponseEmployeeVO,
  BaseResponseListCareerVO,
  BaseResponseListCityVO,
  BaseResponseListEducationExperienceVO,
  BaseResponseListEmployeeWishCareerVO,
  BaseResponseListIndustryVO,
  BaseResponseListMajorVO,
  BaseResponseListQualificationVO,
  BaseResponseListSchoolVO,
  BaseResponseLong,
  BaseResponseString,
  BaseResponseTokenVO,
  BaseResponseUserBasicInfo,
  CareerDetail,
  CareerVO,
  CityDetail,
  CityVO,
  DeleteRequest,
  EducationExpAddRequest,
  EducationExpEditRequest,
  EducationExperienceVO,
  EmployeeAddRequest,
  EmployeeEditRequest,
  EmployeeQualificationVO,
  EmployeeVO,
  EmployeeWishCareerVO,
  IndustryDetail,
  IndustryVO,
  MajorVO,
  QualificationDetail,
  QualificationVO,
  SchoolVO,
  TokenVO,
  UserBasicInfo,
  UserMailLoginRequest,
  UserSwitchRoleRequest,
  VerifyCodeRequest,
  WishCareerAddRequest,
  WishCareerEditRequest,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
