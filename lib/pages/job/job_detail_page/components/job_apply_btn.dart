import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/custom_bottom_sheet_wrapper.dart';

import 'package:spark_hire_app/components/custom_button.dart';
import 'package:spark_hire_app/pages/job/job_detail_page/components/apply_dialog.dart';
import 'package:spark_hire_app/pages/job/job_detail_page/view_model/job_apply_view_model.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class JobApplyBtn extends StatefulWidget {
  final bool hasApplied;
  final int recruitmentId;
  const JobApplyBtn({
    super.key,
    required this.hasApplied,
    required this.recruitmentId,
  });

  @override
  State<JobApplyBtn> createState() => _JobApplyBtnState();
}

class _JobApplyBtnState extends State<JobApplyBtn> {
  final JobApplyViewModel _viewModel = JobApplyViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.initState(widget.hasApplied);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 25.h),
        child: Consumer<JobApplyViewModel>(
          builder: (context, viewModel, child) {
            return CustomButton(
              textColor: Theme.of(context).colorScheme.onPrimary,
              btnWidth: double.infinity,
              btnHeight: 52.h,
              fontSize: 16.sp,
              borderRadius: 30.r,
              title:
                  viewModel.hasApplied
                      ? "已投递岗位"
                      : AppLocalizations.of(context)!.applyJobText,
              backgroundColor: Theme.of(context).colorScheme.primary,
              disable: _viewModel.hasApplied || _viewModel.isLoading,
              onPressed: () => _showIOSBottomSheet(context),
            );
          },
        ),
      ),
    );
  }

  Future<void> _showIOSBottomSheet(BuildContext context) async {
    final bool? isConfirmed = await CustomBottomSheetWrapper.show<bool>(
      context: context,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: _buildIOSConfirmSheetContent(),
        ),
      ),
    );

    if (isConfirmed != true || !mounted) return;

    final success = await _viewModel.apply(widget.recruitmentId);

    if (!context.mounted) return;

    if (success) {
      showDialog(context: context, builder: (_) => const ApplyDialog());
    } else if (_viewModel.errorMessage != null) {
      ToastUtils.showErrorMsg("申请失败，请稍后重试");
    }
  }

  List<Widget> _buildIOSConfirmSheetContent() {
    return <Widget>[
      /// Icon
      Container(
        width: 72.w,
        height: 72.w,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withAlpha(40),
          shape: BoxShape.circle,
        ),
        child: Icon(
          CupertinoIcons.paperplane_fill,
          color: Theme.of(context).colorScheme.primary,
          size: 34.sp,
        ),
      ),

      20.verticalSpace,

      /// Title
      Text(
        '确认投递',
        style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
      ),

      10.verticalSpace,

      /// Description
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Text(
          '投递后，企业将会收到您的简历与相关信息，请确认是否继续申请该职位。',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.sp,
            height: 1.5,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ),

      25.verticalSpace,

      /// Confirm Button
      CustomButton(
        textColor: Theme.of(context).colorScheme.onPrimary,
        btnWidth: double.infinity,
        btnHeight: 54.h,
        fontSize: 17.sp,
        title: '确认投递',
        borderRadius: 18.r,
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          Navigator.pop(context, true);
        },
      ),

      15.verticalSpace,

      /// Cancel Button
      CustomButton(
        textColor: Colors.black87,
        btnWidth: double.infinity,
        btnHeight: 54.h,
        fontSize: 17.sp,
        backgroundColor: Colors.grey.shade100,
        title: '取消',
        fontWeight: FontWeight.w400,
        borderRadius: 18.r,
        onPressed: () {
          // 关闭当前弹窗并返回 false
          Navigator.pop(context, false);
        },
      ),
    ];
  }
}
