# sparkhire_api.api.BizControllerApi

## Load the API package
```dart
import 'package:sparkhire_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**sendVerifyCode**](BizControllerApi.md#sendverifycode) | **POST** /biz/verify/code/ | 


# **sendVerifyCode**
> BaseResponseString sendVerifyCode(verifyCodeRequest)



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getBizControllerApi();
final VerifyCodeRequest verifyCodeRequest = ; // VerifyCodeRequest | 

try {
    final response = api.sendVerifyCode(verifyCodeRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling BizControllerApi->sendVerifyCode: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **verifyCodeRequest** | [**VerifyCodeRequest**](VerifyCodeRequest.md)|  | 

### Return type

[**BaseResponseString**](BaseResponseString.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

