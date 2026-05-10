import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentCard extends StatelessWidget {
  final Map comment;

  const CommentCard({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 头像
              CircleAvatar(
                radius: 18.r,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Icon(Icons.person, color: Colors.white),
              ),

              14.horizontalSpace,

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 名字
                    Text(
                      comment["name"],
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    10.verticalSpace,

                    Text(comment["content"], style: TextStyle(fontSize: 14.sp)),

                    10.verticalSpace,

                    Row(
                      children: [
                        Text(
                          comment["time"],
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),

                        16.horizontalSpace,

                        Text(
                          "回复",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                        
                        const Spacer(),

                        Icon(
                          Icons.thumb_up_alt_outlined,
                          size: 18,
                          color: Theme.of(context).colorScheme.outline,
                        ),

                        6.horizontalSpace,

                        Text(
                          comment["likes"],
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ],
                    ),

                    /// 回复框
                    if (comment["name"] == "墨染 UI")
                      Container(
                        margin: EdgeInsets.only(top: 10.h),
                        padding: EdgeInsets.all(18.h),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.inverseSurface,
                          borderRadius: BorderRadius.circular(18.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "设计小助手",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),

                                8.horizontalSpace,

                                Text(
                                  "(作者)",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            10.verticalSpace,

                            Text(
                              "很高兴对你有帮助！过程展示确实能让作品集更有说服力 💪",
                              style: TextStyle(height: 1.6),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),

          10.verticalSpace,

          Divider(color: Colors.grey.shade200),
        ],
      ),
    );
  }
}
