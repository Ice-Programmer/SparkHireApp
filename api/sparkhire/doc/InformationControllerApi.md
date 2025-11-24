# sparkhire_api.api.InformationControllerApi

## Load the API package
```dart
import 'package:sparkhire_api/api.dart';
```

All URIs are relative to *http://localhost:8000/api*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getCareerList**](InformationControllerApi.md#getcareerlist) | **GET** /information/career/list | 
[**getCityList**](InformationControllerApi.md#getcitylist) | **GET** /information/city/list | 
[**getIndustryList**](InformationControllerApi.md#getindustrylist) | **GET** /information/industry/list | 
[**getMajorList**](InformationControllerApi.md#getmajorlist) | **GET** /information/major/list | 
[**getQualificationList**](InformationControllerApi.md#getqualificationlist) | **GET** /information/qualification/list | 
[**getSchoolList**](InformationControllerApi.md#getschoollist) | **GET** /information/school/list | 


# **getCareerList**
> BaseResponseListCareerVO getCareerList()



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getInformationControllerApi();

try {
    final response = api.getCareerList();
    print(response);
} catch on DioException (e) {
    print('Exception when calling InformationControllerApi->getCareerList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BaseResponseListCareerVO**](BaseResponseListCareerVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCityList**
> BaseResponseListCityVO getCityList()



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getInformationControllerApi();

try {
    final response = api.getCityList();
    print(response);
} catch on DioException (e) {
    print('Exception when calling InformationControllerApi->getCityList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BaseResponseListCityVO**](BaseResponseListCityVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getIndustryList**
> BaseResponseListIndustryVO getIndustryList()



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getInformationControllerApi();

try {
    final response = api.getIndustryList();
    print(response);
} catch on DioException (e) {
    print('Exception when calling InformationControllerApi->getIndustryList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BaseResponseListIndustryVO**](BaseResponseListIndustryVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMajorList**
> BaseResponseListMajorVO getMajorList()



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getInformationControllerApi();

try {
    final response = api.getMajorList();
    print(response);
} catch on DioException (e) {
    print('Exception when calling InformationControllerApi->getMajorList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BaseResponseListMajorVO**](BaseResponseListMajorVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getQualificationList**
> BaseResponseListQualificationVO getQualificationList()



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getInformationControllerApi();

try {
    final response = api.getQualificationList();
    print(response);
} catch on DioException (e) {
    print('Exception when calling InformationControllerApi->getQualificationList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BaseResponseListQualificationVO**](BaseResponseListQualificationVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSchoolList**
> BaseResponseListSchoolVO getSchoolList()



### Example
```dart
import 'package:sparkhire_api/api.dart';

final api = SparkhireApi().getInformationControllerApi();

try {
    final response = api.getSchoolList();
    print(response);
} catch on DioException (e) {
    print('Exception when calling InformationControllerApi->getSchoolList: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BaseResponseListSchoolVO**](BaseResponseListSchoolVO.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: */*

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

