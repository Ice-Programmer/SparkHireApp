import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/components/custom_avatar_upload.dart';
import 'package:spark_hire_app/components/custom_divider.dart';
import 'package:spark_hire_app/components/custom_input.dart';
import 'package:spark_hire_app/components/custom_select_input.dart';
import 'package:spark_hire_app/components/edit_title.dart';
import 'package:spark_hire_app/components/keyboard_wrapper.dart';
import 'package:spark_hire_app/http/business_exception.dart';
import 'package:spark_hire_app/model/biz/upoad_file.dart';
import 'package:spark_hire_app/model/candidate/edit_candidate_basic.dart';
import 'package:spark_hire_app/model/candidate/job_status.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';
import 'package:spark_hire_app/pages/personal/candidate_info_vm.dart';
import 'package:spark_hire_app/pages/personal/components/edit_save_btn.dart';
import 'package:spark_hire_app/service/biz_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class CandidateInfoEditPage extends StatefulWidget {
  final CandidateViewModel viewModel;
  const CandidateInfoEditPage({super.key, required this.viewModel});

  @override
  State<CandidateInfoEditPage> createState() => _CandidateInfoEditPageState();
}

class _CandidateInfoEditPageState extends State<CandidateInfoEditPage> {
  late String _avatarUrl;
  late String _username = "";
  late Gender _gender;
  late JobStatus _jobStatus;

  final BizService _bizService = BizService(); // 实例化 Service

  @override
  void initState() {
    super.initState();
    final basicInfo = widget.viewModel.currentUserBasicInfo;
    final candidateInfo = widget.viewModel.currentCandidateInfo;
    _avatarUrl = basicInfo?.userAvatar ?? "";
    _username = basicInfo?.username ?? "";
    _gender = basicInfo?.gender ?? Gender.unknow;
    _jobStatus = candidateInfo?.jobStatus ?? JobStatus.avaliable;
  }

  Future<void> _handleAvatarUpload(Uint8List fileBytes, String filename) async {
    try {
      final req = UploadFileRequest(
        filename: filename,
        fileType: FileType.userAvatar,
        file: fileBytes,
      );

      final resp = await _bizService.uploadFile(req);

      if (resp.success) {
        setState(() {
          _avatarUrl = resp.fileLink;
        });
        debugPrint("Avatar uploaded: ${resp.fileLink}");
      }
    } on BusinessException catch (e) {
      ToastUtils.showErrorMsg(e.message);
    } on Exception {
      ToastUtils.showErrorMsg('网络异常，请稍后重试');
    }
  }

  Future<void> _handleSave() async {
    await widget.viewModel.editCandidateBasicInfo(
      EditCandidateBasicInfoRequest(
        username: _username,
        avatar: _avatarUrl,
        status: _jobStatus,
        gender: _gender,
      ),
    );

    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissWrapper(
      child: Scaffold(
        // 绑定保存事件
        bottomNavigationBar: EditSaveBtn(onEdit: _handleSave),
        body: SafeArea(
          minimum: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 60.h,
            bottom: 10.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                EditAppBar(
                  titleName: AppLocalizations.of(context)!.profileTitle,
                ),

                32.verticalSpace,

                // 头像组件：集成上传回调
                CustomAvatarUpload(
                  width: 160.w, // 注意参数名修正为 width
                  height: 160.h,
                  radius: 80.r, // 注意参数名修正为 radius
                  iconSize: 9.sp, // 稍微调大了图标
                  avatar: _avatarUrl, // 使用本地状态 _avatarUrl (可能是新上传的，也可能是旧的)
                  onImageSelected: _handleAvatarUpload, // 绑定上传逻辑
                ),

                20.verticalSpace,

                CustomDivider(thickness: 0.3),

                20.verticalSpace,

                // 姓名输入
                CustomInput(
                  height: 50.h,
                  backgroundColor: Theme.of(context).colorScheme.inverseSurface,
                  title: AppLocalizations.of(context)!.nameText,
                  defaultValue: _username, // 初始值
                  onChanged: (value) {
                    // 更新姓名状态
                    _username = value;
                  },
                ),

                20.verticalSpace,

                ..._buildGenderAndJobStatus(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildGenderAndJobStatus() {
    return <Widget>[
      // 性别选择
      CustomSelectInput<Gender>(
        title: AppLocalizations.of(context)!.genderText,
        value: _gender, // 绑定状态
        hintText: "请选择",
        options: [
          SelectOption(
            label: AppLocalizations.of(context)!.maleText,
            value: Gender.male,
            icon: Icons.male,
            iconColor: Colors.blue,
          ),
          SelectOption(
            label: AppLocalizations.of(context)!.femaleText,
            value: Gender.female,
            icon: Icons.female,
            iconColor: Colors.pink,
          ),
        ],
        onSelected: (newValue) {
          setState(() {
            _gender = newValue;
          });
        },
      ),

      20.verticalSpace,

      CustomSelectInput<JobStatus>(
        title: AppLocalizations.of(context)!.jobStatusTitle,
        value: _jobStatus,
        hintText: "请选择",
        options:
            JobStatus.values
                .where((e) => e != JobStatus.unknown)
                .map(
                  (status) => SelectOption(
                    label: status.getMultiLanguageString(context),
                    value: status,
                    icon: Icons.circle,
                    iconColor: status.color,
                  ),
                )
                .toList(),
        onSelected: (newValue) {
          setState(() {
            _jobStatus = newValue;
          });
        },
      ),
    ];
  }
}
