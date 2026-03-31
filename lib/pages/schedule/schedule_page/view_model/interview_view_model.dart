import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/interview/fetch_current_user_interview.dart';
import 'package:spark_hire_app/model/interview/interview_info.dart';
import 'package:spark_hire_app/service/interview_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class InterviewViewModel extends ChangeNotifier {
  final InterviewService _interviewService = InterviewService();

  List<InterviewInfo> _interviewList = [];
  bool _isLoading = false;

  List<InterviewInfo> get interviewList => _interviewList;
  bool get isLoading => _isLoading;

  bool get isEmpty => _interviewList.isEmpty && !_isLoading;

  /// 获取当前用户的面试列表
  Future<void> fetchInterviews() async {
    _isLoading = true;
    notifyListeners();

    try {
      final request = FetchCurrentUserInterviewRequest();
      final response = await _interviewService.queryRecruitmentPage(request);
      _interviewList = response.interviewList;
    } catch (e) {
      ToastUtils.showErrorMsg("fetch interview error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshInterviews() async {
    await fetchInterviews();
  }
}
