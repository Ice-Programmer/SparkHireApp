import 'package:flutter/material.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/tag/get_current_tags.dart';
import 'package:spark_hire_app/model/tag/tag_info.dart';
import 'package:spark_hire_app/service/tag_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class TagViewModel extends ChangeNotifier {
  final TagService _tagService = TagService();
  List<TagInfo>? _tagList;

  List<TagInfo>? get tagList => _tagList;

  Future<void> loadCurrentTagList() async {
    try {
      final response = await _tagService.getCurrentCandidateTags(
        GetCurrentCandidateTagsRequest(),
      );
      _tagList = response.tagList;
      notifyListeners();
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，获取当前用户 Tag 信息失败，请稍后重试');
    }
  }
}
