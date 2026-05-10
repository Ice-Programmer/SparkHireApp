import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/model/forum/post/forum_post.dart';

class ForumPostCard extends StatelessWidget {
  final ForumPostInfo postInfo;

  const ForumPostCard({super.key, required this.postInfo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("/forum/detail");
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.6),
            width: 0.4,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 第一行：头像、标题和收藏按钮
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 用户头像
                CacheImage(
                  height: 38.h,
                  width: 38.w,
                  imageUrl: postInfo.creatorInfo.userAvatar,
                  borderRadius: 20.r,
                ),

                12.horizontalSpace,

                // 名称
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 名称
                      Text(
                        postInfo.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      4.verticalSpace,

                      // 作者
                      Text(
                        '@${postInfo.creatorInfo.username}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ),

                // 收藏图标
                Icon(
                  Icons.bookmarks_outlined,
                  color: Colors.grey[400],
                  size: 22.r,
                ),
              ],
            ),

            10.verticalSpace,

            // 第三行 post 描述
            Text(
              postInfo.content,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),

            10.verticalSpace,

            /// 底部数据
            Row(
              children: [
                _buildMeta(Icons.thumb_up_alt_outlined, "1324"),

                20.horizontalSpace,

                _buildMeta(Icons.mode_comment_outlined, "32"),

                20.horizontalSpace,

                _buildMeta(Icons.remove_red_eye_outlined, "2.3k"),

                const Spacer(),

                Text(
                  "2 小时前",
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey[500]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeta(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),

        6.horizontalSpace,

        Text(text, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
