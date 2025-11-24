# sparkhire_api.api.LoginControllerApi

## Load the API package
```dart
import 'package:sparkhire_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**userLoginByMail**](LoginControllerApi.md#userloginbymail) | **POST** /user/login/mail | 


# **userLoginByMail**
> BaseResponseTokenVO userLoginByMail(userMailLoginRequest)



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getLoginControllerApi();
final UserMailLoginRequest userMailLoginRequest = ; // UserMailLoginRequest | 

try {
    final response = api.userLoginByMail(userMailLoginRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LoginControllerApi->userLoginByMail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userMailLoginRequest** | [**UserMailLoginRequest**](UserMailLoginRequest.md)|  | 

### Return type

[**BaseResponseTokenVO**](BaseResponseTokenVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

