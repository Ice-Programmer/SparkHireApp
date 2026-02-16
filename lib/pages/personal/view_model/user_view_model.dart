import 'package:flutter/material.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';
import 'package:spark_hire_app/service/user_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class UserViewModel extends ChangeNotifier {
  final UserService _userService = UserService();
  UserBasicInfo? _currentUserInfo;

  UserBasicInfo? get currentUserBasicInfo => _currentUserInfo;

  Future<void> loadCurrentUser() async {
    try {
      final response = await _userService.fetchCurrentUser(
        FetchCurrentUserRequest(),
      );
      _currentUserInfo = response.basicInfo;
      notifyListeners();
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，获取当前用户信息失败，请稍后重试');
    }
  }
}
