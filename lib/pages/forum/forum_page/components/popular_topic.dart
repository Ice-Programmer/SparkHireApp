import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PopularTopic extends StatelessWidget {
  const PopularTopic({super.key});

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "🔥 热门话题",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            AppLocalizations.of(context)?.viewAllText ?? "查看全部",
            style: TextStyle(
              fontSize: 15.sp,
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // 模拟数据源
    final List<Map<String, dynamic>> topics = [
      {"title": "设计趋势", "count": 128},
      {"title": "作品集分享", "count": 96},
      {"title": "面试经验", "count": 76},
      {"title": "自由讨论", "count": 54},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),

        10.verticalSpace,

        SizedBox(
          height: 78.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            // 增加内边距，防止阴影或边框被裁剪
            padding: EdgeInsets.symmetric(vertical: 2.h),
            itemCount: topics.length,
            separatorBuilder: (_, __) => SizedBox(width: 16.w),
            itemBuilder: (context, index) {
              final topic = topics[index];
              return TopicCard(
                hashtag: '#',
                title: topic["title"],
                discussionCount: topic["count"],
              );
            },
          ),
        ),
      ],
    );
  }
}

class TopicCard extends StatelessWidget {
  final String hashtag;
  final String title;
  final int discussionCount;

  const TopicCard({
    super.key,
    required this.hashtag,
    required this.title,
    required this.discussionCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
          width: 0.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hashtag,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                ),
              ),

              6.horizontalSpace,

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),

                  6.verticalSpace,

                  Text(
                    '$discussionCount 讨论',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
