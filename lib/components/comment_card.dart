import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:spark_hire_app/components/cache_image.dart';
import 'package:spark_hire_app/model/company/comment.dart';

/// todo 待完善，可新增 reply 内容
class CommentCard extends StatelessWidget {
  final CommentInfo comment;
  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final dateStr = DateFormat(
      'yyyy-MM-dd',
    ).format(DateTime.fromMillisecondsSinceEpoch(comment.createdAt * 1000));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 头像
        CacheImage(
          imageUrl: comment.creatorInfo.userAvatar,
          height: 36.w,
          width: 36.h,
          borderRadius: 18.r,
        ),

        12.horizontalSpace,

        // 内容区
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 名字与日期
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    comment.creatorInfo.username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    dateStr,
                    style: TextStyle(color: Colors.grey, fontSize: 11.sp),
                  ),
                ],
              ),

              6.verticalSpace,

              // 回复对象标记
              if (comment.replyUserInfo != null)
                Padding(
                  padding: EdgeInsets.only(bottom: 4.h),
                  child: Text(
                    "@${comment.replyUserInfo!.username}",
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

              // 评论主体
              Text(
                comment.content,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: theme.colorScheme.onSurface,
                  height: 1.5,
                ),
              ),

              12.verticalSpace,

              // 操作栏（点赞、回复数）
              Row(
                children: [
                  _IconLabel(
                    icon: Icons.thumb_up_off_alt,
                    label: comment.favoriteCnt.toString(),
                  ),

                  24.horizontalSpace,

                  _IconLabel(
                    icon: Icons.chat_bubble_outline_rounded,
                    label: comment.replyNum?.toString() ?? "0",
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _IconLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  const _IconLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16.sp, color: Colors.grey[600]),
        SizedBox(width: 4.w),
        Text(label, style: TextStyle(fontSize: 12.sp, color: Colors.grey[600])),
      ],
    );
  }
}
