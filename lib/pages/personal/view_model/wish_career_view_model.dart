import 'package:flutter/material.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/wish_career/get_current_wish_career.dart';
import 'package:spark_hire_app/service/career_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class WishCareerViewModel extends ChangeNotifier {
  final CareerService _careerService = CareerService();

  List<WishCareerInfo>? _wishCareerList;
  List<WishCareerInfo>? get wishCareerList => _wishCareerList;

  Future<void> loadCurrentWiskCareerList() async {
    try {
      final response = await _careerService.getCurrentWishCareer(
        GetCurrentWishCareerRequest(),
      );
      _wishCareerList = response.wishCareerList;
      notifyListeners();
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，获取当前用户期望职业列表信息失败，请稍后重试');
    }
  }
}
