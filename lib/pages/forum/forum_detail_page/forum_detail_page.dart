import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:spark_hire_app/components/custom_divider.dart';
import 'package:spark_hire_app/components/custom_markdown.dart';
import 'package:spark_hire_app/components/custom_tag.dart';
import 'package:spark_hire_app/pages/forum/forum_detail_page/components/comment_bottom_bar.dart';
import 'package:spark_hire_app/pages/forum/forum_detail_page/components/comment_card.dart';
import 'package:spark_hire_app/pages/forum/forum_detail_page/components/creator_content.dart';
import 'package:spark_hire_app/pages/forum/forum_detail_page/view_model/forum_post_view_model.dart';

class ForumDetailPage extends StatefulWidget {
  final int postId;
  const ForumDetailPage({super.key, required this.postId});

  @override
  State<ForumDetailPage> createState() => _ForumDetailPageState();
}

class _ForumDetailPageState extends State<ForumDetailPage> {
  final ForumPostDetailViewModel _viewModel = ForumPostDetailViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.loadPostInfo(postId: widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    final comments = [
      {
        "name": "墨染 UI",
        "level": "Lv.4 · 资深设计师",
        "content": "非常实用的建议！特别是讲好设计故事这一点，我之前的作品集就是太偏重于结果展示，忽略了过程。",
        "likes": "24",
        "time": "2天前",
        "isAuthor": false,
      },
      {
        "name": "Grace设计师",
        "level": "Lv.5 · 高级设计师",
        "content": "请问作品集的排版有什么推荐的工具吗？",
        "likes": "12",
        "time": "1天前",
        "isAuthor": false,
      },
    ];

    return Scaffold(
      /// 输入框
      bottomNavigationBar: CommentBottomBar(),
      body: SafeArea(
        minimum: EdgeInsets.all(20.w),
        child: ChangeNotifierProvider.value(
          value: _viewModel,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 顶部导航
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: Icon(Icons.arrow_back_ios_new, size: 28.sp),
                      onTap: () => context.pop(),
                    ),
                    Row(
                      children: [
                        Icon(Icons.bookmark_border, size: 30.sp),

                        18.horizontalSpace,

                        Icon(Icons.more_horiz, size: 30.sp),
                      ],
                    ),
                  ],
                ),

                20.verticalSpace,

                _buildPostContent(),

                10.verticalSpace,

                Text(
                  "2天前 · 2.3K 浏览",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.outline,
                    fontSize: 13.sp,
                  ),
                ),

                10.verticalSpace,

                CustomDivider(thickness: 0.4),

                10.verticalSpace,

                /// 评论标题
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "全部评论 (3)",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Row(
                      children: [
                        Text(
                          "最热",
                          style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        ),
                        Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                      ],
                    ),
                  ],
                ),

                20.verticalSpace,

                ...comments.map((comment) => CommentCard(comment: comment)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPostContent() {
    return Consumer<ForumPostDetailViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading || viewModel.postInfo == null) {
          return Center(child: CircularProgressIndicator());
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 标题
            Text(
              viewModel.postInfo!.title,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                height: 1.35,
              ),
            ),

            20.verticalSpace,

            /// 作者信息
            CreatorContent(creatorInfo: viewModel.postInfo!.creatorInfo),

            18.verticalSpace,

            CustomMarkdown(
              text: "何意味",
              color: Theme.of(context).colorScheme.onSurface,
            ),

            10.verticalSpace,

            /// 标签
            CustomTag(
              fontSize: 12.sp,
              text: "# 作品集分享",
              color: Theme.of(context).colorScheme.primary,
              horizontalPadding: 10.w,
              verticalPadding: 5.h,
              borderRadius: 20.r,
            ),
          ],
        );
      },
    );
  }
}
