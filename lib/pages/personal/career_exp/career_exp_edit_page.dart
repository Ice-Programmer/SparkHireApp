import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/custom_date_picker.dart';
import 'package:spark_hire_app/components/custom_multiline_input.dart';
import 'package:spark_hire_app/components/edit_title.dart';
import 'package:spark_hire_app/components/keyboard_wrapper.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/career_exp/delete_career_experience.dart';
import 'package:spark_hire_app/model/career_exp/modify_career_experience.dart';
import 'package:spark_hire_app/pages/personal/components/edit_save_btn.dart';
import 'package:spark_hire_app/pages/personal/view_model/career_exp_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/service/career_exp_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class CareerExpEditPage extends StatefulWidget {
  final CareerExpViewModel viewModel;
  final int careerExpId; // id > 0 为编辑，id <= 0 为新增
  const CareerExpEditPage({
    super.key,
    required this.viewModel,
    required this.careerExpId,
  });

  @override
  State<CareerExpEditPage> createState() => _CareerExpEditPageState();
}

class _CareerExpEditPageState extends State<CareerExpEditPage> {
  final CareerExpService _careerExpService = CareerExpService();
  ModifyCareerExperienceRequest? _request;

  @override
  void initState() {
    super.initState();
    initFormData();
    if (widget.careerExpId > 0) {}
  }

  void initFormData() {
    final existingExp = widget.viewModel.careerExpList?.firstWhereOrNull(
      (e) => e.id == widget.careerExpId,
    );

    if (widget.careerExpId > 0 || existingExp != null) {
      // 编辑模式
      _request = ModifyCareerExperienceRequest(
        id: widget.careerExpId,
        experienceName: existingExp!.experienceName,
        jobRole: existingExp.jobRole,
        description: existingExp.description,
        startTS: existingExp.startTS,
        endTS: existingExp.endTS,
      );
    } else {
      // 新增模式
      _request = ModifyCareerExperienceRequest(
        experienceName: "",
        jobRole: "",
        description: "",
        startTS: 0,
        endTS: 0,
      );
    }
  }

  void _onSave() async {
    if (_request == null) return;
    try {
      await _careerExpService.modifyCareerExperience(_request!);
      await widget.viewModel.loadCurrentCareerExpList();
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
      return;
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，请稍后重试');
      return;
    }
    if (mounted) {
      Navigator.pop(context);
      ToastUtils.showSuccessMsg('save successfully');
    }
  }

  void _deleteBtn() async {
    if (widget.careerExpId <= 0) {
      return;
    }
    try {
      await _careerExpService.deleteCareerExperience(
        DeleteCareerExperienceRequest(id: widget.careerExpId),
      );
      await widget.viewModel.loadCurrentCareerExpList();
      if (!mounted) {
        return;
      }
      Navigator.pop(context);
      ToastUtils.showSuccessMsg('delete successfully');
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，请稍后重试');
    }
  }

  bool _disableButton() {
    if (_request == null) return true;
    return !_request!.validate();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissWrapper(
      child: Scaffold(
        appBar: EditAppBar(
          context: context,
          titleName: AppLocalizations.of(context)!.careerExpText,
          onDeletePress: _deleteBtn,
          needActions: widget.careerExpId > 0,
        ),
        bottomNavigationBar: EditSaveBtn(
          onEdit: _onSave,
          disable: _disableButton(),
        ),
        body: SafeArea(
          child:
              _request == null
                  ? const Center(child: CircularProgressIndicator())
                  : _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        children: [
          // 公司名称
          CustomMultilineInput(
            initialValue: _request?.experienceName,
            title: AppLocalizations.of(context)!.workCompanyName,
            height: 80.h,
            maxLength: 30,
            onChanged: (value) {
              setState(() {
                _request = _request?.copyWith(experienceName: value);
              });
            },
          ),

          20.verticalSpace,

          // 职位名称
          CustomMultilineInput(
            initialValue: _request?.jobRole,
            title: AppLocalizations.of(context)!.jobTitleText,
            height: 80.h,
            maxLength: 25,
            onChanged: (value) {
              setState(() {
                _request = _request?.copyWith(jobRole: value);
              });
            },
          ),

          20.verticalSpace,

          // 选择日期
          _buildDateSelector(),

          20.verticalSpace,

          // 职位描述
          CustomMultilineInput(
            initialValue: _request?.description,
            title:
                "${AppLocalizations.of(context)!.careerExpText} (${AppLocalizations.of(context)!.optionalText})",
            height: 400.h,
            maxLength: 500,
            onChanged: (value) {
              setState(() {
                _request = _request?.copyWith(jobRole: value);
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    final pickerWidth = MediaQuery.of(context).size.width * 0.43;
    return Row(
      children: [
        CustomDatePicker(
          height: 50.h,
          width: pickerWidth,
          defaultValue:
              (_request?.startTS ?? 0) > 0
                  ? DateTime.fromMillisecondsSinceEpoch(
                    _request!.startTS * 1000,
                  )
                  : null,
          onChanged:
              (value) => setState(() {
                _request = _request?.copyWith(
                  startTS: value.millisecondsSinceEpoch ~/ 1000,
                );
              }),
          title: AppLocalizations.of(context)!.beginDateText,
          mode: CustomDatePickerMode.yearMonth,
        ),

        Spacer(),

        CustomDatePicker(
          height: 50.h,
          width: pickerWidth,
          defaultValue:
              (_request?.endTS ?? 0) > 0
                  ? DateTime.fromMillisecondsSinceEpoch(_request!.endTS * 1000)
                  : null,
          onChanged:
              (value) => setState(() {
                _request = _request?.copyWith(
                  endTS: value.millisecondsSinceEpoch ~/ 1000,
                );
              }),
          title: AppLocalizations.of(context)!.endDateText,
          mode: CustomDatePickerMode.yearMonth,
        ),
      ],
    );
  }
}
