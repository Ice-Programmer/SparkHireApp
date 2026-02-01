import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/components/custom_select_input.dart';
import 'package:spark_hire_app/components/edit_title.dart';
import 'package:spark_hire_app/components/keyboard_wrapper.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/candidate/education_status.dart';
import 'package:spark_hire_app/model/information/list_school.dart';
import 'package:spark_hire_app/pages/personal/candidate_info_vm.dart';
import 'package:spark_hire_app/pages/personal/components/edit_save_btn.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/service/information_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

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
  bool _loading = true;
  late List<SchoolInfo> _schoolList;
  late EducationStatus _selectEducationStatus;
  late SchoolInfo? _selectSchoolInfo;

  @override
  void initState() {
    super.initState();
    _loading = true;
    _getSchoolList();
    if (widget.viewModel.educationExpList == null ||
        widget.viewModel.educationExpList!.isEmpty) {
      _selectEducationStatus = EducationStatus.unknown;
      _selectSchoolInfo = null;
      _loading = false;
      return;
    }
    final educationExp = widget.viewModel.educationExpList!.firstWhere(
      (e) => e.id == widget.educationExpId,
    );
    _selectEducationStatus = educationExp.status;
    _selectSchoolInfo = educationExp.schoolInfo;
  }

  Future<void> _getSchoolList() async {
    try {
      ListSchoolResponse resp = await _informationService.listSchoolList(
        ListSchoolRequest(),
      );
      _schoolList = resp.schoolList ?? [];
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，请稍后重试');
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissWrapper(
      child: Scaffold(
        appBar: EditAppBar(
          titleName: AppLocalizations.of(context)!.educationText,
        ),
        bottomNavigationBar: EditSaveBtn(onEdit: () => {}),
        body: SafeArea(
          minimum: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 10.h),
          child:
              _loading
                  ? const Center(child: CircularProgressIndicator())
                  : _buildEducationEditForm(),
        ),
      ),
    );
  }

  Widget _buildEducationEditForm() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // 选择学历
          CustomSelectInput<EducationStatus>(
            value: _selectEducationStatus,
            title: AppLocalizations.of(context)!.educationStatusText,
            options:
                EducationStatus.values
                    .where((e) => e != EducationStatus.unknown)
                    .map(
                      (status) => SelectOption(
                        label: status.text(context),
                        value: status,
                        icon: Icons.circle,
                        iconColor: status.color,
                      ),
                    )
                    .toList(),
            onSelected: (EducationStatus newValue) {
              setState(() {
                _selectEducationStatus = newValue;
              });
            },
          ),

          20.verticalSpace,

          // 选择学校
          CustomSelectInput<SchoolInfo>(
            value: _selectSchoolInfo,
            title: AppLocalizations.of(context)!.educationStatusText,
            options:
                _schoolList
                    .map(
                      (school) => SelectOption(
                        label: school.schoolName,
                        value: school,
                        // icon: Icons.circle,
                        customChild: _buildSchoolItem(school),
                      ),
                    )
                    .toList(),
            onSelected: (SchoolInfo newValue) {
              setState(() {
                _selectSchoolInfo = newValue;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSchoolItem(SchoolInfo schoolInfo) {
    return Row(
      children: [
        CacheImage(height: 20.w, width: 20.h, imageUrl: schoolInfo.schoolIcon),

        10.horizontalSpace,

        Text(schoolInfo.schoolName),
      ],
    );
  }
}
