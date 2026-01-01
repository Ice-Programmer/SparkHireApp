import 'package:flutter/material.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/candidate/edit_candidate_basic.dart';
import 'package:spark_hire_app/model/candidate/edit_candidate_profile.dart';
import 'package:spark_hire_app/model/candidate/get_current_candidate.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';
import 'package:spark_hire_app/service/candidate_service.dart';
import 'package:spark_hire_app/service/user_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class CandidateViewModel extends ChangeNotifier {
  final CandidateService _candidateService = CandidateService();
  final UserService _userService = UserService();

  CandidateInfo? _currentCandidateInfo;

  UserBasicInfo? _currentUserInfo;

  ContractInfo? _contractInfo;

  String? _profile;

  CandidateInfo? get currentCandidateInfo => _currentCandidateInfo;

  UserBasicInfo? get currentUserBasicInfo => _currentUserInfo;

  ContractInfo? get contractInfo => _contractInfo;

  String? get profile => _profile;

  Future<void> loadCurrentCandidate() async {
    try {
      final response = await _candidateService.getCurrentCandidate(
        GetCurrentCandidateRequest(),
      );
      _currentCandidateInfo = response.candidateInfo;
      _contractInfo = response.candidateInfo.contractInfo;
      _profile = response.candidateInfo.profile;
      notifyListeners();
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，请稍后重试');
    }
  }

  Future<void> loadCurrentUser() async {
    try {
      final response = await _userService.fetchCurrentUser(
        FetchCurrentUserRequest(),
      );
      _currentUserInfo = response.basicInfo;
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

  Future<void> editCandidateBasicInfo(EditCandidateBasicInfoRequest req) async {
    try {
      await _candidateService.editCandidateBasicInfo(req);

      await Future.wait([loadCurrentCandidate(), loadCurrentUser()]);

      ToastUtils.showSuccessMsg('edit successfully');
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，请稍后重试');
    }
  }
}
