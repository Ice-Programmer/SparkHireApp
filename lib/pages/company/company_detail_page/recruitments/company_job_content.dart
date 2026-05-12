import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/clickable_search_bar.dart';
import 'package:spark_hire_app/model/recruitment/query_recruitment_page.dart';
import 'package:spark_hire_app/pages/job/job_home_page/components/recruitment_info_card.dart';
import 'package:spark_hire_app/pages/job/job_home_page/view_model/recruitment_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// 公司职位列表 todo 优化
class CompanyJobContent extends StatefulWidget {
  final int companyId;
  const CompanyJobContent({super.key, required this.companyId});

  @override
  State<CompanyJobContent> createState() => _CompanyJobContentState();
}

class _CompanyJobContentState extends State<CompanyJobContent> {
  final RecruitmentViewModel _viewModel = RecruitmentViewModel();

  @override
  void initState() {
    super.initState();
    RecuritmentCondition req = RecuritmentCondition(
      companyId: widget.companyId
    );
    _viewModel.refresh(condition: req);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<RecruitmentViewModel>(
        builder: (context, viewModel, child) {
          return Column(
            children: [
              ClickableSearchButton(
                onTap: () {},
                hintText: AppLocalizations.of(context)!.searchText,
              ),

              20.verticalSpace,

              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: viewModel.recruitmentInfoList.length,
                separatorBuilder: (context, index) => 16.verticalSpace,
                itemBuilder: (context, index) {
                  return RecruitmentInfoCard(
                    recruitmentInfo: viewModel.recruitmentInfoList[index],
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
