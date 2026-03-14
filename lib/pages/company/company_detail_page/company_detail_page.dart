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

  int _selectIndex = 0;

  @override
  void initState() {
    super.initState();
    loadCompanyInfo(companyId: widget.companyId);
  }

  Future<void> loadCompanyInfo({required int companyId}) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final req = FetchCompanyDetailInfoRequest(companyId: companyId);
      final response = await _service.fetchCompanyDetailInfo(req);

      setState(() {
        _companyInfo = response.companyInfo;
      });
    } catch (e) {
      ToastUtils.showErrorMsg("获取公司信息失败: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading || _companyInfo == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F7FB),
        body: CustomScrollView(
          slivers: [
            /// Header
            CompanyInfoHeader(companyInfo: _companyInfo!),

            /// TabBar 吸顶
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                TabBar(
                  onTap: (value) {
                    setState(() {
                      _selectIndex = value;
                    });
                  },
                  isScrollable: true,
                  labelColor: Theme.of(context).colorScheme.primary,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Theme.of(context).colorScheme.primary,
                  indicatorWeight: 2,
                  dividerColor: Colors.transparent,
                  tabAlignment: TabAlignment.start,
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  tabs: const [
                    Tab(text: "简介"),
                    Tab(text: "职位"),
                    Tab(text: "福利"),
                    Tab(text: "薪资"),
                  ],
                ),
              ),
            ),

            /// 内容区域
            SliverToBoxAdapter(
              child: Transform.translate(
                offset: Offset(0, -20.h),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 24.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(26.r),
                    ),
                  ),
                  child: IndexedStack(
                    index: _selectIndex,
                    children: [
                      CompanyDescriptionContent(companyInfo: _companyInfo!),
                      const Center(child: Text("职位")),
                      const Center(child: Text("福利")),
                      const Center(child: Text("薪资")),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
      color: Colors.white,
      alignment: Alignment.centerLeft,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}