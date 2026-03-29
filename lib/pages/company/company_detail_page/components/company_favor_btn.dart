import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/custom_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:spark_hire_app/pages/company/company_detail_page/view_model/company_view_model.dart';

class CompanyFollowButton extends StatelessWidget {
  final double btnWidth;

  const CompanyFollowButton({super.key, required this.btnWidth});

  @override
  Widget build(BuildContext context) {
    // 监听 ViewModel
    final viewModel = context.watch<CompanyViewModel>();
    final info = viewModel.companyInfo;

    if (info == null) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;

    final bool isFollowed = info.hasFavor;
    final String btnText = isFollowed ? '已关注' : localizations.followText;
    final Color bgColor = isFollowed ? Colors.grey.shade300 : Colors.white;
    final Color textColor =
        isFollowed ? Colors.grey.shade700 : theme.colorScheme.primary;

    return CustomButton(
      onPressed:
          viewModel.isActionLoading ? null : () => viewModel.toggleFollow(),
      textColor: textColor,
      btnWidth: btnWidth,
      btnHeight: 44.h,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      title: viewModel.isActionLoading ? "..." : btnText, // 也可以在这里换成转圈
      isShadow: false,
      backgroundColor: bgColor,
    );
  }
}
