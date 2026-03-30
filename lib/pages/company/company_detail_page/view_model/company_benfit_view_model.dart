import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/company/benefit.dart';
import 'package:spark_hire_app/model/company/fetch_company_benefit.dart';
import 'package:spark_hire_app/service/company_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class CompanyBenefitViewModel extends ChangeNotifier {
  final CompanyService _companyService = CompanyService();

  List<BenefitInfo>? _benefitList;
  List<BenefitInfo>? get benefitList => _benefitList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadCompanyBenefitList({required int companyId}) async {
    _isLoading = true;
    notifyListeners();

    try {
      final req = FetchCompanyBenefitsRequest(companyId: companyId);
      final response = await _companyService.fetchCompanyBenefits(req);

      _benefitList = response.benefitList;
    } catch (e) {
      ToastUtils.showErrorMsg("获取公司福利信息错误：$e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
