import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/empty_state.dart';
import 'package:spark_hire_app/pages/company/company_detail_page/components/benefit_card.dart';
import 'package:spark_hire_app/pages/company/company_detail_page/benefits/company_benefit_content_skeleton.dart';
import 'package:spark_hire_app/pages/company/company_detail_page/view_model/company_benfit_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompanyBenefitContent extends StatefulWidget {
  final int companyId;
  const CompanyBenefitContent({super.key, required this.companyId});

  @override
  State<CompanyBenefitContent> createState() => _CompanyBenefitContentState();
}

class _CompanyBenefitContentState extends State<CompanyBenefitContent> {
  final CompanyBenefitViewModel _viewModel = CompanyBenefitViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.loadCompanyBenefitList(companyId: widget.companyId);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: _buildBodyUI(),
    );
  }

  Widget _buildBodyUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.benefitTitle,
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),

        10.verticalSpace,

        Text(
          AppLocalizations.of(context)!.benefitSubTitle,
          style: TextStyle(
            fontSize: 14.sp,
            color: Theme.of(context).colorScheme.outline,
          ),
        ),

        20.verticalSpace,

        Consumer<CompanyBenefitViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return CompanyBenefitContentSkeleton();
            }

            if (viewModel.benefitList == null ||
                viewModel.benefitList!.isEmpty) {
              return EmptyState(
                title: AppLocalizations.of(context)!.noBenefitText,
              );
            }

            return ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: viewModel.benefitList!.length,
              separatorBuilder: (context, index) => 20.verticalSpace,
              itemBuilder: (context, index) {
                return BenefitCard(benefitInfo: viewModel.benefitList![index]);
              },
            );
          },
        ),

        40.verticalSpace,
      ],
    );
  }
}
