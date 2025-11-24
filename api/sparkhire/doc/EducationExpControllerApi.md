# sparkhire_api.api.EducationExpControllerApi

## Load the API package
```dart
import 'package:sparkhire_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addEducationExp**](EducationExpControllerApi.md#addeducationexp) | **POST** /user/employee/education/experience/add | 
[**deleteEducationExp**](EducationExpControllerApi.md#deleteeducationexp) | **POST** /user/employee/education/experience/delete | 
[**editEducationExp**](EducationExpControllerApi.md#editeducationexp) | **POST** /user/employee/education/experience/edit | 
[**getMyEducationExpVOList**](EducationExpControllerApi.md#getmyeducationexpvolist) | **GET** /user/employee/education/experience/my | 


# **addEducationExp**
> BaseResponseLong addEducationExp(educationExpAddRequest)



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getEducationExpControllerApi();
final EducationExpAddRequest educationExpAddRequest = ; // EducationExpAddRequest | 

try {
    final response = api.addEducationExp(educationExpAddRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EducationExpControllerApi->addEducationExp: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **educationExpAddRequest** | [**EducationExpAddRequest**](EducationExpAddRequest.md)|  | 

### Return type

[**BaseResponseLong**](BaseResponseLong.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteEducationExp**
> BaseResponseBoolean deleteEducationExp(deleteRequest)



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getEducationExpControllerApi();
final DeleteRequest deleteRequest = ; // DeleteRequest | 

try {
    final response = api.deleteEducationExp(deleteRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EducationExpControllerApi->deleteEducationExp: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deleteRequest** | [**DeleteRequest**](DeleteRequest.md)|  | 

### Return type

[**BaseResponseBoolean**](BaseResponseBoolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **editEducationExp**
> BaseResponseBoolean editEducationExp(educationExpEditRequest)



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getEducationExpControllerApi();
final EducationExpEditRequest educationExpEditRequest = ; // EducationExpEditRequest | 

try {
    final response = api.editEducationExp(educationExpEditRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EducationExpControllerApi->editEducationExp: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **educationExpEditRequest** | [**EducationExpEditRequest**](EducationExpEditRequest.md)|  | 

### Return type

[**BaseResponseBoolean**](BaseResponseBoolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyEducationExpVOList**
> BaseResponseListEducationExperienceVO getMyEducationExpVOList()



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getEducationExpControllerApi();

try {
    final response = api.getMyEducationExpVOList();
    print(response);
} catch on DioException (e) {
    print('Exception when calling EducationExpControllerApi->getMyEducationExpVOList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BaseResponseListEducationExperienceVO**](BaseResponseListEducationExperienceVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

