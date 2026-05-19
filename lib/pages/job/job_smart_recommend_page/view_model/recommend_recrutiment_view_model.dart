import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/recruitment/smart_recommend_recruitment.dart';
import 'package:spark_hire_app/service/recruitment_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class RecommendRecrutimentViewModel extends ChangeNotifier {
  final RecruitmentService _service = RecruitmentService();

  RecommendRecruitmentResult? _recommendRecruitmentResult;
  RecommendRecruitmentResult? get recommendRecruitmentResult =>
      _recommendRecruitmentResult;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadRecommendRecruitmentResult() async {
    _isLoading = true;
    notifyListeners();

    try {
      final req = SmartRecommendRecruitmentRequest();
      final response = await _service.smartRecommendRecruitment(req);
      _recommendRecruitmentResult = response.recommendRecruitmentResult;
    } catch (e) {
      ToastUtils.showErrorMsg("获取 ai 报告失败: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
