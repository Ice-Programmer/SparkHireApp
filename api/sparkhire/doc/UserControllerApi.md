# sparkhire_api.api.UserControllerApi

## Load the API package
```dart
import 'package:sparkhire_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCurrentLoginUser**](UserControllerApi.md#getcurrentloginuser) | **GET** /user/current | 
[**switchUserRole**](UserControllerApi.md#switchuserrole) | **POST** /user/role/switch | 
[**userRegisterByMail**](UserControllerApi.md#userregisterbymail) | **POST** /user/mail/register | 


# **getCurrentLoginUser**
> BaseResponseUserBasicInfo getCurrentLoginUser()



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getUserControllerApi();

try {
    final response = api.getCurrentLoginUser();
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserControllerApi->getCurrentLoginUser: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BaseResponseUserBasicInfo**](BaseResponseUserBasicInfo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **switchUserRole**
> BaseResponseUserBasicInfo switchUserRole(userSwitchRoleRequest)



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getUserControllerApi();
final UserSwitchRoleRequest userSwitchRoleRequest = ; // UserSwitchRoleRequest | 

try {
    final response = api.switchUserRole(userSwitchRoleRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserControllerApi->switchUserRole: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userSwitchRoleRequest** | [**UserSwitchRoleRequest**](UserSwitchRoleRequest.md)|  | 

### Return type

[**BaseResponseUserBasicInfo**](BaseResponseUserBasicInfo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userRegisterByMail**
> BaseResponseTokenVO userRegisterByMail(userMailRegisterRequest)



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getUserControllerApi();
final UserMailRegisterRequest userMailRegisterRequest = ; // UserMailRegisterRequest | 

try {
    final response = api.userRegisterByMail(userMailRegisterRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling UserControllerApi->userRegisterByMail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userMailRegisterRequest** | [**UserMailRegisterRequest**](UserMailRegisterRequest.md)|  | 

### Return type

[**BaseResponseTokenVO**](BaseResponseTokenVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

