import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/graph/fetch_career_relative_skill_tags.dart';
import 'package:spark_hire_app/model/tag/tag_info.dart';
import 'package:spark_hire_app/service/graph_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class CareerGraphViewModel extends ChangeNotifier {
  final GraphService _graphService = GraphService();

  List<TagInfo> _skillTagList = [];
  List<TagInfo> get skillTagList => _skillTagList;

  bool _isLoadingTagList = false;
  bool get isLoadingTagList => _isLoadingTagList;

  /// 获取职业关联 tag
  Future<void> fetchCareerRelativeSkillTags({required int careerId}) async {
    _isLoadingTagList = true;
    notifyListeners();

    try {
      final req = FetchCareerRelativeSkillTagsRequest(careerId: careerId);
      final response = await _graphService.fetchCareerRelativeSkillTags(req);

      _skillTagList = response.tagList ?? [];
    } catch (e) {
      ToastUtils.showErrorMsg("获取职业关联 tag 失败: $e");
    } finally {
      _isLoadingTagList = false;
      notifyListeners();
    }
  }
}
