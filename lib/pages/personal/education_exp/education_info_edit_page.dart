import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/components/custom_multiline_input.dart';
import 'package:spark_hire_app/components/custom_select_input.dart';
import 'package:spark_hire_app/components/edit_title.dart';
import 'package:spark_hire_app/components/keyboard_wrapper.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/candidate/education_status.dart';
import 'package:spark_hire_app/model/information/list_major.dart';
import 'package:spark_hire_app/model/information/list_school.dart';
import 'package:spark_hire_app/pages/personal/candidate_info_vm.dart';
import 'package:spark_hire_app/pages/personal/components/edit_save_btn.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/service/information_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';
import 'package:collection/collection.dart'; // 引入以使用 firstWhereOrNull

class EducationInfoEditPage extends StatefulWidget {
  final CandidateViewModel viewModel;
  final int educationExpId;
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

  // 1. 状态管理
  bool _isLoading = true;
  List<SchoolInfo> _schoolList = [];
  List<MajorInfo> _majorList = [];

  // 表单数据暂存
  late EducationStatus _selectedStatus;
  SchoolInfo? _selectedSchool;
  MajorInfo? _selectedMajor;
  late String _activity = "";
  final TextEditingController _summaryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  @override
  void dispose() {
    _summaryController.dispose();
    super.dispose();
  }

  Future<void> _initializeData() async {
    try {
      // 并发请求基础数据
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

    _selectedStatus = existingExp?.status ?? EducationStatus.unknown;

    if (existingExp?.schoolInfo != null) {
      _selectedSchool = _schoolList.firstWhereOrNull(
        (s) => s.id == existingExp!.schoolInfo.id,
      );
    }

    if (existingExp?.majorInfo != null) {
      _selectedMajor = _majorList.firstWhereOrNull(
        (m) => m.id == existingExp!.majorInfo.id,
      );
    }

    _activity = existingExp?.activity ?? "";
  }

  void _onSave() {
    debugPrint("Selected School: ${_selectedSchool?.schoolName}");
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return KeyboardDismissWrapper(
      child: Scaffold(
        appBar: EditAppBar(titleName: l10n.educationText),
        bottomNavigationBar: EditSaveBtn(onEdit: _onSave),
        body: SafeArea(
          child:
              _isLoading
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
          CustomMultilineInput(
            title: l10n.summaryEditText,
            initialValue: _activity,
            height: 200.h,
            maxLength: 600,
            onChanged: (value) => _activity = value,
          ),
        ],
      ),
    );
  }

  Widget _buildStatusPicker(AppLocalizations l10n) {
    return CustomSelectInput<EducationStatus>(
      value: _selectedStatus,
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
      onSelected: (val) => setState(() => _selectedStatus = val),
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
      onSelected: (val) => setState(() => _selectedSchool = val),
    );
  }

  Widget _buildMajorPicker(AppLocalizations l10n) {
    return CustomSelectInput<MajorInfo>(
      value: _selectedMajor,
      title: l10n.schoolText,
      options:
          _majorList
              .map((m) => SelectOption(label: m.majorName, value: m))
              .toList(),
      onSelected: (val) => setState(() => _selectedMajor = val),
    );
  }
}
