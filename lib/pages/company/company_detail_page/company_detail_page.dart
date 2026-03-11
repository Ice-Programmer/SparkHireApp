import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyDetailPage extends StatefulWidget {
  final int companyId;
  const CompanyDetailPage({super.key, required this.companyId});

  @override
  State<CompanyDetailPage> createState() => _CompanyDetailPageState();
}

class _CompanyDetailPageState extends State<CompanyDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // 顶部背景与公司基本信息
          _buildSliverHeader(),

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
      ),
    );
  }

  // 构建顶部紫色区域
  Widget _buildSliverHeader() {
    return SliverAppBar(
      expandedHeight: 400.h,
      pinned: true,
      elevation: 0,
      backgroundColor: const Color(0xFF2E1AAB),
      leading: const BackButton(color: Colors.white),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert, color: Colors.white),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF4527A0), Color(0xFF2E1AAB)],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              60.verticalSpace,
              // Logo
              CircleAvatar(
                radius: 40.r,
                backgroundColor: Colors.white,
                child: Text(
                  "N",
                  style: TextStyle(
                    fontSize: 40.sp,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              20.verticalSpace,
              Text(
                "网飞",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              12.verticalSpace,
              Text(
                "9K 粉丝  •  上海，浦东新区",
                style: TextStyle(color: Colors.white70, fontSize: 14.sp),
              ),
              30.verticalSpace,
              // 按钮组
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildHeaderButton("关注", Colors.white, Colors.black),
                  20.horizontalSpace,
                  _buildHeaderButton("访问网站", Colors.white, Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
      // 底部圆角效果
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(30.h),
        child: Container(
          height: 30.h,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderButton(String text, Color bg, Color textColor) {
    return Container(
      width: 140.w,
      height: 44.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
      ),
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
