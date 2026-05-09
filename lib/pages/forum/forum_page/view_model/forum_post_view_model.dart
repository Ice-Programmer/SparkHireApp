import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/forum/post/forum_post.dart';
import 'package:spark_hire_app/model/forum/post/query_forum_post_page.dart';
import 'package:spark_hire_app/service/forum_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class ForumPostViewModel extends ChangeNotifier {
  final ForumService _service = ForumService();

  // 数据源
  List<ForumPostInfo> _forumPostInfoList = [];
  List<ForumPostInfo> get forumPostInfoList => _forumPostInfoList;

  int _pageNum = 1;
  final int _pageSize = 5;
  ForumPostCondition? _condition;

  // 状态变量
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingMore = false;
  bool get isLoadingMore => _isLoadingMore;

  bool _hasMore = true; // 标记是否还有下一页数据
  bool get hasMore => _hasMore;

  /// 下拉刷新 / 首次加载
  Future<void> refresh({ForumPostCondition? condition}) async {
    if (condition != null) {
      _condition = condition;
    }

    _pageNum = 1;
    _hasMore = true;
    _isLoading = true;
    notifyListeners();

    try {
      final req = QueryForumPostPageRequest(
        pageNum: _pageNum,
        pageSize: _pageSize,
        condition: _condition,
      );

      final response = await _service.queryRecruitmentPage(req);

      // 拿到新数据后直接覆盖列表
      _forumPostInfoList = response.postList ?? [];

      // 判断是否还有更多数据
      // 1. 如果返回的数据小于一页的容量，说明没有下一页了
      // 2. 或者结合后端的 total 字段判断: _ForumPostInfoList.length >= response.total!
      if (_forumPostInfoList.length < _pageSize) {
        _hasMore = false;
      }
    } catch (e) {
      ToastUtils.showErrorMsg("获取 post 信息列表失败: $e");
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
      final req = QueryForumPostPageRequest(
        pageNum: _pageNum,
        pageSize: _pageSize,
        condition: _condition,
      );

      final response = await _service.queryRecruitmentPage(req);
      final newData = response.postList ?? [];

      if (newData.isEmpty) {
        _hasMore = false;
      } else {
        _forumPostInfoList.addAll(newData);

        if (newData.length < _pageSize) {
          _hasMore = false;
        }
      }
    } catch (e) {
      _pageNum--;
      ToastUtils.showErrorMsg("获取 post 信息列表失败: $e");
    } finally {
      _isLoadingMore = false;
      notifyListeners();
    }
  }
}
