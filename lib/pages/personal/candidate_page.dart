import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/custom_divider.dart';
import 'package:spark_hire_app/model/candidate/get_current_candidate.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';
import 'package:spark_hire_app/pages/personal/candidate_info_vm.dart';
import 'package:spark_hire_app/pages/personal/components/candidate_title_card/candidate_info_card.dart';
import 'package:spark_hire_app/pages/personal/components/contract_card/contract_info_card.dart';

class CandidatePage extends StatefulWidget {
  const CandidatePage({super.key});

  @override
  State<CandidatePage> createState() => _CandidatePageState();
}

class _CandidatePageState extends State<CandidatePage> {
  final CandidateViewModel _viewModel = CandidateViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.loadCurrentUser();
    _viewModel.loadCurentCandidate();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(20.w),
      child: ChangeNotifierProvider.value(
        value: _viewModel,
        child: ListView(
          children: [
            _buildTitle(),

            20.verticalSpace,

            // Basic Info
            Selector<CandidateViewModel, UserBasicInfo?>(
              builder: (context, userInfo, child) {
                return CandidateInfoCard(userBasicInfo: userInfo);
              },
              selector: (_, viewModel) => viewModel.currentUserBasicInfo,
            ),

            10.verticalSpace,

            CustomDivider(thickness: 0.3),

            10.verticalSpace,

            // Contract Info
            Selector<CandidateViewModel, ContractInfo?>(
              builder: (context, contractInfo, child) {
                return ContractInfoCard(contractInfo: contractInfo);
              },
              selector: (_, viewModel) => viewModel.contractInfo,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
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
