import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/model/company/company_info.dart';
import 'package:spark_hire_app/model/company/fetch_company_info.dart';
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
  late TabController _tabController;
  bool _isLoading = false;
  CompanyInfo? _companyInfo;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    loadCompanyInfo(companyId: widget.companyId);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
    if (_isLoading) {
      return Placeholder();
    }
    return Scaffold(body: _buildBody());
  }

  Widget _buildBody() {
    return CustomScrollView(
      slivers: [
        // 顶部背景与公司基本信息
        CompanyInfoHeader(companyInfo: _companyInfo!),

        // TabBar 吸顶部分
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
            TabBar(
              controller: _tabController,
              isScrollable: true,
              labelColor: const Color(0xFF6C63FF),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.transparent,
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

        // 内容部分
        SliverPadding(
          padding: EdgeInsets.all(24.w),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              _buildSectionTitle("公司介绍"),

              20.verticalSpace,

              _buildIntroContent(),

              40.verticalSpace,

              _buildSectionTitle("办公环境", trailing: "查看全部"),

              20.verticalSpace,

              _buildOfficeGallery(),
              100.verticalSpace, // 底部留白
            ]),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, {String? trailing}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        if (trailing != null)
          Text(
            trailing,
            style: TextStyle(
              fontSize: 14.sp,
              color: const Color(0xFF2E1AAB),
              fontWeight: FontWeight.w600,
            ),
          ),
      ],
    );
  }

  Widget _buildIntroContent() {
    return Text(
      "网飞网络有限公司是一家专业从事互联网服务的网络公司，成立于2006年，总部位于中国上海市。公司拥有一支高素质、专业化的技术团队和管理团队，致力于为客户提供全方位的互联网解决方案。\n\n公司致力于网页制作与网站开发、电子商务服务、通信系统开发集成、互联网信息服务、技术咨询等服务。",
      style: TextStyle(fontSize: 14.sp, color: Colors.grey[700], height: 1.8),
    );
  }

  Widget _buildOfficeGallery() {
    final List<String> images = ["img1", "img2", "img3", "img4"];
    return SizedBox(
      height: 80.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        separatorBuilder: (_, __) => 12.horizontalSpace,
        itemBuilder: (context, index) {
          return Container(
            width: 80.w,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.r),
              image: const DecorationImage(
                image: NetworkImage(
                  "https://via.placeholder.com/150",
                ), // 请替换为真实图片
                fit: BoxFit.cover,
              ),
            ),
            child:
                index == 3
                    ? Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Text(
                        "8+",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                    : null,
          );
        },
      ),
    );
  }
}

// 辅助类：处理 TabBar 吸顶
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);
  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white, // 吸顶时的背景色
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}
