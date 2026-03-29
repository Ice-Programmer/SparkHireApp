import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/company/company_info.dart';
import 'package:spark_hire_app/model/company/fetch_company_info.dart';
import 'package:spark_hire_app/model/user/user_favor.dart';
import 'package:spark_hire_app/service/company_service.dart';
import 'package:spark_hire_app/service/user_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class CompanyViewModel extends ChangeNotifier {
  final CompanyService _service = CompanyService();
  final UserService _userService = UserService();

  CompanyInfo? _companyInfo;
  CompanyInfo? get companyInfo => _companyInfo;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isActionLoading = false;
  bool get isActionLoading => _isActionLoading;

  Future<void> loadCompanyInfo({required int companyId}) async {
    _isLoading = true;
    notifyListeners();

    try {
      final req = FetchCompanyDetailInfoRequest(companyId: companyId);
      final response = await _service.fetchCompanyDetailInfo(req);

      _companyInfo = response.companyInfo;
    } catch (e) {
      ToastUtils.showErrorMsg("获取公司信息失败: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleFollow() async {
    if (_companyInfo == null || _isActionLoading) return;

    _isActionLoading = true;
    notifyListeners();

    try {
      final bool isCurrentlyFollowed = _companyInfo!.hasFavor;

      if (isCurrentlyFollowed) {
        // 取消关注
        await _userService.userCancelFavor(
          UserCancelFavorRequest(
            targetId: _companyInfo!.id,
            targetType: TargetType.company,
          ),
        );
        // 同步修改本地状态：人数-1
        _companyInfo = _companyInfo!.copyWith(
          favoriteCnt:
              (_companyInfo!.favoriteCnt - 1).clamp(0, double.infinity).toInt(),
          hasFavor: false,
        );
      } else {
        // 关注
        await _userService.userFavor(
          UserFavorRequest(
            targetId: _companyInfo!.id,
            targetType: TargetType.company,
          ),
        );
        // 同步修改本地状态：人数+1
        _companyInfo = _companyInfo!.copyWith(
          favoriteCnt: _companyInfo!.favoriteCnt + 1,
          hasFavor: true,
        );
      }
    } catch (e) {
      ToastUtils.showErrorMsg("操作失败: $e");
    } finally {
      _isActionLoading = false;
      notifyListeners();
    }
  }
}
