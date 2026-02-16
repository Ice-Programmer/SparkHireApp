import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/components/custom_date_picker.dart';
import 'package:spark_hire_app/components/custom_multiline_input.dart';
import 'package:spark_hire_app/components/custom_select_input.dart';
import 'package:spark_hire_app/components/edit_title.dart';
import 'package:spark_hire_app/components/keyboard_wrapper.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/candidate/education_status.dart';
import 'package:spark_hire_app/model/education_exp/delete_education_exp.dart';
import 'package:spark_hire_app/model/education_exp/modify_education_exp.dart';
import 'package:spark_hire_app/model/information/list_major.dart';
import 'package:spark_hire_app/model/information/list_school.dart';
import 'package:spark_hire_app/pages/personal/components/edit_save_btn.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/pages/personal/view_model/education_exp_view_model.dart';
import 'package:spark_hire_app/service/education_exp_service.dart';
import 'package:spark_hire_app/service/information_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';
import 'package:collection/collection.dart';

class EducationInfoEditPage extends StatefulWidget {
  final EducationExpViewModel viewModel;
  final int educationExpId; // id > 0 为编辑，id <= 0 为新增
  const EducationInfoEditPage({
    super.key,
    required this.viewModel,
    required this.educationExpId,
  });

  @override
  State<EducationInfoEditPage> createState() => _EducationInfoEditPageState();
}

class _EducationInfoEditPageState extends State<EducationInfoEditPage> {
  final InformationService _informationService = InformationService();
  final EducationExpService _educationExpService = EducationExpService();

  bool _isLoading = true;
  List<SchoolInfo> _schoolList = [];
  List<MajorInfo> _majorList = [];

  ModifyEducationExpRequest? _request;
  SchoolInfo? _selectedSchool;
  MajorInfo? _selectedMajor;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    try {
      final results = await Future.wait([
        _informationService.listSchoolList(ListSchoolRequest()),
        _informationService.listMajorList(ListMajorRequest()),
      ]);

      _schoolList = (results[0] as ListSchoolResponse).schoolList ?? [];
      _majorList = (results[1] as ListMajorResponse).majorList ?? [];

      _initFormValues();
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } catch (e) {
      ToastUtils.showErrorMsg('网络异常');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _initFormValues() {
    final existingExp = widget.viewModel.educationExpList?.firstWhereOrNull(
      (e) => e.id == widget.educationExpId,
    );

    if (widget.educationExpId > 0 && existingExp != null) {
      // --- 编辑模式 ---
      _selectedSchool = _schoolList.firstWhereOrNull(
        (s) => s.id == existingExp.schoolInfo.id,
      );
      _selectedMajor = _majorList.firstWhereOrNull(
        (m) => m.id == existingExp.majorInfo.id,
      );

      _request = ModifyEducationExpRequest(
        id: widget.educationExpId,
        schoolId: existingExp.schoolInfo.id,
        majorId: existingExp.majorInfo.id,
        beginYear: existingExp.beginYear,
        endYear: existingExp.endYear,
        activity: existingExp.activity,
        status: existingExp.status,
      );
    } else {
      // --- 新增模式 ---
      _selectedSchool = null;
      _selectedMajor = null;
      _request = ModifyEducationExpRequest(
        schoolId: 0,
        majorId: 0,
        activity: '',
        beginYear: 0,
        endYear: 0,
      );
    }
  }

  void _onSave() async {
    if (_request == null) return;
    try {
      await _educationExpService.modifyEducationExp(_request!);
      await widget.viewModel.loadCurrentEducationExp();
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

  bool _disableButton() {
    if (_isLoading || _request == null) return true;
    return !_request!.validate();
  }

  void _deleteBtn() async {
    if (widget.educationExpId <= 0) {
      return;
    }
    try {
      await _educationExpService.deleteEducationExp(
        DeleteEducationExpRequest(id: widget.educationExpId),
      );
      await widget.viewModel.loadCurrentEducationExp();
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return KeyboardDismissWrapper(
      child: Scaffold(
        appBar: EditAppBar(
          context: context,
          titleName: l10n.educationText,
          onDeletePress: _deleteBtn,
          needActions: widget.educationExpId > 0,
        ),
        bottomNavigationBar: EditSaveBtn(
          onEdit: _onSave,
          disable: _disableButton(),
        ),
        body: SafeArea(
          child:
              _isLoading || _request == null
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
        children: [
          _buildStatusPicker(l10n),

          20.verticalSpace,

          _buildSchoolPicker(l10n),

          20.verticalSpace,

          _buildMajorPicker(l10n),

          20.verticalSpace,

          _buildDateSelector(),

          20.verticalSpace,

          CustomMultilineInput(
            title: l10n.summaryEditText,
            initialValue: _request?.activity,
            height: 200.h,
            maxLength: 600,
            onChanged: (value) {
              setState(() {
                _request = _request?.copyWith(activity: value);
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
              (_request?.beginYear ?? 0) > 0
                  ? DateTime(_request!.beginYear)
                  : null,
          onChanged:
              (value) => setState(() {
                _request = _request?.copyWith(beginYear: value.year);
              }),
          title: AppLocalizations.of(context)!.beginDateText,
        ),

        Spacer(),

        CustomDatePicker(
          height: 50.h,
          width: pickerWidth,
          defaultValue:
              (_request?.endYear ?? 0) > 0 ? DateTime(_request!.endYear) : null,
          onChanged:
              (value) => setState(() {
                _request = _request?.copyWith(endYear: value.year);
              }),
          title: AppLocalizations.of(context)!.endDateText,
        ),
      ],
    );
  }

  Widget _buildStatusPicker(AppLocalizations l10n) {
    return CustomSelectInput<EducationStatus>(
      value: _request?.status,
      title: l10n.educationStatusText,
      options:
          EducationStatus.values
              .where((e) => e != EducationStatus.unknown)
              .map(
                (s) => SelectOption(
                  label: s.text(context),
                  value: s,
                  icon: Icons.circle,
                  iconColor: s.color,
                ),
              )
              .toList(),
      onSelected:
          (val) => setState(() {
            _request = _request?.copyWith(status: val);
          }),
    );
  }

  Widget _buildSchoolPicker(AppLocalizations l10n) {
    return CustomSelectInput<SchoolInfo>(
      value: _selectedSchool,
      title: l10n.schoolText,
      options:
          _schoolList
              .map(
                (s) => SelectOption(
                  label: s.schoolName,
                  value: s,
                  customChild: Row(
                    children: [
                      CacheImage(
                        height: 24.w,
                        width: 24.w,
                        imageUrl: s.schoolIcon,
                      ),
                      10.horizontalSpace,
                      Expanded(child: Text(s.schoolName)),
                    ],
                  ),
                ),
              )
              .toList(),
      onSelected:
          (SchoolInfo val) => setState(() {
            _selectedSchool = val;
            _request = _request?.copyWith(schoolId: val.id);
          }),
    );
  }

  Widget _buildMajorPicker(AppLocalizations l10n) {
    return CustomSelectInput<MajorInfo>(
      value: _selectedMajor,
      title: l10n.majorText,
      options:
          _majorList
              .map((m) => SelectOption(label: m.majorName, value: m))
              .toList(),
      onSelected:
          (MajorInfo val) => setState(() {
            _selectedMajor = val;
            _request = _request?.copyWith(majorId: val.id);
          }),
    );
  }
}
