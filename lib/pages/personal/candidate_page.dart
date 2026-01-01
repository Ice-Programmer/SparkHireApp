import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/custom_divider.dart';
import 'package:spark_hire_app/model/candidate/get_current_candidate.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';
import 'package:spark_hire_app/pages/personal/candidate_info_vm.dart';
import 'package:spark_hire_app/pages/personal/basic_info/candidate_info_card.dart';
import 'package:spark_hire_app/pages/personal/contract_info/contract_info_card.dart';
import 'package:spark_hire_app/pages/personal/summary_info/summary_info_card.dart';

class CandidatePage extends StatefulWidget {
  const CandidatePage({super.key});

  @override
  State<CandidatePage> createState() => _CandidatePageState();
}

class _CandidatePageState extends State<CandidatePage> {
  final CandidateViewModel _viewModel = CandidateViewModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (_) =>
              _viewModel
                ..loadCurrentUser()
                ..loadCurrentCandidate(),
      child: _buildBody(context, _viewModel),
    );
  }

  Widget _buildBody(BuildContext context, CandidateViewModel vm) {
    return SafeArea(
      minimum: EdgeInsets.all(20.w),
      child: ListView(
        children: [
          _buildTitle(context),
          20.verticalSpace,

          Selector<CandidateViewModel, (UserBasicInfo?, CandidateInfo?)>(
            selector:
                (_, vm) => (vm.currentUserBasicInfo, vm.currentCandidateInfo),
            builder: (_, data, __) {
              final userInfo = data.$1;
              final jobStatus = data.$2;

              return CandidateInfoCard(
                userBasicInfo: userInfo,
                candidateInfo: jobStatus,
              );
            },
          ),

          10.verticalSpace,

          CustomDivider(thickness: 0.3),

          10.verticalSpace,

          Selector<CandidateViewModel, ContractInfo?>(
            selector: (_, vm) => vm.contractInfo,
            builder: (_, contractInfo, __) {
              return ContractInfoCard(contractInfo: contractInfo);
            },
          ),

          10.verticalSpace,

          Selector<CandidateViewModel, String?>(
            selector: (_, vm) => vm.profile,
            builder: (_, profile, __) {
              return SummaryInfoCard(profile: profile, viewModel: _viewModel);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalizations.of(context)!.profileText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
        ),

        Icon(Icons.settings_rounded),
      ],
    );
  }
}
