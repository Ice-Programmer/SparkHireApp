import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/user_search_history/user_history_info.dart';
import 'package:spark_hire_app/service/history_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class UserSearchHistoryViewModel extends ChangeNotifier {
  final HistoryService _service = HistoryService();

  List<UserHistoryInfo>? _historyList;
  List<UserHistoryInfo>? get historyList => _historyList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadHistoryList() async {
    _isLoading = true;
    notifyListeners();

    try {
      final req = ListCurrentUserSearchHistoryL20Reqeust(
        type: UserHistoryType.recruitment,
      );
      final response = await _service.listCurrentUserSearchHistoryL20(req);
      _historyList = response.historyList;
    } catch (e) {
      ToastUtils.showErrorMsg("获取搜索记录失败：$e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
