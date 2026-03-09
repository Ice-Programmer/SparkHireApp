import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/recruitment/query_recruitment_page.dart';
import 'package:spark_hire_app/model/recruitment/recruitment_info.dart';
import 'package:spark_hire_app/service/recruitment_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class RecruitmentViewModel extends ChangeNotifier {
  final RecruitmentService _service = RecruitmentService();

  // 数据源
  List<RecruitmentInfo> _recruitmentInfoList = [];
  List<RecruitmentInfo> get recruitmentInfoList => _recruitmentInfoList;

  int _pageNum = 1;
  final int _pageSize = 5;
  RecuritmentCondition? _condition;

  // 状态变量
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  bool _hasMore = true; // 标记是否还有下一页数据
  bool get hasMore => _hasMore;

  /// 下拉刷新 / 首次加载
  Future<void> refresh({RecuritmentCondition? condition}) async {
    if (condition != null) {
      _condition = condition;
    }

    _pageNum = 1;
    _hasMore = true;
    _isLoading = true;
    notifyListeners();

    try {
      final req = QueryRecruitmentPageRequest(
        pageNum: _pageNum,
        pageSize: _pageSize,
        condition: _condition,
      );

      final response = await _service.queryRecruitmentPage(req);

      // 拿到新数据后直接覆盖列表
      _recruitmentInfoList = response.recruitmentList ?? [];

      // 判断是否还有更多数据
      // 1. 如果返回的数据小于一页的容量，说明没有下一页了
      // 2. 或者结合后端的 total 字段判断: _recruitmentInfoList.length >= response.total!
      if (_recruitmentInfoList.length < _pageSize) {
        _hasMore = false;
      }
    } catch (e) {
      // 在这里处理异常，可以引入 Toast 等提示用户网络错误
      ToastUtils.showErrorMsg("获取招聘信息列表失败: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// 上拉加载更多
  Future<void> loadMore() async {
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    _pageNum++; // 页码 +1
    notifyListeners();

    try {
      final req = QueryRecruitmentPageRequest(
        pageNum: _pageNum,
        pageSize: _pageSize,
        condition: _condition,
      );

      final response = await _service.queryRecruitmentPage(req);
      final newData = response.recruitmentList ?? [];

      if (newData.isEmpty) {
        _hasMore = false;
      } else {
        _recruitmentInfoList.addAll(newData);

        if (newData.length < _pageSize) {
          _hasMore = false;
        }
      }
    } catch (e) {
      _pageNum--;
      ToastUtils.showErrorMsg("获取招聘信息列表失败: $e");
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }
}
