# sparkhire_api.api.EmployeeControllerApi

## Load the API package
```dart
import 'package:sparkhire_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addEmployee**](EmployeeControllerApi.md#addemployee) | **POST** /user/employee/add | 
[**editEmployee**](EmployeeControllerApi.md#editemployee) | **POST** /user/employee/edit | 
[**getMyEmployeeVO**](EmployeeControllerApi.md#getmyemployeevo) | **GET** /user/employee/get/my | 


# **addEmployee**
> BaseResponseLong addEmployee(employeeAddRequest)



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getEmployeeControllerApi();
final EmployeeAddRequest employeeAddRequest = ; // EmployeeAddRequest | 

try {
    final response = api.addEmployee(employeeAddRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeControllerApi->addEmployee: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **employeeAddRequest** | [**EmployeeAddRequest**](EmployeeAddRequest.md)|  | 

### Return type

[**BaseResponseLong**](BaseResponseLong.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **editEmployee**
> BaseResponseBoolean editEmployee(employeeEditRequest)



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getEmployeeControllerApi();
final EmployeeEditRequest employeeEditRequest = ; // EmployeeEditRequest | 

try {
    final response = api.editEmployee(employeeEditRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeControllerApi->editEmployee: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **employeeEditRequest** | [**EmployeeEditRequest**](EmployeeEditRequest.md)|  | 

### Return type

[**BaseResponseBoolean**](BaseResponseBoolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyEmployeeVO**
> BaseResponseEmployeeVO getMyEmployeeVO()



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getEmployeeControllerApi();

try {
    final response = api.getMyEmployeeVO();
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeControllerApi->getMyEmployeeVO: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BaseResponseEmployeeVO**](BaseResponseEmployeeVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

