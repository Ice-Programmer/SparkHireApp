import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/candidate/optimize_resume.dart';
import 'package:spark_hire_app/service/candidate_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class CandidateAnalysisViewModel extends ChangeNotifier {
  final CandidateService _service = CandidateService();

  OptimizeResumeResult? _optimizeResumeResult;
  OptimizeResumeResult? get optimizeResumeResult => _optimizeResumeResult;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadCandidateAiAnalysis() async {
    _isLoading = true;
    notifyListeners();

    try {
      final req = SmartOptimizeCandidateResumeRequest();
      final response = await _service.smartOptimizeCandidateResume(req);
      _optimizeResumeResult = response.optimizeResumeResult;
    } catch (e) {
      ToastUtils.showErrorMsg("获取 ai 报告失败: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
