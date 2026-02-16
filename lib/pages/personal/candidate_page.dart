import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/custom_divider.dart';
import 'package:spark_hire_app/model/candidate/get_current_candidate.dart';
import 'package:spark_hire_app/model/user/fetch_current_user.dart';
import 'package:spark_hire_app/pages/personal/basic_info/candidate_info_card.dart';
import 'package:spark_hire_app/pages/personal/contract_info/contract_info_card.dart';
import 'package:spark_hire_app/pages/personal/education_exp/education_info_card.dart';
import 'package:spark_hire_app/pages/personal/summary_info/summary_info_card.dart';
import 'package:spark_hire_app/pages/personal/view_model/candidate_view_model.dart';
import 'package:spark_hire_app/pages/personal/view_model/education_exp_view_model.dart';
import 'package:spark_hire_app/pages/personal/view_model/user_view_model.dart';

class CandidatePage extends StatefulWidget {
  const CandidatePage({super.key});

  @override
  State<CandidatePage> createState() => _CandidatePageState();
}

class _CandidatePageState extends State<CandidatePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserViewModel()..loadCurrentUser(),
        ),
        ChangeNotifierProvider(
          create: (_) => CandidateInfoViewModel()..loadCurrentCandidate(),
        ),
        ChangeNotifierProvider(
          create: (_) => EducationExpViewModel()..loadCurrentEducationExp(),
        ),
      ],
      // builder 使得下方的 child 可以获取到刚刚创建的 Providers
      builder: (context, child) {
        return _buildBody(context);
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(20.w),
      child: ListView(
        children: [
          _buildTitle(context),
          20.verticalSpace,

          Selector2<UserViewModel, CandidateInfoViewModel, (UserBasicInfo?, CandidateInfo?)>(
            selector: (_, userVm, candidateVm) => (
              userVm.currentUserBasicInfo,
              candidateVm.currentCandidateInfo
            ),
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
          5.verticalSpace,

          Selector<CandidateInfoViewModel, ContractInfo?>(
            selector: (_, vm) => vm.contractInfo,
            builder: (_, contractInfo, __) {
              return ContractInfoCard(contractInfo: contractInfo);
            },
          ),

          3.verticalSpace,

          // 单独监听 CandidateInfoViewModel 的 profile
          Consumer<CandidateInfoViewModel>(
            builder: (context, vm, _) {
              return SummaryInfoCard(
                profile: vm.profile, 
                viewModel: vm, 
              );
            },
          ),

          3.verticalSpace,

          Consumer<EducationExpViewModel>(
            builder: (context, vm, _) {
              return EducationInfoCard(
                educationExpList: vm.educationExpList,
                viewModel: vm, // 这里传入拆分后的 EducationExpViewModel
              );
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