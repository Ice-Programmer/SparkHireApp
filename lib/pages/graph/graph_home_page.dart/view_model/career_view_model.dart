import 'package:flutter/material.dart';
import 'package:spark_hire_app/model/information/list_career.dart';
import 'package:spark_hire_app/service/information_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class CareerViewModel extends ChangeNotifier {
  final InformationService _informationService = InformationService();

  // 原始的完整数据源
  List<CareerInfo> _allCareerList = [];

  // 实际在 UI 上显示的列表（搜索结果）
  List<CareerInfo> _displayList = [];

  // 这里的 Getter 返回过滤后的列表
  List<CareerInfo> get careerInfoList => _displayList;

  bool _isLoadingCareer = false;
  bool get isLoadingCareer => _isLoadingCareer;

  /// 获取所有职业列表
  Future<void> loadCareerInfoList() async {
    _isLoadingCareer = true;
    notifyListeners();

    try {
      final req = ListCareerInfoRequest();

      final response = await _informationService.listCareerInfo(req);

      _allCareerList = response.careerList;
      _displayList = List.from(_allCareerList);
    } catch (e) {
      ToastUtils.showErrorMsg("获取职业列表失败: $e");
    } finally {
      _isLoadingCareer = false;
      notifyListeners();
    }
  }

  void filterCareers(String query) {
    if (query.isEmpty) {
      _displayList = List.from(_allCareerList);
    } else {
      _displayList =
          _allCareerList
              .where(
                (career) => career.careerName.toLowerCase().contains(
                  query.toLowerCase(),
                ),
              )
              .toList();
    }

    notifyListeners();
  }
}
