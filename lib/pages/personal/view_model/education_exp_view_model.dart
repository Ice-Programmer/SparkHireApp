import 'package:flutter/material.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/education_exp/get_current_user_education.dart';
import 'package:spark_hire_app/service/education_exp_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class EducationExpViewModel extends ChangeNotifier {
  final EducationExpService _educationExpService = EducationExpService();

  List<EducationExpInfo>? _educationExpList;
  List<EducationExpInfo>? get educationExpList => _educationExpList;

  Future<void> loadCurrentEducationExp() async {
    try {
      final response = await _educationExpService.getCurrentUserEducationExp(
        GetCurrentUserEducationExpRequest(),
      );
      _educationExpList = response.educationExpList;
      notifyListeners();
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，获取教育经历失败，请稍后重试');
    }
  }

}
