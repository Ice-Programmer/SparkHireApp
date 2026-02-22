// 文件路径：lib/provider/user_provider.dart
import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';

class UserProvider extends ChangeNotifier {
  UserBasicInfo? _userInfo;

  // 获取用户信息
  UserBasicInfo? get userInfo => _userInfo;

  // 判断是否已登录
  bool get isLogin => _userInfo != null;

  // 获取当前用户ID (如果未登录返回 0 或抛出异常，视你的业务而定)
  int get currentUserId => _userInfo?.id ?? 0;

  /// 更新/保存用户信息 (比如登录成功、或修改个人资料后调用)
  void setUserInfo(UserBasicInfo? info) {
    _userInfo = info;
    notifyListeners();
  }

  /// 退出登录时清除信息
  void clearUserInfo() {
    _userInfo = null;
    notifyListeners();
  }
}
