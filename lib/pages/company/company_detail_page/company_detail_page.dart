import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/model/company/company_info.dart';
import 'package:spark_hire_app/model/company/fetch_company_info.dart';
import 'package:spark_hire_app/pages/company/company_detail_page/components/company_description_content.dart';
import 'package:spark_hire_app/pages/company/company_detail_page/components/company_info_header.dart';
import 'package:spark_hire_app/service/company_service.dart';
import 'package:spark_hire_app/utils/toast_util.dart';

class CompanyDetailPage extends StatefulWidget {
  final int companyId;
  const CompanyDetailPage({super.key, required this.companyId});

  @override
  State<CompanyDetailPage> createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage>
    with SingleTickerProviderStateMixin {
  final CompanyService _service = CompanyService();
  bool _isLoading = false;
  CompanyInfo? _companyInfo;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    loadCompanyInfo(companyId: widget.companyId);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> loadCompanyInfo({required int companyId}) async {
    setState(() => _isLoading = true);
    try {
      final req = FetchCompanyDetailInfoRequest(companyId: companyId);
      final response = await _service.fetchCompanyDetailInfo(req);
      setState(() => _companyInfo = response.companyInfo);
    } catch (e) {
      ToastUtils.showErrorMsg("获取公司信息失败: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading || _companyInfo == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.white, // body 的背景色
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // 1. 伸缩头部
            CompanyInfoHeader(companyInfo: _companyInfo!),

            // 2. 吸顶 TabBar
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  indicatorSize: TabBarIndicatorSize.label,
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  tabs: const [
                    Tab(text: "简介"),
                    Tab(text: "职位"),
                    Tab(text: "福利"),
                    Tab(text: "薪资"),
                  ],
                ),
              ),
            ),
          ];
        },
        // 3. 标签页内容
        body: Container(
          // 这里继续保留圆角效果，盖在背景色之上
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(26.r)),
          ),
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildScrollPage(CompanyDescriptionContent(companyInfo: _companyInfo!)),
              _buildScrollPage(const Center(child: Text("职位列表"))),
              _buildScrollPage(const Center(child: Text("福利说明"))),
              _buildScrollPage(const Center(child: Text("薪资参考"))),
            ],
          ),
        ),
      ),
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
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white, // 确保吸顶后背景不透明
      alignment: Alignment.centerLeft,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) => false;
}