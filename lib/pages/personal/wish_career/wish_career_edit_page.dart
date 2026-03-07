import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/custom_input.dart';
import 'package:spark_hire_app/components/custom_select_input.dart';
import 'package:spark_hire_app/components/edit_title.dart';
import 'package:spark_hire_app/components/keyboard_wrapper.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/information/list_career.dart'; // 导入 CareerInfo 模型
import 'package:spark_hire_app/model/wish_career/delete_wish_career.dart';
import 'package:spark_hire_app/model/wish_career/modify_wish_career.dart';
import 'package:spark_hire_app/model/wish_career/salary_currency_type.dart';
import 'package:spark_hire_app/model/wish_career/salary_frequency_type.dart';
import 'package:spark_hire_app/pages/personal/components/edit_save_btn.dart';
import 'package:spark_hire_app/pages/personal/view_model/wish_career_view_model.dart';
import 'package:spark_hire_app/pages/select_page/career_selection_page.dart';
import 'package:spark_hire_app/service/career_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class WishCareerEditPage extends StatefulWidget {
  final WishCareerViewModel viewModel;
  final int wishCareerId;

  const WishCareerEditPage({
    super.key,
    required this.viewModel,
    required this.wishCareerId,
  });

  @override
  State<WishCareerEditPage> createState() => _WishCareerEditPageState();
}

class _WishCareerEditPageState extends State<WishCareerEditPage> {
  final CareerService _careerService = CareerService();
  ModifyWishCareerRequest? _request;

  // --- 状态变量 ---
  bool _isLowerUnlimited = false;
  bool _isUpperUnlimited = false;
  String _selectedJobName = ""; // 用于在 UI 上显示职位名称

  bool get _isNegotiable => _isLowerUnlimited && _isUpperUnlimited;

  @override
  void initState() {
    super.initState();
    _initFormData();
  }

  void _initFormData() {
    final existing = widget.viewModel.wishCareerList?.firstWhereOrNull(
      (e) => e.id == widget.wishCareerId,
    );

    if (widget.wishCareerId > 0 && existing != null) {
      _request = ModifyWishCareerRequest(
        id: widget.wishCareerId,
        careerId: existing.careerInfo.id,
        currencyType: existing.salaryCurrencyType,
        frequencyType: existing.frequencyType,
        salaryLower: existing.salaryLower,
        salaryUpper: existing.salaryUpper,
      );
      _isLowerUnlimited = existing.salaryLower == 0;
      _isUpperUnlimited = existing.salaryUpper == 0;
      _selectedJobName = existing.careerInfo.careerName;
    } else {
      _request = ModifyWishCareerRequest(
        careerId: 0,
        currencyType: SalaryCurrencyType.cny,
        frequencyType: SalaryFrequencyType.monthly,
        salaryLower: 0,
        salaryUpper: 0,
      );
    }
  }

  // --- 逻辑处理 ---

  Future<void> _handleAction(
    Future<void> Function() action,
    String successMsg,
  ) async {
    try {
      await action();
      await widget.viewModel.loadCurrentWiskCareerList();
      if (!mounted) return;
      Navigator.pop(context);
      ToastUtils.showSuccessMsg(successMsg);
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } catch (e) {
      ToastUtils.showErrorMsg('网络异常，请稍后重试');
    }
  }

  void _onDelete() => _handleAction(
    () => _careerService.deleteWishCareer(
      DeleteWishCareerRequest(id: widget.wishCareerId),
    ),
    AppLocalizations.of(context)!.deleteSuccessText,
  );

  void _onSave() => _handleAction(
    () => _careerService.modifyWishCareer(_request!),
    AppLocalizations.of(context)!.saveSuccessText ?? 'Save Success',
  );

  // 跳转职业选择
  Future<void> _onSelectJob() async {
    // 假设 JobSelectionPage 返回的是选中的 CareerInfo 对象
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const JobSelectionPage()),
    );

    if (result != null && result is CareerInfo) {
      setState(() {
        _request = _request?.copyWith(careerId: result.id);
        _selectedJobName = result.careerName;
      });
    }
  }

  void _toggleNegotiable(bool? value) {
    setState(() {
      final isChecked = value ?? false;
      _isLowerUnlimited = isChecked;
      _isUpperUnlimited = isChecked;
      if (isChecked) {
        _request = _request?.copyWith(salaryLower: 0, salaryUpper: 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return KeyboardDismissWrapper(
      child: Scaffold(
        appBar: EditAppBar(
          context: context,
          titleName: l10n.careerExpText,
          onDeletePress: _onDelete,
          needActions: widget.wishCareerId > 0,
        ),
        bottomNavigationBar: EditSaveBtn(
          onEdit: _onSave,
          disable:
              _request == null ||
              !_request!.validate() ||
              _request?.careerId == 0,
        ),
        body: SafeArea(
          child:
              _request == null
                  ? const Center(child: CircularProgressIndicator())
                  : _buildForm(l10n),
        ),
      ),
    );
  }

  Widget _buildForm(AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. 职位选择入口
          _buildJobSelector(l10n),

          20.verticalSpace,

          // 2. 最小值输入
          _buildSalaryInput(
            title: l10n.salaryLowerText,
            isUnlimited: _isLowerUnlimited,
            currentValue: _request?.salaryLower,
            onChanged:
                (val) => setState(
                  () => _request = _request?.copyWith(salaryLower: val),
                ),
            onToggleUnlimited:
                (v) => setState(() {
                  _isLowerUnlimited = v;
                  if (v) _request = _request?.copyWith(salaryLower: 0);
                }),
          ),

          20.verticalSpace,

          // 3. 最大值输入
          _buildSalaryInput(
            title: l10n.salaryUpperText,
            isUnlimited: _isUpperUnlimited,
            currentValue: _request?.salaryUpper,
            onChanged:
                (val) => setState(
                  () => _request = _request?.copyWith(salaryUpper: val),
                ),
            onToggleUnlimited:
                (v) => setState(() {
                  _isUpperUnlimited = v;
                  if (v) _request = _request?.copyWith(salaryUpper: 0);
                }),
          ),

          12.verticalSpace,

          // 4. 面议
          _buildNegotiableTile(l10n),

          20.verticalSpace,

          // 5. 币种
          CustomSelectInput<SalaryCurrencyType>(
            value: _request?.currencyType,
            title: l10n.currencyText,
            options:
                SalaryCurrencyType.values
                    .where((e) => e != SalaryCurrencyType.unknown)
                    .map(
                      (s) => SelectOption(
                        label: "${s.symbol} - ${s.currencyName}",
                        value: s,
                        leading: s.flag,
                      ),
                    )
                    .toList(),
            enableSearch: false,
            onSelected:
                (val) => setState(
                  () => _request = _request?.copyWith(currencyType: val),
                ),
          ),

          22.verticalSpace,

          // 6. 频率
          CustomSelectInput<SalaryFrequencyType>(
            value: _request?.frequencyType,
            title: l10n.frequencyText,
            options:
                SalaryFrequencyType.values
                    .where((e) => e != SalaryFrequencyType.unknown)
                    .map(
                      (s) => SelectOption(label: s.getText(context), value: s),
                    )
                    .toList(),
            enableSearch: false,
            onSelected:
                (val) => setState(
                  () => _request = _request?.copyWith(frequencyType: val),
                ),
          ),
        ],
      ),
    );
  }

  // 1. 跳转并接收的方法
  Future<void> _handleSelectJob() async {
    // result 会接收 Navigator.pop 传回来的 selectedJob
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const JobSelectionPage()),
    );

    // 检查是否真的选了东西返回（防止用户直接点返回键）
    if (result != null && result is CareerInfo) {
      setState(() {
        // 更新请求模型中的 ID
        _request = _request?.copyWith(careerId: result.id);
        // 更新本地用于展示的名称（如果有这个变量的话）
        _selectedJobName = result.careerName;
      });
    }
  }

  // 2. 在 build 方法中展示选中的内容
  // 推荐用一个点击区域来展示
  Widget _buildJobSelector(AppLocalizations l10n) {
    return GestureDetector(
      onTap: _handleSelectJob, // 点击跳转
      child: CustomInput(
        title: l10n.selectJobTitleText,
        hintText: l10n.selectJobTitleText,
        // 展示选中的职位名，如果没有选则显示默认占位符
        enabled: false, // 禁用输入，仅作为点击入口
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        height: 60.h,
      ),
    );
  }

  Widget _buildSalaryInput({
    required String title,
    required bool isUnlimited,
    required int? currentValue,
    required Function(int) onChanged,
    required Function(bool) onToggleUnlimited,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: CustomInput(
            key: ValueKey('${title}_$isUnlimited'),
            height: 60.h,
            backgroundColor: Theme.of(context).colorScheme.inverseSurface,
            hintText: title,
            title: title,
            inputType: TextInputType.number,
            enabled: !isUnlimited,
            defaultValue: (currentValue == 0) ? null : currentValue?.toString(),
            onlyNumbers: true,
            onChanged: (value) => onChanged(int.tryParse(value) ?? 0),
          ),
        ),
        12.horizontalSpace,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context)!.noPreferenceText,
              style: TextStyle(fontSize: 12.sp),
            ),
            Checkbox(
              value: isUnlimited,
              onChanged: (v) => onToggleUnlimited(v ?? false),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNegotiableTile(AppLocalizations l10n) {
    return InkWell(
      onTap: () => _toggleNegotiable(!_isNegotiable),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: _isNegotiable,
            visualDensity: VisualDensity.compact,
            onChanged: _toggleNegotiable,
          ),
          Text(l10n.salaryNegotiableText),
        ],
      ),
    );
  }
}
