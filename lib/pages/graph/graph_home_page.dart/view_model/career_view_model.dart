import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/information/list_career.dart';
import 'package:spark_hire_app/service/information_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class CareerViewModel extends ChangeNotifier {
  final InformationService _informationService = InformationService();

  List<CareerInfo> _careerInfoList = [];
  List<CareerInfo> get careerInfoList => _careerInfoList;

  bool _isLoadingCareer = false;
  bool get isLoadingCareer => _isLoadingCareer;

  /// 获取所有职业列表
  Future<void> loadCareerInfoList() async {
    _isLoadingCareer = true;
    notifyListeners();

    try {
      final req = ListCareerInfoRequest();

      final response = await _informationService.listCareerInfo(req);

      _careerInfoList = response.careerList;
    } catch (e) {
      ToastUtils.showErrorMsg("获取职业列表失败: $e");
    } finally {
      _isLoadingCareer = false;
      notifyListeners();
    }
  }
}
