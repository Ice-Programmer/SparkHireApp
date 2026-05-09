import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/clickable_search_bar.dart';
import 'package:spark_hire_app/pages/forum/forum_page/components/forum_card.dart';
import 'package:spark_hire_app/pages/forum/forum_page/components/popular_topic.dart';
import 'package:spark_hire_app/pages/forum/forum_page/components/title_content.dart';
import 'package:spark_hire_app/pages/forum/forum_page/components/welcome_card.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        minimum: EdgeInsets.all(20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 顶部
              const TitleContent(),

              24.verticalSpace,

              /// 搜索框
              ClickableSearchButton(onTap: () {}, hintText: "搜索帖子、话题或用户"),

              20.verticalSpace,

              /// Tab
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabItem(title: "推荐", active: true),
                  TabItem(title: "最新"),
                  TabItem(title: "关注"),
                  TabItem(title: "问答"),
                  TabItem(title: "分享"),
                  TabItem(title: "求职"),
                  TabItem(title: "活动"),
                ],
              ),

              20.verticalSpace,

              /// Banner
              const ForumWelcomeCard(),

              20.verticalSpace,

              /// 热门话题
              const PopularTopic(),

              10.verticalSpace,

              /// 帖子列表
              ForumCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String title;
  final bool active;

  const TabItem({super.key, required this.title, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 17,
            fontWeight: active ? FontWeight.bold : FontWeight.w500,
            color: active ? Colors.black : Colors.grey,
          ),
        ),
        const SizedBox(height: 8),
        if (active)
          Container(
            width: 28,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFF4B2AEF),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
      ],
    );
  }
}
