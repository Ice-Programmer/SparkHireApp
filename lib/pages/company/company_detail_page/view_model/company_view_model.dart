import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/company/company_info.dart';
import 'package:spark_hire_app/model/company/fetch_company_info.dart';
import 'package:spark_hire_app/service/company_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class CompanyViewModel extends ChangeNotifier {
  final CompanyService _service = CompanyService();

  CompanyInfo? _companyInfo;

  CompanyInfo? get companyInfo => _companyInfo;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> loadCompanyInfo({required int companyId}) async {
    _isLoading = true;
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
}
