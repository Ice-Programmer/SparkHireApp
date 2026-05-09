import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/cache_image.dart';

class ForumCard extends StatelessWidget {
  const ForumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                // 公司头像
                CacheImage(
                  height: 38.h,
                  width: 38.w,
                  imageUrl:
                      "https://ice-spark-hire.tos-cn-shanghai.volces.com/user/avatar/1774001433_image_picker_478573B1-1306-4D34-9987-053098E32B60-24996-00001F5A62C4FB82.jpg",
                  borderRadius: 20.r,
                ),

                12.horizontalSpace,

                // 职位信息
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 职位名称
                      Text(
                        "设计师如何提升作品集的竞争力",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      4.verticalSpace,

                      // 公司名称
                      Text(
                        "Ice Programmer",
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

            // 第三行：职位描述
            Text(
              "作品集是设计师的敲门砖，如何打造一个让人眼前一亮的作品集？分享一些实用建议和案例分析...",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.grey[600],
                height: 1.5,
              ),
            ),

            16.verticalSpace,

            // 第四行：地点和薪资
            /// 底部数据
            Row(
              children: [
                _buildMeta(Icons.thumb_up_alt_outlined, "1324"),
                const SizedBox(width: 20),
                _buildMeta(Icons.mode_comment_outlined, "32"),
                const SizedBox(width: 20),
                _buildMeta(Icons.remove_red_eye_outlined, "2.3k"),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCompanyImage({
    required String icon,
    required BuildContext context,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.04),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(39.r),
      ),
      padding: EdgeInsets.all(8.r),
      child: CacheImage(
        height: 26.h,
        width: 26.w,
        imageUrl: icon,
        borderRadius: 6.r,
      ),
    );
  }

  Widget _buildMeta(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
