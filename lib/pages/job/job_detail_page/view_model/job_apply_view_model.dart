import 'package:flutter/material.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/recruitment/apply_recruitment.dart';
import 'package:spark_hire_app/service/recruitment_service.dart';

class JobApplyViewModel extends ChangeNotifier {
  final RecruitmentService _service = RecruitmentService();

  bool _isLoading = false;
  bool _hasApplied = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  bool get hasApplied => _hasApplied;
  String? get errorMessage => _errorMessage;

  void initState(bool initialApplied) {
    _hasApplied = initialApplied;
  }

  Future<bool> apply(int recruitmentId) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final req = ApplyRecruitmentRequest(recruitmentId: recruitmentId);
      await _service.applyRecruitment(req);

      _hasApplied = true;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _isLoading = false;
      if (e is BusinessException) {
        _errorMessage = e.message;
      } else {
        _errorMessage = '投递失败，请稍后重试';
      }
      notifyListeners();
      return false;
    }
  }
}
