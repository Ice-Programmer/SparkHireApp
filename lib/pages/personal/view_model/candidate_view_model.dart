import 'package:flutter/material.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/candidate/edit_candidate_basic.dart';
import 'package:spark_hire_app/model/candidate/edit_candidate_profile.dart';
import 'package:spark_hire_app/model/candidate/get_current_candidate.dart';
import 'package:spark_hire_app/service/candidate_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class CandidateInfoViewModel extends ChangeNotifier {
  final CandidateService _candidateService = CandidateService();

  CandidateInfo? _currentCandidateInfo;
  ContractInfo? _contractInfo;
  String? _profile;

  CandidateInfo? get currentCandidateInfo => _currentCandidateInfo;
  ContractInfo? get contractInfo => _contractInfo;
  String? get profile => _profile;

  Future<void> loadCurrentCandidate() async {
    try {
      final response = await _candidateService.getCurrentCandidate(
        GetCurrentCandidateRequest(),
      );
      _currentCandidateInfo = response.candidateInfo;
      _contractInfo = response.candidateInfo?.contractInfo;
      _profile = response.candidateInfo?.profile;
      notifyListeners();
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，请稍后重试');
    }
  }

  Future<void> editCandidateProfile(String profile) async {
    try {
      await _candidateService.editCandidateProfile(
        EditCandidateProfileRequest(profile: profile),
      );
      _profile = profile;
      _currentCandidateInfo = _currentCandidateInfo?.copyWith(profile: profile);
      notifyListeners();
      ToastUtils.showSuccessMsg('edit successfully');
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，请稍后重试');
    }
  }

  // 注意：原方法中这里同时刷新了 User 和 Candidate。
  // 解耦后，我们返回一个 bool，让 UI 层去决定是否要触发 UserViewModel 的刷新
  Future<bool> editCandidateBasicInfo(EditCandidateBasicInfoRequest req) async {
    try {
      await _candidateService.editCandidateBasicInfo(req);
      await loadCurrentCandidate();
      ToastUtils.showSuccessMsg('edit successfully');
      return true; // 成功返回 true
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
      return false;
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，请稍后重试');
      return false;
    }
  }
}
