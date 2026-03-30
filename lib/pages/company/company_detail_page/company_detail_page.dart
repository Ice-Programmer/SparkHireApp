import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/pages/company/company_detail_page/benefits/company_benefit_content.dart';
import 'package:spark_hire_app/pages/company/company_detail_page/comments/company_comments_content.dart';
import 'package:spark_hire_app/pages/company/company_detail_page/description/company_description_content.dart';
import 'package:spark_hire_app/pages/company/company_detail_page/components/company_info_header.dart';
import 'package:spark_hire_app/pages/company/company_detail_page/recruitments/company_job_content.dart';
import 'package:spark_hire_app/pages/company/company_detail_page/view_model/company_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompanyDetailPage extends StatefulWidget {
  final int companyId;
  const CompanyDetailPage({super.key, required this.companyId});

  @override
  State<CompanyDetailPage> createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage>
    with SingleTickerProviderStateMixin {
  final CompanyViewModel _viewModel = CompanyViewModel();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _viewModel.loadCompanyInfo(companyId: widget.companyId);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(value: _viewModel, child: _buildBody());
  }

  Widget _buildBody() {
    return Consumer<CompanyViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading || viewModel.companyInfo == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                // 1. 伸缩头部
                Consumer<CompanyViewModel>(
                  builder: (context, viewModel, child) {
                    return CompanyInfoHeader(
                      companyInfo: viewModel.companyInfo!,
                    );
                  },
                ),

                // 2. 吸顶 TabBar
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverTabBarDelegate(
                    TabBar(
                      controller: _tabController,
                      isScrollable: false,
                      tabAlignment: TabAlignment.fill,
                      labelColor: Theme.of(context).colorScheme.primary,
                      unselectedLabelColor:
                          Theme.of(context).colorScheme.outline,
                      indicatorColor: Theme.of(context).colorScheme.primary,
                      indicatorSize: TabBarIndicatorSize.label,
                      dividerColor: Colors.transparent,
                      tabs: [
                        Tab(
                          text: AppLocalizations.of(context)!.introductionText,
                        ),
                        Tab(text: AppLocalizations.of(context)!.jobText),
                        Tab(text: AppLocalizations.of(context)!.benefitsText),
                        Tab(text: AppLocalizations.of(context)!.commentText),
                      ],
                    ),
                  ),
                ),
              ];
            },
            // 3. 标签页内容
            body: TabBarView(
              controller: _tabController,
              children: [
                _buildScrollPage(
                  CompanyDescriptionContent(
                    companyInfo: _viewModel.companyInfo!,
                  ),
                ),
                _buildScrollPage(CompanyJobContent()),
                _buildScrollPage(
                  CompanyBenefitContent(companyId: widget.companyId),
                ),
                _buildScrollPage(
                  CompanyCommentsContent(companyId: widget.companyId),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // 包装子页面，确保内边距统一
  Widget _buildScrollPage(Widget child) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: child,
    );
  }
}

// TabBar 代理类
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _SliverTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      alignment: Alignment.centerLeft,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) => true;
}
