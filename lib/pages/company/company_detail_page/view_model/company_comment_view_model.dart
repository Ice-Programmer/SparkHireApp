import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/company/comment.dart';
import 'package:spark_hire_app/model/company/query_company_comment_page.dart';
import 'package:spark_hire_app/service/company_service.dart';

class CompanyCommentViewModel extends ChangeNotifier {
  final CompanyService _companyService = CompanyService();

  List<CommentInfo> _comments = [];
  int _total = 0;
  int _currentPage = 1;
  final int _pageSize = 10;

  bool _isLoading = false;
  String? _errorMessage;

  List<CommentInfo> get comments => _comments;
  int get total => _total;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasMore => _comments.length < _total;

  /// 初始化或刷新评论列表
  Future<void> refreshComments(int companyId) async {
    _currentPage = 1;
    _comments = [];
    _errorMessage = null;
    await fetchComments(companyId);
  }

  /// 加载更多评论
  Future<void> loadMore(int companyId) async {
    if (_isLoading || !hasMore) return;
    _currentPage++;
    await fetchComments(companyId);
  }

  /// 核心获取数据方法
  Future<void> fetchComments(int companyId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // 构建请求参数
      final request = QueryCompanyCommentPageRequest(
        pageSize: _pageSize,
        pageNum: _currentPage,
        condition: CompanyCommentCondition(companyId: companyId),
      );

      final response = await _companyService.queryCompanyCommentPage(request);

      if (response.success) {
        if (_currentPage == 1) {
          _comments = response.commentInfoList;
        } else {
          _comments.addAll(response.commentInfoList);
        }
        _total = response.total;
      } else {
        _errorMessage = "加载失败: ${response.baseResp.statusMessage}";
      }
    } catch (e) {
      _errorMessage = "网络错误或系统异常";
      if (_currentPage > 1) _currentPage--;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
