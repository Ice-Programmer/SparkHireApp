import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spark_hire_app/components/empty_state.dart';
import 'package:spark_hire_app/pages/job/job_home_page/components/recruitment_info_card.dart';
import 'package:spark_hire_app/pages/job/job_home_page/view_model/recruitment_view_model.dart';

class RelativeJobContent extends StatelessWidget {
  final RecruitmentViewModel viewModel;
  const RelativeJobContent({super.key, required this.viewModel});

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "🔥 ${AppLocalizations.of(context)!.popularJobText}",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),

        // 查看全部
        GestureDetector(
          onTap: () {},
          child: Text(
            AppLocalizations.of(context)!.viewAllText,
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
    return Column(
      children: [
        // 标题
        _buildTitle(context),

        20.verticalSpace,

        // 求职卡片列表
        _buildRecruitmentCardList(context),
      ],
    );
  }

  Widget _buildRecruitmentCardList(BuildContext context) {
    // 1. 首次加载的 loading
    if (viewModel.isLoading && viewModel.recruitmentInfoList.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 40.h),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    // 2. 空状态
    if (viewModel.recruitmentInfoList.isEmpty) {
      return EmptyState(title: "暂无招聘信息", subTitle: "稍后再来看看吧");
    }

    // 3. 列表内容 + 底部加载状态
    return Column(
      children: [
        // 职位列表
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: viewModel.recruitmentInfoList.length,
          separatorBuilder: (context, index) => 16.verticalSpace,
          itemBuilder: (context, index) {
            return RecruitmentInfoCard(
              recruitmentInfo: viewModel.recruitmentInfoList[index],
            );
          },
        ),

        // 底部加载状态提示区
        _buildLoadMoreIndicator(),
      ],
    );
  }

  // 构建底部的加载指示器
  Widget _buildLoadMoreIndicator() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, bottom: 40.h),
      child: Center(
        child: Builder(
          builder: (context) {
            if (viewModel.isLoadingMore) {
              // 正在加载下一页
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20.r,
                    height: 20.r,
                    child: const CircularProgressIndicator(strokeWidth: 2),
                  ),
                  10.horizontalSpace,
                  Text(
                    AppLocalizations.of(context)!.loadingMoreText,
                    style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                  ),
                ],
              );
            } else if (!viewModel.hasMore) {
              // 已经没有更多数据了
              return Text(
                AppLocalizations.of(context)!.reachEndText,
                style: TextStyle(color: Colors.grey[400], fontSize: 13.sp),
              );
            } else {
              // 占位，防止高度跳动
              return SizedBox(height: 20.h);
            }
          },
        ),
      ),
    );
  }
}
