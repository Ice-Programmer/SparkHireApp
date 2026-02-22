import 'package:flutter/material.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/career_exp/get_current_user_career_exp.dart';
import 'package:spark_hire_app/service/career_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class CareerExpViewModel extends ChangeNotifier {
  final CareerService _careerExpService = CareerService();

  List<CareerExperienceInfo>? _careerExpInfoList;
  List<CareerExperienceInfo>? get careerExpList => _careerExpInfoList;

  Future<void> loadCurrentCareerExpList() async {
    try {
      final response = await _careerExpService.getCurrentUserCareerExp(
        GetCurrentUserCareerExperienceRequest(),
      );
      _careerExpInfoList = response.careerExperienceInfoList;
      notifyListeners();
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，获取教育经历失败，请稍后重试');
    }
  }
}
