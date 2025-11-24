# sparkhire_api.api.EmployeeWishCareerControllerApi

## Load the API package
```dart
import 'package:sparkhire_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addWishCareer**](EmployeeWishCareerControllerApi.md#addwishcareer) | **POST** /user/employee/career/wish/add | 
[**deleteWishCareer**](EmployeeWishCareerControllerApi.md#deletewishcareer) | **POST** /user/employee/career/wish/delete | 
[**getMyWishCareerList**](EmployeeWishCareerControllerApi.md#getmywishcareerlist) | **GET** /user/employee/career/wish/list/my | 
[**updateWishCareer**](EmployeeWishCareerControllerApi.md#updatewishcareer) | **POST** /user/employee/career/wish/edit | 


# **addWishCareer**
> BaseResponseLong addWishCareer(wishCareerAddRequest)



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getEmployeeWishCareerControllerApi();
final WishCareerAddRequest wishCareerAddRequest = ; // WishCareerAddRequest | 

try {
    final response = api.addWishCareer(wishCareerAddRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeWishCareerControllerApi->addWishCareer: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **wishCareerAddRequest** | [**WishCareerAddRequest**](WishCareerAddRequest.md)|  | 

### Return type

[**BaseResponseLong**](BaseResponseLong.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteWishCareer**
> BaseResponseBoolean deleteWishCareer(deleteRequest)



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getEmployeeWishCareerControllerApi();
final DeleteRequest deleteRequest = ; // DeleteRequest | 

try {
    final response = api.deleteWishCareer(deleteRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeWishCareerControllerApi->deleteWishCareer: $e\n');
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

# **getMyWishCareerList**
> BaseResponseListEmployeeWishCareerVO getMyWishCareerList()



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getEmployeeWishCareerControllerApi();

try {
    final response = api.getMyWishCareerList();
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeWishCareerControllerApi->getMyWishCareerList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BaseResponseListEmployeeWishCareerVO**](BaseResponseListEmployeeWishCareerVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateWishCareer**
> BaseResponseBoolean updateWishCareer(wishCareerEditRequest)



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getEmployeeWishCareerControllerApi();
final WishCareerEditRequest wishCareerEditRequest = ; // WishCareerEditRequest | 

try {
    final response = api.updateWishCareer(wishCareerEditRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EmployeeWishCareerControllerApi->updateWishCareer: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **wishCareerEditRequest** | [**WishCareerEditRequest**](WishCareerEditRequest.md)|  | 

### Return type

[**BaseResponseBoolean**](BaseResponseBoolean.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

