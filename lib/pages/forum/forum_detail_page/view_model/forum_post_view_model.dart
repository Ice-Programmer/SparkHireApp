import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/forum/post/fetch_forum_post.dart';
import 'package:spark_hire_app/model/forum/post/forum_post.dart';
import 'package:spark_hire_app/service/forum_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class ForumPostDetailViewModel extends ChangeNotifier {
  final ForumService _service = ForumService();

  ForumPostInfo? _postInfo;
  ForumPostInfo? get postInfo => _postInfo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadPostInfo({required int postId}) async {
    _isLoading = true;
    notifyListeners();

    try {
      final req = FetchForumPostRequest(id: postId);
      final response = await _service.fetchForumPost(req);
      _postInfo = response.postInfo;
    } catch (e) {
      ToastUtils.showErrorMsg("获取公司信息失败: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
